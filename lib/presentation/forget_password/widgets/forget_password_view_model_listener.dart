import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/forget_password/manager/forget_password_view_model/forget_password_states.dart';
import 'package:online_exam/presentation/forget_password/manager/forget_password_view_model/forget_password_view_model.dart';

class ForgetPassworsViewModelListener extends StatelessWidget {
  const ForgetPassworsViewModelListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordViewModel, ForgetPasswordStates>(
      listenWhen: (previous, current) =>
          current is ForgetPasswordErrorState ||
          current is ForgetPasswordSuccessState ||
          current is ForgetPasswordLoadingState,
      listener: (context, state) {
        switch (state) {
          case ForgetPasswordLoadingState():
            AppDialogs.showLoadingDialog(context);
            break;
          case ForgetPasswordErrorState():
            {
              var errorMessage = handellerErrorMessage(state.exception);
              context.pop();
              AppDialogs.showErrorDialog(context, errorMessage);
            }
            break;
          case ForgetPasswordSuccessState():
            context.pop();
            context.pushName(Routers.verificationCodeView);

            break;
          case ForgetPasswordInitial():
            {}
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
