import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/presentation/forget_password/manager/forget_password_view_model/forget_password_view_model.dart';
import 'package:online_exam/presentation/forget_password/manager/rest_code_view_model/reset_code_view_model.dart';
import 'package:online_exam/presentation/forget_password/views/forget_password_view.dart';
import 'package:online_exam/presentation/forget_password/views/reset_password_view.dart';
import 'package:online_exam/presentation/forget_password/views/verification_code_view.dart';
import 'package:online_exam/presentation/login/login_view.dart';
import 'package:online_exam/presentation/signup/sign_up_view.dart';
import 'package:online_exam/presentation/signup/sign_up_viewmodel.dart';

class AppRouters {
  static Route? onGeneratorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routers.signupView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<SignUpViewModel>(),
            child: const SignupView(),
          ),
        );
      case Routers.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ForgetPasswordViewModel>(),
            child: const ForgetPasswordView(),
          ),
        );
      case Routers.verificationCodeView:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<ResetCodeViewModel>(),
            child: VerificationCodeView(),
          ),
        );
      case Routers.resetPasswordView:
        return MaterialPageRoute(
          builder: (context) => const ResetPasswordView(),
        );

      default:
        return null;
    }
  }
}
