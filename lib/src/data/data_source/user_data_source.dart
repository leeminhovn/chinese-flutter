import 'package:MochiChinese/src/data/api/endpoints.dart';
import 'package:MochiChinese/src/data/base_data_source/base_data_source.dart';
import 'package:dio/dio.dart';

import '../dtos/user/user.dart';

class UserDataSource extends BaseDataSource {
  Future<Map<String, dynamic>> loginByEmail(Map<String, dynamic> data) async {
    try {
      Response response =
          await appClient.postDio(endPoint: Endpoint.userLogin, data: data);
      print(response);
      if ((response.data["status"]) == 200) {
        UserDto dataConvert = UserDto.fromJson(response.data["data"]["user"]);
        return {"data": dataConvert, "error": ""};
      }
      return {"data": null, "error": "status not is 200"};
    } on DioException catch (err) {
      return {"data": null, "error": err.response!.data["message"]};
    }
  }
}
