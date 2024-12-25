import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({
    super.key,
    required this.text,
    this.color,
    required this.onPressed,
    this.isExpanded = false,
    this.raduis,
  });
  final String text;
  final Color? color;
  final VoidCallback onPressed;
  final bool isExpanded;
  final double? raduis;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: isExpanded ? double.infinity : null,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.r),
          ),
        ),
        child: Text(
          text,
          style: TextStyles.font16White500Weight
              .copyWith(color: AppColors.primary),
        ),
      ),
    );
  }
}
