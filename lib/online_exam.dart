import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam/core/routing/app_router.dart';
import 'package:online_exam/core/routing/routes.dart';
import 'package:online_exam/core/theming/app_theme.dart';

class OnlineExam extends StatelessWidget {
  const OnlineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        onGenerateRoute: AppRouters.onGeneratorRoute,
        initialRoute: Routers.signupView,
        home: child,
      ),
    );
  }
}
