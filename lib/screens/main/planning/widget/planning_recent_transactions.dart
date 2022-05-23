import 'package:expense_tracker/models/category_spend_model.dart';
import 'package:expense_tracker/widgets/transaction_widgets/recent_transactions.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PlanningRecentTrasactions extends StatelessWidget {
  final List<CategorySpendModel> transactionList;
  PlanningRecentTrasactions(this.transactionList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppBoxDecoration.container(),
      child: Column(children: [
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 20),
            SvgPicture.asset(AppAssets.fastCard),
            SizedBox(width: 20),
            Text(
              "recent transactions",
              style: AppTextStyle.h4Regular(color: AppColors.white),
            ),
          ],
        ),
        ...transactionList
            .map((e) => RecentTransaction(e, showStatus: true))
            .toList(),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "See all",
                style: AppTextStyle.h4Bold(
                  color: AppColors.blue,
                ),
              ),
              Icon(
                Icons.arrow_forward,
                color: AppColors.blue,
              )
            ],
          ),
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}
