import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/forget_password/manager/verification_code_view_model/verification_code_states.dart';
import 'package:online_exam/presentation/forget_password/manager/verification_code_view_model/verification_code_view_model.dart';

class ResetCodeViewModelListener extends StatelessWidget {
  const ResetCodeViewModelListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerificationCodeViewModel, VerificationCodeStates>(
      listenWhen: (previous, current) =>
          current is VerificationCodeLoadingState ||
          current is VerificationCodeErrorState ||
          current is VerificationCodeSuccessState,
      listener: (context, state) {
        switch (state) {
          case VerificationCodeLoadingState():
            //AppDialogs.showLoadingDialog(context);
            break;
          case VerificationCodeErrorState():
            {
              var errorMessage = handellerErrorMessage(state.exception);
              AppDialogs.showErrorDialog(context, errorMessage);
              context
                  .read<VerificationCodeViewModel>()
                  .pinPutController
                  .clear();
            }
            break;
          case VerificationCodeSuccessState():
            context.pushName(Routers.resetPasswordView);
            break;
          case VerificationCodeInitial():
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
