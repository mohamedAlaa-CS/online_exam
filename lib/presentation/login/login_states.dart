import 'package:online_exam/domin/entities/user.dart';

sealed class LoginViewState {}

class LoginInitialState extends LoginViewState {}

class LoginLoadingState extends LoginViewState {}

class LoginErrorState extends LoginViewState {
  Exception? exception;
  LoginErrorState(this.exception);
}

class LoginSuccessState extends LoginViewState {
  User? user;
  LoginSuccessState(this.user);
}

class ToggleRemmemberMeLogin extends LoginViewState {}
