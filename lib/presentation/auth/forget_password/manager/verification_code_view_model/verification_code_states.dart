import 'package:online_exam/data/api/model/response/forget_password_response.dart';

sealed class VerificationCodeStates {}

class VerificationCodeInitial extends VerificationCodeStates {}

class VerificationCodeLoadingState extends VerificationCodeStates {}

class VerificationCodeSuccessState extends VerificationCodeStates {}

class VerificationCodeErrorState extends VerificationCodeStates {
  Exception? exception;
  VerificationCodeErrorState(this.exception);
}

class ResetOtpLoadingState extends VerificationCodeStates {}

class ResetOtpSuccessState extends VerificationCodeStates {
  ForgetPasswordResponse? forgetPasswordResponse;

  ResetOtpSuccessState(this.forgetPasswordResponse);
}

class ResetOtpErrorState extends VerificationCodeStates {
  Exception? exception;

  ResetOtpErrorState(this.exception);
}
