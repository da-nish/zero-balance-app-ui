import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final defaultTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.dark,
      fontFamily: 'Montserrat',
      highlightColor: Colors.transparent,
      textTheme: ThemeData.dark().textTheme.copyWith(
            bodyText1: const TextStyle(
              fontSize: Dimens.h5,
              fontWeight: FontWeight.w400,
              color: AppColors.white,
            ),
            bodyText2: const TextStyle(
              fontSize: Dimens.h4,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
            headline1: const TextStyle(
              fontSize: Dimens.h1,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
            headline2: const TextStyle(
              fontSize: Dimens.h2,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimaryGrey,
            ),
            headline3: const TextStyle(
              fontSize: Dimens.h3,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
      iconTheme: IconThemeData(
        color: Colors.grey[600],
      ),
      cardTheme: CardTheme(
          shadowColor: Colors.grey[200],
          color: AppColors.dark,
          margin: EdgeInsets.zero,
          elevation: 8.0),
      buttonTheme: const ButtonThemeData(
        height: 56,
      ),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: Colors.black,
      ),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: AppColors.activeGreen));

  Type get colors => AppColors;

  Type get textStyles => AppTextStyle;
}
