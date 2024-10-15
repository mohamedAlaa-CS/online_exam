sealed class ForgetPasswordStates {}

class ForgetPasswordInitial extends ForgetPasswordStates {}

class ForgetPasswordLoadingState extends ForgetPasswordStates {}

class ForgetPasswordSuccessState extends ForgetPasswordStates {
  String? message;

  ForgetPasswordSuccessState(this.message);
}

class ForgetPasswordErrorState extends ForgetPasswordStates {
  Exception? exception;

  ForgetPasswordErrorState(this.exception);
}
