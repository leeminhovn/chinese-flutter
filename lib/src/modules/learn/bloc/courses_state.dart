// khi vừa mới vào page thì ta sẽ lấy ra lesson của khoá học đầu tiên (khoá mặc định)
//sau đó hiển thị ra cho user
//về sau thì ta nên call tất cả kháo học, vì hiện tại chỉ có một kháo học được mở

// danh sách khoá học, khi user click mở ra danh sách khoá học, thì sẽ bắt đầu call api lấy danh sách khoá học
//nếu user click vào khoá học thì thay đổi lại curentCourse

part of 'courses_cubit.dart';

abstract class CoursesState {
  bool isLoadingLessons = false;
  List<CourseDto> listCourse = [];
  List<StateLessonOfCourse> lessons = [];

  LessonDto? currentLesson;
  List<LessonDto> currentLessons = [];
  CourseDto? currentCourse;

  copy(CoursesState state) {
    isLoadingLessons = state.isLoadingLessons;
    listCourse = state.listCourse;
    lessons = state.lessons;
    currentLessons = state.currentLessons;
    currentLesson = state.currentLesson;
    currentCourse = state.currentCourse;
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
