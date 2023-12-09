import 'package:MochiChinese/config/hive_box_name.dart';
import 'package:MochiChinese/config/hive_key_data_name.dart';
import 'package:MochiChinese/core/constant/user_enum.dart';
import 'package:MochiChinese/model/hive/userInfo/userInfo.dart';
import 'package:MochiChinese/src/domain/repositories/user_repository.dart';
import 'package:MochiChinese/src/domain/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../data/dtos/user/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserStateInitial()) {
    getInfoUserFromLocalToken();
  }

  void handleConvertTimeUser(
      UserDto dataUser, AccountSubscriptionStatus accountSubscriptionStatus) {
    dataUser.createdAt =
        DateTimeHelp.convertIsoTimeFormatToAsiaTimeFormat(dataUser.createdAt);

    if (accountSubscriptionStatus == AccountSubscriptionStatus.premiumAccount) {
      dataUser.expired_day =
          DateTimeHelp.convertEuropeTimeFormatToAsiaTimeFormat(
              dataUser.expired_day!);
    }
  }

  AccountSubscriptionStatus handleCheckDateExpiredUser(UserDto dataUser) {
    final AccountSubscriptionStatus accountSubscriptionStatus =
        dataUser.expired_day == null
            ? AccountSubscriptionStatus.freeAccount
            : DateTimeHelp.checkExpired(dataUser.expired_day!);
    handleConvertTimeUser(dataUser, accountSubscriptionStatus);

    return accountSubscriptionStatus;
  }

  void handleSaveUserInfoInLocal(UserDto data) async {
    final String accessToken = data.tokens!.accessToken;
    final Box authBox = await Hive.openBox(HiveBoxName().authBox);
    final Box<UserInfo> userInfoBox =
        await Hive.openBox<UserInfo>(HiveBoxName().userInfoBox);
    // userInfoBox.put("userInfo", userInfoBox.);
    userInfoBox.put(
        HiveKeyDataName().userInfo,
        UserInfo(
            email: data.email,
            createdAt: data.createdAt,
            name: data.name,
            expired_day: data.expired_day));

    authBox.put(HiveKeyDataName().accessToken, accessToken);
    authBox.close();
    userInfoBox.close();
  }

  void handleRemoveTokenUserInLocal() {
    var box = Hive.box(HiveBoxName().authBox);

    box.delete('accessToken');
  }

  void getInfoUserFromLocalToken() async {
    emit(LoadingGetProfileUser(state));

    final Box authBox = await Hive.openBox(HiveBoxName().authBox);
    final String accessToken = authBox.get("accessToken", defaultValue: "");
    final Box<UserInfo> userInfoBox =
        await Hive.openBox<UserInfo>(HiveKeyDataName().userInfo);

    print("========>");
    print(accessToken);
    print("=======>");
    print(userInfoBox.get(HiveKeyDataName().userInfo));

    if (accessToken != "") {
      final Map<String, dynamic> userInfo =
          await UserRepo().getUserInfo(accessToken);
      if (userInfo["error"] == "") {
        final UserDto dataUser = userInfo["data"];
        AccountSubscriptionStatus accountSubscriptionStatus =
            handleCheckDateExpiredUser(dataUser);

        handleSaveUserInfoInLocal(dataUser);

        emit(SuccessLogin(state)
          ..user = dataUser
          ..accountSubscriptionStatus = accountSubscriptionStatus);
      }
    }
  }

  Future<Map<String, dynamic>?> loginByEmailAction(
      String email, String password) async {
    final Map<String, dynamic> infoUser =
        await UserRepo().loginByEmail(email, password);

    if (infoUser["error"] == "") {
      final UserDto dataUser = infoUser["data"];

      AccountSubscriptionStatus accountSubscriptionStatus =
          handleCheckDateExpiredUser(dataUser);

      handleSaveUserInfoInLocal(dataUser);

      emit(SuccessLogin(state)
        ..user = dataUser
        ..accountSubscriptionStatus = accountSubscriptionStatus);

      return null;
    } else {
      String errPass = "";
      String errEmail = "";

      if (infoUser["error"].contains("mật khẩu")) {
        errPass = "*Your password is incorrect";
      } else {
        errEmail = "*No account exists for this email";
      }

      return {"email": errEmail, "password": errPass};
    }
  }

  Future<String?> signupByEmailAction(
      String email, String password, String name) async {
    final Map<String, dynamic> infoUser =
        await UserRepo().signupByEmail(name, email, password);

    if (infoUser["error"] == "") {
      final UserDto dataUser = infoUser["data"];

      AccountSubscriptionStatus accountSubscriptionStatus =
          handleCheckDateExpiredUser(dataUser);

      handleSaveUserInfoInLocal(dataUser);

      emit(SuccessRegister(state)
        ..user = infoUser["data"]
        ..accountSubscriptionStatus = accountSubscriptionStatus);

      return null;
    } else {
      String errEmail = "";

      if (infoUser["error"].contains("tồn tại")) {
        errEmail = "*No account exists for this email";
      } else {
        errEmail = "*Error something to login";
      }

      return errEmail;
    }
  }

  Future<void> logoutUser() async {
    final Map<String, dynamic> dataLogout =
        await UserRepo().logoutUser(state.user!.tokens!.accessToken);
    emit(UserStateInitial());
  }
}
