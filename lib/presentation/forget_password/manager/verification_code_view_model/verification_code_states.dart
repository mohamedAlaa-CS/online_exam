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
  String? message;

  ResetOtpSuccessState(this.message);
}

class ResetOtpErrorState extends VerificationCodeStates {
  Exception? exception;

  ResetOtpErrorState(this.exception);
}
