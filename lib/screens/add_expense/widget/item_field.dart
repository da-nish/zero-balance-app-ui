import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/theme/app_colors.dart';

class ItemField extends StatelessWidget {
  final String title;
  final Widget field;

  ItemField(this.title, this.field);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(
          horizontal: Dimens.grid20, vertical: Dimens.grid8),
      margin: const EdgeInsets.symmetric(vertical: Dimens.grid8),
      decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyle.h3Regular(color: AppColors.white),
          ),
          Container(width: 120, alignment: Alignment.centerRight, child: field),
        ],
      ),
    );
  }
}
