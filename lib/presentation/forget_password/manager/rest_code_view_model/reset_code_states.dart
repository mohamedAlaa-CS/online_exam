sealed class ResetCodeStates {}

class ResetCodeInitial extends ResetCodeStates {}

class ResetCodeLoadingState extends ResetCodeStates {}

class ResetCodeSuccessState extends ResetCodeStates {}

class ResetCodeErrorState extends ResetCodeStates {
  Exception? exception;
  ResetCodeErrorState(this.exception);
}
