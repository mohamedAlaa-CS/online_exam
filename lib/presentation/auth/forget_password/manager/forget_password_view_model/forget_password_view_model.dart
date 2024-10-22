import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/data/api/model/request/forget_password_request.dart';
import 'package:online_exam/data/api/model/response/forget_password_response.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/use_case/auth_use_case/forget_password_use_case.dart';

import 'forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordUseCase forgetPasswordUseCase;
  ForgetPasswordViewModel(this.forgetPasswordUseCase)
      : super(ForgetPasswordInitial());

  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  _forgetPassword() async {
    emit(ForgetPasswordLoadingState());
    var result = await forgetPasswordUseCase.forgetPassword(
        ForgetPasswordRequest(email: emailController.text.trim()));
    switch (result) {
      case Success<ForgetPasswordResponse>():
        {
          emit(ForgetPasswordSuccessState(result.data));
          break;
        }
      case Fail<ForgetPasswordResponse>():
        {
          emit(ForgetPasswordErrorState(result.exception));
          break;
        }
    }
  }

  bool isForgetPasswordFormValid = true;

  void checkValidationThenCallForgetPasswordApi() {
    if (forgetPasswordFormKey.currentState!.validate()) {
      if (isForgetPasswordFormValid == false) {
        isForgetPasswordFormValid = true;
        emit(ForgetPasswordFormValiedState());
      }
      _forgetPassword();
    } else {
      isForgetPasswordFormValid = false;
      emit(ForgetPasswordFormValiedState());
    }
  }
}
