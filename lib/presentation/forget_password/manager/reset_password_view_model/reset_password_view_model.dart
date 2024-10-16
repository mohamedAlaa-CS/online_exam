import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/auth_use_case/reset_password_use_case.dart';
import 'package:online_exam/presentation/forget_password/manager/reset_password_view_model/reset_password_states.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordStates> {
  ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordViewModel(this.resetPasswordUseCase)
      : super(ResetPasswordInitial());

  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController newpasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> resetPassword(String email) async {
    emit(ResetPasswordLoadingState());
    var result = await resetPasswordUseCase.resetPassword(
      email,
      newpasswordController.text.trim(),
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
