import 'package:MochiChinese/src/data/data_source/user_data_source.dart';

class UserRepo {
  Future<Map<String, dynamic>> loginByEmail(String email, String password) {
    return UserDataSource()
        .loginByEmail({"email": email, "password": password});
  }

  Future<Map<String, dynamic>> signupByEmail(
      String name, String email, String password) {
    return UserDataSource()
        .signupByEmail({"name": name, "email": email, "password": password});
  }

  Future<Map<String, dynamic>> getUserInfo(String accessToken) async {
    return UserDataSource().getUserInfo(accessToken);
  }

  Future<Map<String, dynamic>> logoutUser(String accessToken) {
    return UserDataSource().logoutUser(accessToken);
  }
}
