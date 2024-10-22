import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';
import 'package:online_exam/data/api/model/request/verifiay_reset_code_request.dart';
import 'package:online_exam/presentation/auth/forget_password/manager/verification_code_view_model/verification_code_action.dart';
import 'package:online_exam/presentation/auth/forget_password/manager/verification_code_view_model/verification_code_view_model.dart';
import 'package:pinput/pinput.dart';

class VerificationPinPutWidget extends StatelessWidget {
  VerificationPinPutWidget({super.key});
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
    return Form(
      key: context.read<VerificationCodeViewModel>().pinPutformKey,
      child: Pinput(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your code';
          }
          return null;
        },
        controller: context.read<VerificationCodeViewModel>().pinPutController,
        defaultPinTheme: defaultPinTheme,
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: AppColors.error),
        ),
        length: 6,
        onCompleted: (pin) {
          context.read<VerificationCodeViewModel>().doAction(
              VerifyCodeAction(VerifiayResetCodeRequest(resetCode: pin)));
        },
      ),
    );
  }
}
