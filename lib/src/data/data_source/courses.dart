import 'package:MochiChinese/src/data/dtos/courses/course.dart';
import 'package:MochiChinese/src/data/dtos/courses/info_lesson_course.dart';
import 'package:dio/dio.dart';

import '../api/endpoints.dart';
import '../base_data_source/base_data_source.dart';

class CoursesDataSource extends BaseDataSource {
  Future<List<CourseDto>?> getCourses(Map<String, dynamic> query) async {
    Response response = await appClient
        .getDio(endPoint: Endpoint.getAllCourse, queryParameters: {...query});

    if ((response.data["status"]) == 200) {
      final List<dynamic> data =
          (response.data['data']["courses"] as List<dynamic>);
      final List<CourseDto> convertData = data
          .map(
            (jsonCategory) => CourseDto.fromJson(jsonCategory),
          )
          .toList();
      return convertData;
    }
    return null;
  }

  Future<List<LessonDto>?> getLessonsOfCourse(
      Map<String, dynamic> query) async {
    Response response = await appClient.getDio(
        endPoint: Endpoint.getLessonOfCourse, queryParameters: {...query});

    if ((response.data["status"]) == 200) {
      final List<dynamic> data =
          (response.data['data']["lessons"] as List<dynamic>);
      final List<LessonDto> convertData = data
          .map(
            (jsonCategory) => LessonDto.fromJson(jsonCategory),
          )
          .toList();
      return convertData;
    }
    return null;
  }
}
