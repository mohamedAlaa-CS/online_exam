import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/forget_password/manager/rest_code_view_model/reset_code_states.dart';
import 'package:online_exam/presentation/forget_password/manager/rest_code_view_model/reset_code_view_model.dart';

class ResetCodeViewModelListener extends StatelessWidget {
  const ResetCodeViewModelListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetCodeViewModel, ResetCodeStates>(
      listenWhen: (previous, current) =>
          current is ResetCodeLoadingState ||
          current is ResetCodeErrorState ||
          current is ResetCodeSuccessState,
      listener: (context, state) {
        switch (state) {
          case ResetCodeLoadingState():
            //AppDialogs.showLoadingDialog(context);
            break;
          case ResetCodeErrorState():
            {
              var errorMessage = handellerErrorMessage(state.exception);
              AppDialogs.showErrorDialog(context, errorMessage);
              context.read<ResetCodeViewModel>().pinPutController.clear();
            }
            break;
          case ResetCodeSuccessState():
            context.pushName(Routers.resetPasswordView);
            break;
          case ResetCodeInitial():
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
