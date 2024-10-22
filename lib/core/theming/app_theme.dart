import 'package:flutter/material.dart';
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
  );
  static ThemeData darkTheme = ThemeData();
}
