import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TitleOfView(title: AppStrings.resetPassword),
                const AppTextFormField(
                  labelText: AppStrings.currentPassword,
                  hintText: AppStrings.currentPassword,
                ),
                const AppTextFormField(
                  labelText: AppStrings.newPassword,
                  hintText: AppStrings.newPassword,
                ),
                const AppTextFormField(
                  labelText: AppStrings.confirmPassword,
                  hintText: AppStrings.confirmPassword,
                ),
                verticalSpace(54),
                AppButton(
                  isExpanded: true,
                  text: AppStrings.update,
                  color: AppColors.grey10,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
