import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/spacing.dart';
import 'package:online_exam/core/widgets/title_of_view.dart';
import 'package:online_exam/presentation/forget_password/widgets/donot_receive_code_text_and_resend_button.dart';
import 'package:online_exam/presentation/forget_password/widgets/resend_otp_view_model_listener.dart';
import 'package:online_exam/presentation/forget_password/widgets/ttitle_and_description_forget_password.dart';
import 'package:online_exam/presentation/forget_password/widgets/verification_code_view_model_listener.dart';
import 'package:online_exam/presentation/forget_password/widgets/verification_pin_put_widget.dart';

class VerificationCodeView extends StatelessWidget {
  const VerificationCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                VerificationPinPutWidget(),
                verticalSpace(24),
                const DonotReceiveCodeTextAndResendButton(),
                const VerificationCodeViewModelListener(),
                const ResendOtpViewModelListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
