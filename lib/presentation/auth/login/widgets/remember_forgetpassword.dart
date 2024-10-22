import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/helper/extensions.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/presentation/auth/login/login_viewmodel.dart';

class RememberAndForgetPassword extends StatelessWidget {
  const RememberAndForgetPassword({
    super.key,
    required this.viewModel,
  });

  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: AppColors.grey,
              value: viewModel.rememberMe,
              onChanged: (value) {
                viewModel.toggleRememberMe();
              },
            ),
            Text('Remember me',
                style: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.blackBase,
                    fontWeight: FontWeight.w400)),
          ],
        ),
        TextButton(
          onPressed: () {
            context.pushName(Routers.forgetPassword);
          },
          child: Text('Forgot password?',
              style: TextStyle(
                  fontSize: 13.sp,
                  decoration: TextDecoration.underline,
                  color: AppColors.blackBase,
                  fontWeight: FontWeight.w400)),
        ),
      ],
    );
  }
}
