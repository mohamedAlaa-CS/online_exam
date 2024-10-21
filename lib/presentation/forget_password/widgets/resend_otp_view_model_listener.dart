import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/forget_password/manager/verification_code_view_model/verification_code_states.dart';
import 'package:online_exam/presentation/forget_password/manager/verification_code_view_model/verification_code_view_model.dart';

class ResendOtpViewModelListener extends StatelessWidget {
  const ResendOtpViewModelListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCodeViewModel, VerificationCodeStates>(
      listenWhen: (previous, current) =>
          current is ResetOtpLoadingState ||
          current is ResetOtpErrorState ||
          current is ResetOtpSuccessState,
      listener: (context, state) {
        if (state is ResetOtpErrorState) {
          var errorMessage = handellerErrorMessage(state.exception);
          AppDialogs.showErrorDialog(context, errorMessage);
        } else if (state is ResetOtpSuccessState) {
          AppDialogs.showSuccessDialog(
            context,
            titile: 'Success',
            description: state.forgetPasswordResponse?.info ?? ' ',
            buttonText: 'ok',
            onButtonClicked: () => context.pop(),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
