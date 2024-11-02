import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';

class UserInfoForm extends StatelessWidget {
  const UserInfoForm({
    super.key,
    required this.userNameController,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    this.passwordController,
    required this.phoneController,
    this.isAllReadOnly = false,
    this.buttonColor,
    this.onbuttonClicked,
  });
  final TextEditingController userNameController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController? passwordController;
  final TextEditingController phoneController;
  final bool? isAllReadOnly;
  final Color? buttonColor;
  final VoidCallback? onbuttonClicked;
  @override
  Widget build(BuildContext context) {
    // GetUserInfoViewMOdel viewModel = getIt<GetUserInfoViewMOdel>();
    return Column(
      children: [
        AppTextFormField(
          controller: userNameController,
          isReadOnly: isAllReadOnly,
          labelText: 'User name',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                controller: firstNameController,
                isReadOnly: isAllReadOnly,
                labelText: 'First name',
                hintStyle: TextStyles.font16Black400Weight,
              ),
            ),
            horizontalSpace(17),
            Expanded(
              child: AppTextFormField(
                controller: lastNameController,
                isReadOnly: isAllReadOnly,
                labelText: 'Last name',
                hintStyle: TextStyles.font16Black400Weight,
              ),
            ),
          ],
        ),
        AppTextFormField(
          controller: emailController,
          isReadOnly: isAllReadOnly,
          labelText: 'Email',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        AppTextFormField(
          controller: passwordController,
          isObscureText: true,
          isReadOnly: isAllReadOnly,
          hintStyle: TextStyles.font16Black400Weight,
          labelText: 'Password',
          suffixWidget: GestureDetector(
            onTap: () {},
            child: Text(
              'Change',
              style: TextStyles.font12Primary600Weight,
            ),
          ),
        ),
        AppTextFormField(
          controller: phoneController,
          isReadOnly: isAllReadOnly,
          labelText: 'Phone Number',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        verticalSpace(40),
        AppButton(
          isExpanded: true,
          color: buttonColor ?? AppColors.grey10,
          onPressed: onbuttonClicked ?? () {},
          text: AppStrings.update,
        ),
      ],
    );
  }
}
