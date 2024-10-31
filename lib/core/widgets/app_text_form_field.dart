import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    required this.labelText,
    this.hintText,
    this.controller,
    this.validator,
    this.isObscureText,
    this.suffixIcon,
    this.isReadOnly = false,
    this.focusNode,
    this.suffixWidget,
    this.hintStyle,
  });
  final String labelText;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final bool? isReadOnly;
  final FocusNode? focusNode;
  final Widget? suffixWidget;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText ?? false,
        validator: validator,
        readOnly: isReadOnly ?? false,
        focusNode: focusNode,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          // floatingLabelStyle: const TextStyle(color: Colors.red),
          errorStyle: const TextStyle(color: AppColors.error),
          hintStyle: hintStyle ?? TextStyles.font14PlaceHolder400Weight,
          labelStyle: TextStyles.font14PlaceHolder400Weight,
          suffixIcon: suffixIcon,
          suffix: suffixWidget,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1.3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1.3,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1.3,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.error,
              width: 1.3,
            ),
          ),

          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1.3,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.r),
            borderSide: const BorderSide(
              color: AppColors.grey,
              width: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
