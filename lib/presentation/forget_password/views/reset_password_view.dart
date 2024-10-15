import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/presentation/forget_password/widgets/ttitle_and_description_forget_password.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.0.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TitleOfView(title: 'Password'),
                verticalSpace(40),
                const TitleAndDescriptionForgetPassword(
                  title: 'Reset password',
                  description:
                      'Password must not be empty and must contain \n 6 characters with upper case letter and one \n number at least ',
                ),
                verticalSpace(8),
                const AppTextFormField(
                  labelText: 'New password',
                  hintText: 'Enter your password',
                ),
                verticalSpace(4),
                const AppTextFormField(
                  labelText: 'Confirm password',
                  hintText: 'Confirm password',
                ),
                verticalSpace(52),
                AppButton(
                  isExpanded: true,
                  text: 'Continue ',
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
