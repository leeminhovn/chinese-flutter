part of 'user_cubit.dart';

abstract class UserState {
  UserDto? user;
  Map<String, dynamic> error = {};
bool isOutDateExpired = true;
  copy(UserState state) {
    user = state.user;
    isOutDateExpired = state.isOutDateExpired;
  }
}

class UserStateInitial extends UserState {
  UserStateInitial();
}

class DoneGetInfoUserProfile extends UserState {
  DoneGetInfoUserProfile(UserState state) {
    super.copy(state);
  }
}

class SuccessLogin extends UserState {
  SuccessLogin(UserState state) {
    super.copy(state);
  }
}
class SuccessRegister extends UserState {
  SuccessRegister(UserState state) {
    super.copy(state);
  }
}
class FailLogin extends UserState {
  FailLogin(UserState state) {
    super.copy(state..error);
  }
}
