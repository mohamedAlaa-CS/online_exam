import 'package:online_exam/domin/entities/user.dart';

sealed class SignupViewState {}

class InitialState extends SignupViewState {}

class SignupLoadingState extends SignupViewState {}

class SignupErrorState extends SignupViewState {
  Exception? exception;
  SignupErrorState(this.exception);
}

class SignupSuccessState extends SignupViewState {
  User? user;
  SignupSuccessState(this.user);
}
