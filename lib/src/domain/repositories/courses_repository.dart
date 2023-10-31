import 'package:MochiChinese/src/data/data_source/courses.dart';
import 'package:MochiChinese/src/data/dtos/courses/info_lesson_course.dart';

import '../../data/dtos/courses/course.dart';

class CoursesRepo {
  Future<List<CourseDto>?> getCourses([Map<String, dynamic> query = const {}]) {
    return CoursesDataSource().getCourses(query);
  }

  Future<List<LessonDto>?> getLessonsOfCourse(
      [Map<String, dynamic> query = const {}]) {
    return CoursesDataSource().getLessonsOfCourse(query);
  }
}
