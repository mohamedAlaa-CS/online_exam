import 'package:flutter/material.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/presentation/login/login_view.dart';

class AppRouters {
  static Route? onGeneratorRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routers.loginView:
        return MaterialPageRoute(
          builder: (context) => const LoginView(),
        );

      default:
        return null;
    }
  }
}
