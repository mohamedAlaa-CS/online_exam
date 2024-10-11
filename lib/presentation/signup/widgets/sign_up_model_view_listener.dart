import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/dialogs/app_dialogs.dart';
import 'package:online_exam/presentation/signup/sign_up_viewmodel.dart';
import 'package:online_exam/presentation/signup/signup_states.dart';

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
          AppDialogs.showErrorDialog(context, state.exception.toString());
        } else if (state is SignupSuccessState) {
          AppDialogs.showSuccessDialog(context);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
