import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account? ',
            style:
                TextStyles.font16Gray400Weight.copyWith(color: AppColors.black),
          ),
          TextSpan(
            text: 'Login',
            style: TextStyles.font16Gray400Weight.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //todo : navigate to login view
                context.pushName(Routers.loginView);
              },
          ),
        ],
      ),
    );
  }
}
