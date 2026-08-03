import 'package:flutter/material.dart';
import 'package:sweater/core/theme/app_colors.dart';

class AppTextTheme {
  AppTextTheme._();

  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold,
    ),
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      color: AppColors.inkFaintDark
    )
  );
}