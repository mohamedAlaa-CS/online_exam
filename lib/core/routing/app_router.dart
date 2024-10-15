import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_exam/core/di/di.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/presentation/forget_password/views/forget_password_view.dart';
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
          builder: (context) => const ForgetPasswordView(),
        );
      case Routers.verificationCodeView:
        return MaterialPageRoute(
          builder: (context) => VerificationCodeView(),
        );

      default:
        return null;
    }
  }
}
