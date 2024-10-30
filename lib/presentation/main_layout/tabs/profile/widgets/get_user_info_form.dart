import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_button.dart';
import 'package:online_exam/core/widgets/app_text_form_field.dart';

class GetUserInfoForm extends StatefulWidget {
  const GetUserInfoForm({super.key});

  @override
  State<GetUserInfoForm> createState() => _GetUserInfoFormState();
}

class _GetUserInfoFormState extends State<GetUserInfoForm> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          focusNode: _focusNode,
          isReadOnly: true,
          labelText: 'User name',
          hintText: 'Mohamed_Ahmed123',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                focusNode: _focusNode,
                isReadOnly: true,
                labelText: 'First name',
                hintText: 'Mohamed',
                hintStyle: TextStyles.font16Black400Weight,
              ),
            ),
            horizontalSpace(17),
            Expanded(
              child: AppTextFormField(
                focusNode: _focusNode,
                isReadOnly: true,
                labelText: 'Last name',
                hintText: 'Ahmed',
                hintStyle: TextStyles.font16Black400Weight,
              ),
            ),
          ],
        ),
        AppTextFormField(
          focusNode: _focusNode,
          isReadOnly: true,
          labelText: 'Email',
          hintText: 'Mohamed098@gmail.com',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        AppTextFormField(
          isObscureText: true,
          focusNode: _focusNode,
          isReadOnly: true,
          hintStyle: TextStyles.font16Black400Weight,
          labelText: 'Password',
          hintText: '*' * 7,
          suffixWidget: GestureDetector(
            onTap: () {},
            child: Text(
              'Change',
              style: TextStyles.font12Primary600Weight,
            ),
          ),
        ),
        AppTextFormField(
          focusNode: _focusNode,
          isReadOnly: true,
          labelText: 'Phone Number',
          hintText: '1234567890987',
          hintStyle: TextStyles.font16Black400Weight,
        ),
        verticalSpace(40),
        AppButton(
          isExpanded: true,
          color: AppColors.grey10,
          onPressed: () {},
          text: AppStrings.update,
        ),
      ],
    );
  }
}
