import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';
import 'package:online_exam/presentation/signup/sign_up_viewmodel.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool isObscureText = false;
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
            validator: (value) => Validations.validateName(context, value),
          ),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  controller:
                      context.read<SignUpViewModel>().firstNameController,
                  labelText: 'First name',
                  hintText: 'Enter you first name',
                  validator: (value) =>
                      Validations.validateName(context, value),
                ),
              ),
              horizontalSpace(17),
              Expanded(
                child: AppTextFormField(
                  controller:
                      context.read<SignUpViewModel>().lastNameController,
                  labelText: 'Last name',
                  hintText: 'Enter you last name',
                  validator: (value) =>
                      Validations.validateName(context, value),
                ),
              ),
            ],
          ),
          AppTextFormField(
            controller: context.read<SignUpViewModel>().emailController,
            labelText: 'Email',
            hintText: 'Enter you email',
            validator: (value) => Validations.validateEmail(context, value),
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
                  validator: (value) =>
                      Validations.validatePassword(context, value),
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
                    context,
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
            validator: (value) =>
                Validations.validatePhoneNumber(context, value),
          ),
        ],
      ),
    );
  }
}
