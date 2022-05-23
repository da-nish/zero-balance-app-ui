import 'package:expense_tracker/models/category_spend_model.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/utils/datetime_extension.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:expense_tracker/widgets/merchant_card/merchant_card.dart';
import 'package:flutter/material.dart';

class RecentTransaction extends StatelessWidget {
  final CategorySpendModel transaction;
  final bool showStatus;
  RecentTransaction(this.transaction, {this.showStatus = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: Dimens.grid20, horizontal: Dimens.grid20),
      decoration: AppBoxDecoration.borderBottom(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MerchantCard(transaction.image),
          SizedBox(width: Dimens.grid10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.marchent),
              SizedBox(height: Dimens.grid4),
              Text(
                transaction.date.dateFormat(),
                style: AppTextStyle.h5Regular(color: AppColors.textSecondary),
              ),
            ],
          ),
          Expanded(child: Container()),
          if (!showStatus)
            Text(
              transaction.amount.toString().rupee(),
              style: AppTextStyle.h3Bold(color: AppColors.white),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  transaction.amount.toString().rupee(),
                  style: AppTextStyle.h3Bold(
                      color: transaction.paymentStatus
                          ? AppColors.success
                          : AppColors.alert),
                ),
                SizedBox(height: 4),
                Text(
                  transaction.paymentStatus ? "Success" : "Failed",
                  style: AppTextStyle.h6Regular(
                      color: transaction.paymentStatus
                          ? AppColors.success
                          : AppColors.alert),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
