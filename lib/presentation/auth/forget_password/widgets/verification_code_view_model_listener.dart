import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/auth/manager/verification_code_view_model/verification_code_states.dart';
import 'package:online_exam/presentation/auth/manager/verification_code_view_model/verification_code_view_model.dart';

class VerificationCodeViewModelListener extends StatelessWidget {
  const VerificationCodeViewModelListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCodeViewModel, VerificationCodeStates>(
      listenWhen: (previous, current) =>
          current is VerificationCodeLoadingState ||
          current is VerificationCodeErrorState ||
          current is VerificationCodeSuccessState,
      listener: (context, state) {
        if (state is VerificationCodeErrorState) {
          var errorMessage = handellerErrorMessage(state.exception);
          AppDialogs.showErrorDialog(context, errorMessage);
          context.read<VerificationCodeViewModel>().pinPutController.clear();
        } else if (state is VerificationCodeSuccessState) {
          context.pushName(Routers.resetPasswordView);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
