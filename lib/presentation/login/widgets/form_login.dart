import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/presentation/login/login_viewmodel.dart';
import 'package:online_exam/presentation/login/widgets/app_text_form_field.dart';
import 'package:online_exam/presentation/login/widgets/button_form.dart';
import 'package:online_exam/presentation/login/widgets/sign_up.dart';

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
          verticalSpace(20),
          AppTextFormField(
            labelText: 'Password',
            hintText: 'Enter your password',
            obscureText: true,
            validator: Validations.validatePassword,
            controller: context.read<LoginViewModel>().passwordController,
          ),
          verticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.grey,
                    value: viewModel.rememberMe,
                    onChanged: (value) {
                      viewModel.toggleRememberMe();
                    },
                  ),
                  Text('Remember me',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: AppColors.blackBase,
                          fontWeight: FontWeight.w400)),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text('Forgot password?',
                    style: TextStyle(
                        fontSize: 13.sp,
                        decoration: TextDecoration.underline,
                        color: AppColors.blackBase,
                        fontWeight: FontWeight.w400)),
              ),
            ],
          ),
          verticalSpace(40),
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
