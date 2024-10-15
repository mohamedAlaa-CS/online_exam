import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/presentation/forget_password/widgets/donot_receive_code_text_and_resend_button.dart';
import 'package:online_exam/presentation/forget_password/widgets/ttitle_and_description_forget_password.dart';
import 'package:pinput/pinput.dart';

class VerificationCodeView extends StatelessWidget {
  VerificationCodeView({super.key});
  final defaultPinTheme = PinTheme(
    width: 67.w,
    height: 60.h,
    textStyle: TextStyles.font20Black500Weight,
    decoration: BoxDecoration(
      color: AppColors.pinPut,
      border: Border.all(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10.r),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TitleOfView(title: 'Password'),
                verticalSpace(40),
                const TitleAndDescriptionForgetPassword(
                  title: 'Email verification',
                  description:
                      'Please enter your code that send to your \n email address ',
                ),
                verticalSpace(32),
                Pinput(
                  validator: (value) {
                    if (value!.length != 6) {
                      return 'Invalid code';
                    }
                    return null;
                  },
                  defaultPinTheme: defaultPinTheme,
                  errorPinTheme: defaultPinTheme.copyBorderWith(
                    border: Border.all(color: AppColors.error),
                  ),
                  length: 6,
                  onCompleted: (pin) {
                    // todo : call verify otp api here & nav to reset password
                    context.pushName(Routers.resetPasswordView);
                  },
                ),
                verticalSpace(24),
                const DonotReceiveCodeTextAndResendButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
