import 'package:flutter/material.dart';
import '../color_utils/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.appBackground,
      fontFamily: "Montserrat",
      textTheme: TextTheme(
        headlineLarge: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: AppColors.blackTextClr,
        ),
        headlineMedium: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
          color: AppColors.blackTextClr,
        ),
        headlineSmall: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: AppColors.textColor,
        ),
        titleLarge: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: AppColors.appBackground,
        ),
        titleMedium: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: AppColors.textColorGrey,
        ),
        titleSmall: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      fontFamily: "Montserrat",
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteTextClr,
        ),
        headlineMedium: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w900,
          color: AppColors.whiteTextClr,
        ),
        headlineSmall: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteTextClr,
        ),
        titleLarge: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteTextClr,
        ),
        titleMedium: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: AppColors.whiteTextClr,
        ),
        titleSmall: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
          color: AppColors.whiteTextClr,
        ),
      ),
    );
  }
}
