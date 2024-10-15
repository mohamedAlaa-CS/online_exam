import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/forget_password_use_case.dart';

import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordViewModel(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitial());

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    var result =
        await forgetPasswordUseCase.forgetPassword(emailController.text.trim());
    switch (result) {
      case Success<String?>():
        {
          emit(ForgetPasswordSuccessState(result.data));
        }
      case Fail<String?>():
        {
          emit(ForgetPasswordErrorState(result.exception));
        }
    }
  }
}
