import 'package:flutter/material.dart';
import 'package:online_exam/core/theming/colors.dart';
import 'package:online_exam/core/theming/styles.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: TextStyles.font20Black500Weight,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBlue,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primary,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      unselectedItemColor: AppColors.black30,
      selectedIconTheme: const IconThemeData(
        color: AppColors.primary,
        size: 26,
      ),
      selectedLabelStyle: TextStyles.font12Primary600Weight,
      unselectedIconTheme: IconThemeData(
        color: AppColors.black30,
        size: 24,
      ),
      unselectedLabelStyle:
          TextStyles.font12Primary600Weight.copyWith(color: AppColors.black30),
    ),
  );
  static ThemeData darkTheme = ThemeData();
}
