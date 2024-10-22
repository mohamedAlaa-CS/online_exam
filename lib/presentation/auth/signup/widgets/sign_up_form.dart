import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/presentation/auth/signup/sign_up_viewmodel.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignUpViewModel>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: context.read<SignUpViewModel>().nameController,
            labelText: 'User name',
            hintText: 'Enter you user name',
            validator: Validations.validateName,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller:
                      context.read<SignUpViewModel>().firstNameController,
                  labelText: 'First name',
                  hintText: 'Enter you first name',
                  validator: Validations.validateName,
                ),
              ),
              horizontalSpace(17),
              Expanded(
                child: AppTextFormField(
                  controller:
                      context.read<SignUpViewModel>().lastNameController,
                  labelText: 'Last name',
                  hintText: 'Enter you last name',
                  validator: Validations.validateName,
                ),
              ),
            ],
          ),
          AppTextFormField(
            controller: context.read<SignUpViewModel>().emailController,
            labelText: 'Email',
            hintText: 'Enter you email',
            validator: Validations.validateEmail,
          ),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller:
                      context.read<SignUpViewModel>().passwordController,
                  labelText: 'Password',
                  hintText: 'Enter password',
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
                  validator: Validations.validatePassword,
                ),
              ),
              horizontalSpace(17),
              Expanded(
                child: AppTextFormField(
                  controller:
                      context.read<SignUpViewModel>().confirmPasswordController,
                  labelText: 'Confirm password',
                  hintText: 'Confirm password',
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
                  validator: (value) => Validations.validateConfirmPassword(
                    context.read<SignUpViewModel>().passwordController.text,
                    value,
                  ),
                ),
              ),
            ],
          ),
          AppTextFormField(
            controller: context.read<SignUpViewModel>().phoneController,
            labelText: 'Phone number',
            hintText: 'Enter phone number',
            validator: Validations.validatePhoneNumber,
          ),
        ],
      ),
    );
  }
}