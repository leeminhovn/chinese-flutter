import 'package:MochiChinese/src/domain/repositories/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dtos/user/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserStateInitial()) {
    getInfoUser();
  }

  void getInfoUser() async {}

  Future<Map<String, dynamic>?> loginByEmailAction(
      String email, String password) async {
    final Map<String, dynamic> infoUser =
        await UserRepo().loginByEmail(email, password);

    if (infoUser["error"] == "") {
      emit(SuccessLogin(state)..user = infoUser["data"]);

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
