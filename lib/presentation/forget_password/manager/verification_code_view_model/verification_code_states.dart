sealed class VerificationCodeStates {}

class VerificationCodeInitial extends VerificationCodeStates {}

class VerificationCodeLoadingState extends VerificationCodeStates {}

class VerificationCodeSuccessState extends VerificationCodeStates {}

class VerificationCodeErrorState extends VerificationCodeStates {
  Exception? exception;
  VerificationCodeErrorState(this.exception);
}
