import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';

class UserInfoForm extends StatelessWidget {
  const UserInfoForm({
    super.key,
    this.userNameController,
    this.firstNameController,
    this.lastNameController,
    this.emailController,
    this.passwordController,
    this.phoneController,
    this.isAllReadOnly = false,
    this.buttonColor,
    this.onbuttonClicked,
    this.isButtonLoading = false,
    this.userInitialValue,
    this.firstNameInitialValue,
    this.lastNameInitialValue,
    this.emailInitialValue,
    this.phoneInitialValue,
    this.passwordInitialValue,
  });
  final TextEditingController? userNameController;
  final TextEditingController? firstNameController;
  final TextEditingController? lastNameController;
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final TextEditingController? phoneController;
  final bool? isAllReadOnly;
  final Color? buttonColor;
  final VoidCallback? onbuttonClicked;
  final bool? isButtonLoading;
  final String? userInitialValue;
  final String? firstNameInitialValue;
  final String? lastNameInitialValue;
  final String? emailInitialValue;
  final String? passwordInitialValue;
  final String? phoneInitialValue;
  @override
  Widget build(BuildContext context) {
    // GetUserInfoViewMOdel viewModel = getIt<GetUserInfoViewMOdel>();
    return Column(
      children: [
        AppTextFormField(
          validator: Validations.validateName,
          controller: userNameController,
          initialValue: userInitialValue,
          isReadOnly: isAllReadOnly,
          labelText: 'User name',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                validator: Validations.validateName,
                controller: firstNameController,
                initialValue: firstNameInitialValue,
                isReadOnly: isAllReadOnly,
                labelText: 'First name',
                hintStyle: TextStyles.font16Black400Weight,
              ),
            ),
            horizontalSpace(17),
            Expanded(
              child: AppTextFormField(
                validator: Validations.validateName,
                initialValue: lastNameInitialValue,
                controller: lastNameController,
                isReadOnly: isAllReadOnly,
                labelText: 'Last name',
                hintStyle: TextStyles.font16Black400Weight,
              ),
            ),
          ],
        ),
        AppTextFormField(
          validator: Validations.validateEmail,
          initialValue: emailInitialValue,
          controller: emailController,
          isReadOnly: isAllReadOnly,
          labelText: 'Email',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        AppTextFormField(
          validator: Validations.validatePassword,
          controller: passwordController,
          initialValue: passwordInitialValue,
          isObscureText: true,
          isReadOnly: true,
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
          validator: Validations.validatePhoneNumber,
          initialValue: phoneInitialValue,
          controller: phoneController,
          isReadOnly: isAllReadOnly,
          labelText: 'Phone Number',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        verticalSpace(40),
        isButtonLoading == true
            ? const CircularProgressIndicator(color: AppColors.primary)
            : AppButton(
                isExpanded: true,
                color: buttonColor ?? AppColors.grey10,
                onPressed: onbuttonClicked ?? () {},
                text: AppStrings.update,
              ),
      ],
    );
  }
}
