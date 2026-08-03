import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.paperLight,
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.paperDark,
  );
 

 //check if the current theme is dark or light
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color paper(BuildContext context) =>
      isDark(context) ? AppColors.paperDark : AppColors.paperLight;

  static Color paperDim(BuildContext context) =>
      isDark(context) ? AppColors.paperDimDark : AppColors.paperDimLight;

  static Color card(BuildContext context) =>
      isDark(context) ? AppColors.cardDark : AppColors.cardLight;

  static Color ink(BuildContext context) =>
      isDark(context) ? AppColors.inkDark : AppColors.inkLight;

  static Color inkSoft(BuildContext context) =>
      isDark(context) ? AppColors.inkSoftDark : AppColors.inkSoftLight;

  static Color inkFaint(BuildContext context) =>
      isDark(context) ? AppColors.inkFaintDark : AppColors.inkFaintLight;

  static Color line(BuildContext context) =>
      isDark(context) ? AppColors.lineDark : AppColors.lineLight;

  static Color accentRust(BuildContext context) =>
      isDark(context) ? AppColors.accentRustDark : AppColors.accentRustLight;

  static Color accentRustDim(BuildContext context) =>
      isDark(context)
          ? AppColors.accentRustDimDark
          : AppColors.accentRustDimLight;

  static Color accentMustard(BuildContext context) =>
      isDark(context)
          ? AppColors.accentMustardDark
          : AppColors.accentMustardLight;

  static Color accentMustardDim(BuildContext context) =>
      isDark(context)
          ? AppColors.accentMustardDimDark
          : AppColors.accentMustardDimLight;

  static Color accentSage(BuildContext context) =>
      isDark(context) ? AppColors.accentSageDark : AppColors.accentSageLight;

  static Color accentSageDim(BuildContext context) =>
      isDark(context)
          ? AppColors.accentSageDimDark
          : AppColors.accentSageDimLight;

  static Color terminalPaper(BuildContext context) =>
      isDark(context)
          ? AppColors.terminalPaperDark
          : AppColors.terminalPaperLight;

  static Color danger(BuildContext context) =>
      isDark(context) ? AppColors.dangerDark : AppColors.dangerLight;
}