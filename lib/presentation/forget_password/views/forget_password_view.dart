import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/presentation/forget_password/widgets/ttitle_and_description_forget_password.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: SingleChildScrollView(
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
                const AppTextFormField(
                  labelText: 'Email',
                  hintText: 'Enter you email',
                ),
                verticalSpace(48),
                AppButton(
                  isExpanded: true,
                  text: 'Submit',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
