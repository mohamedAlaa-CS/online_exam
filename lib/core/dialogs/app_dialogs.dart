import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';

class AppDialogs {
  static void showSuccessDialog(
    BuildContext context, {
    required String titile,
    required String description,
    required String buttonText,
    required VoidCallback onButtonClicked,
  }) {
    //context.pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(titile),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(description),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppColors.primary,
                disabledForegroundColor: Colors.grey,
              ),
              onPressed: onButtonClicked,
              child: Text(buttonText),
            ),
          ],
        );
      },
    );
  }

  static void showErrorDialog(BuildContext context, String error) {
    // context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          textAlign: TextAlign.center,
          error,
          style: TextStyles.font20Black500Weight.copyWith(fontSize: 16.sp),
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font16Gray400Weight,
            ),
          ),
        ],
      ),
    );
  }

  static void showLoadingDialog(BuildContext context) {
    //context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(
              color: AppColors.primary,
            ),
            horizontalSpace(16),
            Text(
              textAlign: TextAlign.center,
              'Loading ...',
              style: TextStyles.font20Black500Weight.copyWith(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}
