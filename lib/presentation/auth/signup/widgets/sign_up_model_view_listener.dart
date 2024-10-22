import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/data/api/handel_exception_error.dart';
import 'package:online_exam/presentation/auth/signup/sign_up_viewmodel.dart';
import 'package:online_exam/presentation/auth/signup/signup_states.dart';

class SignUpModelViewListener extends StatelessWidget {
  const SignUpModelViewListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpViewModel, SignupViewState>(
      listenWhen: (previous, current) =>
          current is SignupLoadingState ||
          current is SignupErrorState ||
          current is SignupSuccessState,
      listener: (context, state) {
        if (state is SignupLoadingState) {
          AppDialogs.showLoadingDialog(context);
        } else if (state is SignupErrorState) {
          context.pop();
          String error = handellerErrorMessage(state.exception);
          AppDialogs.showErrorDialog(context, error);
        } else if (state is SignupSuccessState) {
          context.pop();
          AppDialogs.showSuccessDialog(
            context,
            titile: 'Success Signup',
            description: 'Your account has been created successfully',
            buttonText: 'Continue',
            onButtonClicked: () => context.pushNamedAndRemoveUntil(
                Routers.loginView,
                predicate: (route) => false),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}