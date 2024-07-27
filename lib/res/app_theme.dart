import 'package:e_shop/res/color.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData theme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      alignLabelWithHint: true,
      isDense: true,
      iconColor: AppColors.white,
      prefixIconColor: AppColors.white,
      suffixIconColor: AppColors.white,
      labelStyle: const TextStyle(fontSize: 14),
      hintStyle: const TextStyle(fontSize: 14),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(width: 2),
      errorBorder: _border(color: AppColors.error),
      focusedErrorBorder: _border(color: AppColors.error, width: 2),
      disabledBorder: _border(color: AppColors.grey),
    ),
    fontFamily: 'Poppins',
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      scrolledUnderElevation: 0,
      elevation: 0,
    ),
    cardColor: AppColors.white,
  );
}

OutlineInputBorder _border({
  Color color = AppColors.primary,
  double width = 1,
}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
