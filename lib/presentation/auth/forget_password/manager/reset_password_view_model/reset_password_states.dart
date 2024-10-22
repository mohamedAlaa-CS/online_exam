sealed class ResetPasswordStates {}

class ResetPasswordInitial extends ResetPasswordStates {}

class ResetPasswordLoadingState extends ResetPasswordStates {}

class ResetPasswordSuccessState extends ResetPasswordStates {}

class ResetPasswordErrorState extends ResetPasswordStates {
  Exception? exception;
  ResetPasswordErrorState(this.exception);
}
