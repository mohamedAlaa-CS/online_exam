import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/routing/app_router.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_state.dart';
import 'package:online_exam/presentation/main_layout/tabs/explore/QuestionsAnswers/view/questionanswer_viewModel.dart';

class CustomNavigationButtons extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onNextPressed;

  const CustomNavigationButtons({
    Key? key,
    required this.onBackPressed,
    required this.onNextPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 163.w,
            height: 48.h,
            child: ElevatedButton(
              onPressed: onBackPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  side: BorderSide(color: AppColors.primary, width: 1),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                "Back",
                style: TextStyles.font16Black400Weight,
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // زر Next
          SizedBox(
            width: 163.w,
            height: 48.h,
            child: ElevatedButton(
              onPressed: onNextPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                (BlocProvider.of<QuestionsViewModel>(context).isLastQuestion)
                    ? 'Submit'
                    : 'Next',
                style: TextStyles.font16White500Weight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
