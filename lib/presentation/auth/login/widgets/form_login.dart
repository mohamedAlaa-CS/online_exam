import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/widgets/app_buttom.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/presentation/auth/login/login_viewmodel.dart';
import 'package:online_exam/presentation/auth/login/widgets/remember_forgetpassword.dart';
import 'package:online_exam/presentation/auth/login/widgets/sign_up.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginViewModel>().loginFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          verticalSpace(20),
          AppTextFormField(
            labelText: 'Email',
            hintText: 'Enter your email',
            validator: Validations.validateEmail,
            controller: context.read<LoginViewModel>().emailController,
          ),
          AppTextFormField(
            labelText: 'Password',
            hintText: 'Enter your password',
            isObscureText: true,
            validator: Validations.validatePassword,
            controller: context.read<LoginViewModel>().passwordController,
          ),
          RememberAndForgetPassword(viewModel: viewModel),
          verticalSpace(20),
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: 'Login',
              onPressed: () {
                if (context
                    .read<LoginViewModel>()
                    .loginFormKey
                    .currentState!
                    .validate()) {
                  context.read<LoginViewModel>().login();
                }
              },
            ),
          ),
          const SignUpText(),
        ],
      ),
    );
  }
}
