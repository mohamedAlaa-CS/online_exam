import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/forget_password/manager/reset_password_view_model/reset_password_states.dart';
import 'package:online_exam/presentation/forget_password/manager/reset_password_view_model/reset_password_view_model.dart';

class ResetPasswordViewModelListener extends StatelessWidget {
  const ResetPasswordViewModelListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordViewModel, ResetPasswordStates>(
      listenWhen: (previous, current) {
        return current is ResetPasswordLoadingState ||
            current is ResetPasswordErrorState ||
            current is ResetPasswordSuccessState;
      },
      listener: (context, state) {
        switch (state) {
          case ResetPasswordLoadingState():
            AppDialogs.showLoadingDialog(context);
            break;
          case ResetPasswordErrorState():
            {
              context.pop();
              var errorMessage = handellerErrorMessage(state.exception);
              AppDialogs.showErrorDialog(context, errorMessage);
            }
            break;
          case ResetPasswordSuccessState():
            context.pop();
            AppDialogs.showSuccessDialog(context);
            break;
          case ResetPasswordInitial():
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
