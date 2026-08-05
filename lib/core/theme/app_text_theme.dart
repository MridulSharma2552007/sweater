import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sweater/core/theme/app_colors.dart';
import 'package:sweater/core/theme/theme.dart';

class AppTextTheme {
  AppTextTheme._();

  static final textTheme = TextTheme(
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
    bodyLarge: GoogleFonts.fraunces(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      height: 1.15,
    ),
    bodyMedium:  GoogleFonts.karla(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    
    
  ),
    bodySmall: GoogleFonts.karla(
    fontSize: 14.5,
    fontWeight: FontWeight.w400,
   
    height: 1.65,
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