import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTextFieldStyle {
  final double height;
  final Color backgroundColor;
  final Color cursorColor;
  final double backgroundCornerRadius;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;
  final double childPadding;
  final double floatingHintSpacing;
  final double floatingErrorSpacing;
  final TextStyle style;
  final TextStyle hintStyle;
  final TextStyle floatingHintStyle;
  final TextStyle floatingErrorStyle;
  final String floatingErrorIcon;
  final Color focusedBorderColor;
  final Duration animationsDuration;
  final Color errorColor;

  AppTextFieldStyle.fromTheme(
    ThemeData theme, {
    this.height = Dimens.textFieldHeight,
    this.backgroundCornerRadius = Dimens.buttonCornerRadius,
    this.contentHorizontalPadding = Dimens.paddingS,
    this.contentVerticalPadding = Dimens.paddingXS,
    this.floatingHintSpacing = Dimens.grid8,
    this.floatingErrorSpacing = Dimens.grid8,
    this.childPadding = Dimens.paddingXS,
    this.floatingErrorIcon = "assets/ic_alert_text_icon_white.png",
    this.animationsDuration = Dimens.durationS,
    this.backgroundColor = AppColors.darkGrey,
  })  : focusedBorderColor = AppColors.grey,
        cursorColor = AppColors.textPrimary,
        errorColor = AppColors.errorColor,
        style = AppTextStyle.h3Bold(color: AppColors.textPrimary),
        hintStyle = AppTextStyle.h4Regular(color: AppColors.textPrimaryGrey),
        floatingHintStyle =
            AppTextStyle.h5Bold(color: AppColors.textPrimaryGrey),
        floatingErrorStyle =
            AppTextStyle.h4Regular(color: AppColors.errorColor);

  AppTextFieldStyle.fromThemeLarge(ThemeData theme,
      {this.height = Dimens.textFieldHeight,
      this.backgroundCornerRadius = Dimens.buttonCornerRadius,
      this.contentHorizontalPadding = Dimens.paddingS,
      this.contentVerticalPadding = Dimens.paddingXS,
      this.floatingHintSpacing = Dimens.grid8,
      this.floatingErrorSpacing = Dimens.grid8,
      this.childPadding = Dimens.paddingXS,
      this.floatingErrorIcon = "assets/ic_alert_text_icon_white.png",
      this.animationsDuration = Dimens.durationS,
      this.style = const TextStyle(
          fontSize: Dimens.h1,
          fontWeight: FontWeight.w800,
          color: AppColors.textPrimary)})
      : backgroundColor = AppColors.darkGrey,
        focusedBorderColor = AppColors.grey,
        cursorColor = AppColors.textPrimary,
        errorColor = AppColors.errorColor,
        hintStyle = AppTextStyle.h1Regular(color: AppColors.textPrimaryGrey),
        floatingHintStyle =
            AppTextStyle.h1Bold(color: AppColors.textPrimaryGrey),
        floatingErrorStyle =
            AppTextStyle.h1Regular(color: AppColors.errorColor);
}
