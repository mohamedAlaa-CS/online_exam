import 'package:flutter/material.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/presentation/login/login_view.dart';
import 'package:online_exam/presentation/signup/sign_up_view.dart';

class AppRouters {
  static Route? onGeneratorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );
      case Routers.signupView:
        return MaterialPageRoute(
          builder: (context) => const SignupView(),
        );

      default:
        return null;
    }
  }
}
