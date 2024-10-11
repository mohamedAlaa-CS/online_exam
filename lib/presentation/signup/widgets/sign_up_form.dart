import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/helper/validations.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';

class SignUpForm extends StatelessWidget {
  SignUpForm({super.key});
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          AppTextFormField(
            labelText: 'User name',
            hintText: 'Enter you user name',
            validator: (value) => Validations.validateName(context, value),
          ),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  labelText: 'First name',
                  hintText: 'Enter you first name',
                  validator: (value) =>
                      Validations.validateName(context, value),
                ),
              ),
              horizontalSpace(17),
              Expanded(
                child: AppTextFormField(
                  labelText: 'Last name',
                  hintText: 'Enter you last name',
                  validator: (value) =>
                      Validations.validateName(context, value),
                ),
              ),
            ],
          ),
          AppTextFormField(
            labelText: 'Email',
            hintText: 'Enter you email',
            validator: (value) => Validations.validateEmail(context, value),
          ),
          Row(
            children: [
              Expanded(
                child: AppTextFormField(
                  labelText: 'Password',
                  hintText: 'Enter password',
                  validator: (value) =>
                      Validations.validatePassword(context, value),
                ),
              ),
              horizontalSpace(17),
              Expanded(
                child: AppTextFormField(
                  labelText: 'Confirm password',
                  hintText: 'Confirm password',
                  validator: (value) =>
                      Validations.validatePassword(context, value),
                ),
              ),
            ],
          ),
          AppTextFormField(
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
