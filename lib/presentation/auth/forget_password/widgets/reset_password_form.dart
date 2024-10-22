import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/presentation/auth/manager/reset_password_view_model/reset_password_view_model.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm({super.key});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    var resetPasswordViewModel = context.read<ResetPasswordViewModel>();

    return Column(children: [
      AppTextFormField(
        isObscureText: isObscureText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
          child: Icon(
            isObscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        controller: resetPasswordViewModel.newpasswordController,
        validator: Validations.validatePassword,
        labelText: 'New password',
        hintText: 'Enter your password',
      ),
      verticalSpace(4),
      AppTextFormField(
        isObscureText: isObscureText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isObscureText = !isObscureText;
            });
          },
          child: Icon(
            isObscureText ? Icons.visibility_off : Icons.visibility,
          ),
        ),
        controller: resetPasswordViewModel.confirmPasswordController,
        validator: (value) => Validations.validateConfirmPassword(
            resetPasswordViewModel.newpasswordController.text, value),
        labelText: 'Confirm password',
        hintText: 'Confirm password',
      ),
    ]);
  }
}
