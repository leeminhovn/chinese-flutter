import 'package:MochiChinese/core/constant/user_enum.dart';
import 'package:MochiChinese/src/domain/repositories/user_repository.dart';
import 'package:MochiChinese/src/domain/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dtos/user/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserStateInitial()) {
    getInfoUser();
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

  void getInfoUser() async {}

  Future<Map<String, dynamic>?> loginByEmailAction(
      String email, String password) async {
    final Map<String, dynamic> infoUser =
        await UserRepo().loginByEmail(email, password);

    if (infoUser["error"] == "") {
      final dataUser = infoUser["data"] as UserDto;

      final AccountSubscriptionStatus accountSubscriptionStatus =
          dataUser.expired_day == null
              ? AccountSubscriptionStatus.freeAccount
              : DateTimeHelp.checkExpired(dataUser.expired_day!);

      handleConvertTimeUser(dataUser, accountSubscriptionStatus);

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
      emit(SuccessRegister(state)..user = infoUser["data"]);

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
    final Map<String, dynamic> dataLogout = await UserRepo().logoutUser("");
    // emit();
  }
}
