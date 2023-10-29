class Endpoint {
  static String get userRegister => "auth/register";
  static String get userLogin => "auth/login";
  static String get userLogout => "auth/logout";
  static String get getAllCourse => "course/get-all";
  static String get getLessonOfCourse => "lessons/get-all";
  static String get saveLearnResult => "user/save-results";
  static String get userReviewDashboard => "user/get-summary";
  static String get userReviewWords => "word/get-word-review";
  static String get userNotebook => "user/notebook";
  static String get loginWithGoogle => "auth/login-social";
  static String get getUserInfo => "user/get-profile";
  static String get refreshToken => "auth/refresh-token";
}
