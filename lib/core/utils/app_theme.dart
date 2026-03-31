import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static final ThemeData lightTheme  = ThemeData(
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.whiteColor
    ),
    appBarTheme: AppBarThemeData(
      backgroundColor: AppColors.whiteColor
    ),
    scaffoldBackgroundColor: AppColors.whiteColor
  );
}