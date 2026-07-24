import 'package:flutter/material.dart';
import 'package:islamic_app/utils/app_styles.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(),
  textTheme: TextTheme(
    headlineLarge: AppStyles.bold16White,
  )
  );
}