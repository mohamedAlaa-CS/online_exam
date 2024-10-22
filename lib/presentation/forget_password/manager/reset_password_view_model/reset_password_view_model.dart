import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/helper/constant.dart';
import 'package:online_exam/data/api/model/request/reset_password_request.dart';
import 'package:online_exam/data/api/model/response/reset_password_response.dart';
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

  Future<void> resetPassword() async {
    emit(ResetPasswordLoadingState());
    var result = await resetPasswordUseCase.resetPassword(
      ResetPasswordRequest(
        email: SharedPreferencesHelper.getString(
            key: Constant.forgetPasswordUserEmailKey),
        newPassword: newpasswordController.text.trim(),
      ),
    );
    switch (result) {
      case Success<ResetPasswordResponse>():
        {
          emit(ResetPasswordSuccessState());
          break;
        }
      case Fail<ResetPasswordResponse>():
        {
          emit(ResetPasswordErrorState(result.exception));
          break;
        }
    }
  }
}
