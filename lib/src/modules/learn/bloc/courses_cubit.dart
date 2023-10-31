import 'package:MochiChinese/src/constant/learn_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/dtos/courses/course.dart';
import '../../../data/dtos/courses/info_lesson_course.dart';
import '../../../domain/repositories/courses_repository.dart';

part 'courses_state.dart';

class CoursesCubit extends Cubit<CoursesState> {
  CoursesCubit() : super(CoursesInitial()) {
    initalFirstCourseAndLesson();
    print("zppp");
  }

  void initalFirstCourseAndLesson() async {
    emit(LessonsLoading(state));
    final List<dynamic> result = await Future.wait([
      CoursesRepo().getCourses(),
      CoursesRepo()
          .getLessonsOfCourse({"courseId": LearnConstants.defaultIdCourse})
    ]);
    print("result");
    emit(LessonsDoneLoading(state));
  }
}
