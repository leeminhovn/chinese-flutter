import 'package:MochiChinese/src/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dtos/user/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserStateInitial()) {
    getInfoUser();
  }
  bool checkExpired (String? expired) {
    if (expired == null) {
      return true;
    }
    List<String> arrayDate = expired.split("-") ;
    int year = arrayDate[0] as int;
    int month = arrayDate[1] as int;
    int day = arrayDate[2] as int;
    DateTime dateNeedCheck = DateTime(year, month, day);
    DateTime dateNow = DateTime.now();
    if ( dateNow.isAfter(dateNeedCheck)) {
      return false;
    }
    return
         true;

  }
  void getInfoUser() async {}

  Future<Map<String, dynamic>?> loginByEmailAction(
      String email, String password) async {
    final Map<String, dynamic> infoUser =
        await UserRepo().loginByEmail(email, password);

    if (infoUser["error"] == "") {
      final bool isOutDateExpired = checkExpired((infoUser["data"] as UserDto).expired_day);

      emit(SuccessLogin(state)..user = infoUser["data"] ..isOutDateExpired = isOutDateExpired);

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
  print(infoUser["error"]);
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
}
