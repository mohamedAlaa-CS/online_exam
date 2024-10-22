import 'package:online_exam/data/api/model/response/auth_response/auth_response.dart';

sealed class SignupViewState {}

class InitialState extends SignupViewState {}

class SignupLoadingState extends SignupViewState {}

class ChangeObscurePasswordState extends SignupViewState {}

class SignupErrorState extends SignupViewState {
  Exception? exception;
  SignupErrorState(this.exception);
}

class SignupSuccessState extends SignupViewState {
  AuthResponse? authResponse;
  SignupSuccessState(this.authResponse);
}
