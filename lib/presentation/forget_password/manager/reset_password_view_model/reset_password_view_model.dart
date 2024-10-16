import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/auth_use_case/reset_password_use_case.dart';
import 'package:online_exam/presentation/forget_password/manager/reset_password_view_model/reset_password_states.dart';

class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordViewModel(this.resetPasswordUseCase)
      : super(ResetPasswordInitial());
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> resetPassword() async {
    emit(ResetPasswordLoadingState());
    var result = await resetPasswordUseCase.resetPassword(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    switch (result) {
      case Success<void>():
        {
          emit(ResetPasswordSuccessState());
        }
      case Fail<void>():
        {
          emit(ResetPasswordErrorState(result.exception));
        }
    }
  }
}
