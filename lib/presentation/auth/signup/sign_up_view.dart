import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/presentation/auth/signup/sign_up_viewmodel.dart';
import 'package:online_exam/presentation/auth/signup/widgets/already_have_account_and_login_button.dart';
import 'package:online_exam/presentation/auth/signup/widgets/sign_up_form.dart';
import 'package:online_exam/presentation/auth/signup/widgets/sign_up_model_view_listener.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const TitleOfView(title: 'Signup'),
                const SignUpForm(),
                verticalSpace(48),
                AppButton(
                  text: 'Signup',
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                ),
                verticalSpace(16),
                const AlreadyHaveAccountText(),
                const SignUpModelViewListener()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpViewModel>().formKey.currentState!.validate()) {
      context.read<SignUpViewModel>().signup();
    }
  }
}
