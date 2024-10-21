import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/presentation/forget_password/manager/forget_password_view_model/forget_password_view_model.dart';
import 'package:online_exam/presentation/forget_password/widgets/forget_password_view_model_listener.dart';
import 'package:online_exam/presentation/forget_password/widgets/ttitle_and_description_forget_password.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    var forgetPasswordViewModel = context.read<ForgetPasswordViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: SingleChildScrollView(
            child: Form(
              key: forgetPasswordViewModel.forgetPasswordFormKey,
              child: Column(
                children: [
                  const TitleOfView(title: 'Password'),
                  verticalSpace(40),
                  const TitleAndDescriptionForgetPassword(
                    title: 'Forget password',
                    description:
                        'Please enter your email associated to \n your account',
                  ),
                  verticalSpace(8),
                  AppTextFormField(
                    controller: forgetPasswordViewModel.emailController,
                    labelText: 'Email',
                    hintText: 'Enter you email',
                    validator: Validations.validateEmail,
                  ),
                  verticalSpace(48),
                  AppButton(
                    isExpanded: true,
                    text: 'Submit',
                    onPressed: () {
                      forgetPasswordViewModel
                          .checkValidationThenCallForgetPasswordApi();
                    },
                  ),
                  const ForgetPassworsViewModelListener(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
