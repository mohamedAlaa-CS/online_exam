import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/cache/shared_preferences.dart';
import 'package:online_exam/core/helper/constant.dart';
import 'package:online_exam/core/helper/functions/convert_secure_token_to_String.dart';
import 'package:online_exam/data/api/model/request/change_password_request.dart';
import 'package:online_exam/domin/common/api_result.dart';
import 'package:online_exam/domin/entities/profile_entity/get_user_info_entity/change_password_entity.dart';
import 'package:online_exam/domin/use_case/profile_use_case/change_password_use_case.dart';
import 'package:online_exam/presentation/main_layout/tabs/profile/manager/change_password_view_model/change_password_states.dart';

@injectable
class ChangePasswordViewModel extends Cubit<ChangePasswordStates> {
  final ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordViewModel(this.changePasswordUseCase)
      : super(ChangePasswordInitial());

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();

  Future<void> getTokenThenChangePassword() async {
    if (!changePasswordFormKey.currentState!.validate()) return;
    await convertTokenToString().then((token) => _changePassword(token));
  }

  _changePassword(String token) async {
    emit(ChangePasswordLoading());
    var changePasswordRequest = ChangePasswordRequest(
      oldPassword: oldPasswordController.text.trim(),
      password: newPasswordController.text.trim(),
      rePassword: confirmPasswordController.text.trim(),
    );

    var result = await changePasswordUseCase.invoke(
      changePasswordRequest,
      token,
    );

    switch (result) {
      case Success<ChangePasswordEntity?>():
        {
          SharedPreferencesHelper.setSecuredString(
            key: Constant.keyToken,
            value: result.data?.token ?? '',
          );
          emit(ChangePasswordSuccess(result.data));
        }
        break;
      case Fail<ChangePasswordEntity?>():
        {
          emit(ChangePasswordError(result.exception));
        }
        break;
    }
  }
}
