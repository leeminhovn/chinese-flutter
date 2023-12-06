import 'dart:convert';

import 'package:MochiChinese/src/constant/app_constants.dart';
import 'package:dio/dio.dart';

class AppClient {
  late Dio _dio;
  late Dio _dioAuthen;

  final BaseOptions _baseOptions = BaseOptions(
    baseUrl: AppConstants.baseApiUrl,
    connectTimeout: const Duration(seconds: 50),
    receiveTimeout: const Duration(seconds: 50),
    contentType: 'application/json',
    headers: {"api-key": AppConstants.API_KEY},
  );
  AppClient() {
    _dio = Dio(_baseOptions);
    _dioAuthen = Dio(_baseOptions);
  }
  Future<Response> getDio(
      {String endPoint = '', Map<String, dynamic> queryParameters = const {}}) {
    return _dio.get(endPoint, queryParameters: queryParameters);
  }

  Future<Response> postDio(
      {String endPoint = '', String accessToken = '', dynamic data}) {
    if (accessToken != '') {
      _dioAuthen.options.headers["Authorization"] = "Bearer $accessToken";
    }
    return _dioAuthen.post(endPoint, data: jsonEncode(data));
  }
}
