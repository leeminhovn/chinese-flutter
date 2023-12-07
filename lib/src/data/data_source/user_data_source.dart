import 'package:MochiChinese/src/data/api/endpoints.dart';
import 'package:MochiChinese/src/data/base_data_source/base_data_source.dart';
import 'package:dio/dio.dart';

import '../dtos/user/user.dart';

class UserDataSource extends BaseDataSource {
  Future<Map<String, dynamic>> loginByEmail(Map<String, dynamic> data) async {
    try {
      Response response =
          await appClient.postDio(endPoint: Endpoint.userLogin, data: data);

      if ((response.data["status"]) == 200) {
        UserDto dataConvert = UserDto.fromJson(response.data["data"]["user"]);
        return {"data": dataConvert, "error": ""};
      }
      return {"data": null, "error": "status not is 200"};
    } on DioException catch (err) {
      return {"data": null, "error": err.response!.data["message"]};
    }
  }

  Future<Map<String, dynamic>> signupByEmail(Map<String, dynamic> data) async {
    try {
      Response response =
          await appClient.postDio(endPoint: Endpoint.userRegister, data: data);
      UserDto dataConvert = UserDto.fromJson(response.data["data"]["user"]);
      return {"data": dataConvert, "error": ""};
    } on DioException catch (err) {
      return {"data": null, "error": err.response!.data["message"]};
    }
  }

  Future<Map<String, dynamic>> logoutUser(String accessToken) async {
    try {
      Response response = await appClient.postDio(
          endPoint: Endpoint.userLogout, accessToken: accessToken);

      return {"status": "success logout", "error": ""};
    } on DioException catch (err) {
      return {"data": null, "error": err.response!.data["message"]};
    }
  }
}
