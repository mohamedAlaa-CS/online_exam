import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';

sealed class LoginViewState {}

class LoginInitialState extends LoginViewState {}

class LoginLoadingState extends LoginViewState {}

class LoginErrorState extends LoginViewState {
  Exception? exception;
  LoginErrorState(this.exception);
}

class LoginSuccessState extends LoginViewState {
  AuthResponse? authResponse;
  LoginSuccessState(this.authResponse);
}

class ToggleRemmemberMeLogin extends LoginViewState {}
