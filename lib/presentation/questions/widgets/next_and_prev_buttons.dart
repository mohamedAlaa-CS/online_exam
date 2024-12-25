import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/app_strings.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/app_button.dart';

class NextAndPrevButtons extends StatelessWidget {
  const NextAndPrevButtons({
    super.key,
    required this.nextButtonOnPressed,
    required this.prevButtonOnPressed,
  });
  final VoidCallback nextButtonOnPressed;
  final VoidCallback prevButtonOnPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: SizedBox(
              height: 48.h,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {
                  prevButtonOnPressed.call();
                },
                child: Text(
                  AppStrings.previous,
                  style: TextStyles.font16White500Weight
                      .copyWith(color: AppColors.primary),
                ),
              ),
            ),
          ),
          horizontalSpace(16),
          Expanded(
            child: AppButton(
              raduis: 10.r,
              text: AppStrings.next,
              onPressed: () {
                nextButtonOnPressed.call();
              },
            ),
          ),
        ]);
  }
}
