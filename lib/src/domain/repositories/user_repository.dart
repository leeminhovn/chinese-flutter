import 'package:MochiChinese/src/data/data_source/user_data_source.dart';

class UserRepo {
  Future<Map<String, dynamic>> loginByEmail(String email, String password) {
    return UserDataSource()
        .loginByEmail({"email": email, "password": password});
  }
}
