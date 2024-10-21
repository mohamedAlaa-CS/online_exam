import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/presentation/forget_password/manager/verification_code_view_model/verification_code_action.dart';
import 'package:online_exam/presentation/forget_password/manager/verification_code_view_model/verification_code_view_model.dart';

class DonotReceiveCodeTextAndResendButton extends StatelessWidget {
  const DonotReceiveCodeTextAndResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Didn\'t receive code? ',
            style:
                TextStyles.font16Gray400Weight.copyWith(color: AppColors.black),
          ),
          TextSpan(
            text: 'Resend',
            style: TextStyles.font16Gray400Weight.copyWith(
              color: AppColors.primary,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //todo : navigate to login view
                context
                    .read<VerificationCodeViewModel>()
                    .doAction(ResendOtpAction());
                //  context.pushName(Routers.loginScreen);
              },
          ),
        ],
      ),
    );
  }
}
