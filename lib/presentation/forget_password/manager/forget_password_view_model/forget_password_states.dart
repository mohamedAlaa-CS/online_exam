import 'package:online_exam/data/api/model/response/forget_password_response.dart';

sealed class ForgetPasswordStates {}

class ForgetPasswordInitial extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
  ForgetPasswordResponse? forgetPasswordResponse;

  ForgetPasswordSuccessState(this.forgetPasswordResponse);
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  Exception? exception;

  ForgetPasswordErrorState(this.exception);
}
