part of 'courses_cubit.dart';

abstract class CoursesState {
  bool isLoadingLessons = false;
  List<CourseDto> listCourse = [];
  List<StateLessonOfCourse> lessons = [];

  LessonDto? currentLesson;
  List<LessonDto> currentLessons = [];
  CourseDto? currentCourse;
  bool showPopupLessonAfterLogin = false;

  copy(CoursesState state) {
    isLoadingLessons = state.isLoadingLessons;
    listCourse = state.listCourse;
    lessons = state.lessons;
    currentLessons = state.currentLessons;
    currentLesson = state.currentLesson;
    currentCourse = state.currentCourse;
    showPopupLessonAfterLogin = state.showPopupLessonAfterLogin;
  }
}

class CoursesInitial extends CoursesState {
  CoursesInitial();
}

class LessonsLoading extends CoursesState {
  LessonsLoading(CoursesState state) {
    super.copy(state..isLoadingLessons = true);
  }
}

class LessonsDoneLoading extends CoursesState {
  LessonsDoneLoading(CoursesState state) {
    super.copy(state..isLoadingLessons = false);
  }
}
