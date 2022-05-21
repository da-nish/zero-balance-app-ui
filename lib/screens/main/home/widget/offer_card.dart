import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  final OffersModel item;
  const OfferCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: screen.width * 0.6,
      height: 140,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.containerColorWhite,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset(item.image),
            ),
          ),
          SizedBox(height: Dimens.grid20),
          Text(
            item.offer,
            style: AppTextStyle.h2Bold(color: AppColors.dark),
          ),
          SizedBox(height: Dimens.grid10),
          Text(
            item.text,
            style: AppTextStyle.h4Bold(color: AppColors.textSecondary),
          )
        ],
      ),
    );
  }
}