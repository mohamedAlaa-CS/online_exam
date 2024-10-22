import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/styles.dart';

class TitleAndDescriptionForgetPassword extends StatelessWidget {
  const TitleAndDescriptionForgetPassword({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyles.font20Black500Weight.copyWith(fontSize: 18.sp),
        ),
        verticalSpace(16),
        Text(
          textAlign: TextAlign.center,
          description,
          style: TextStyles.font14PlaceHolder400Weight,
        ),
      ],
    );
  }
}
