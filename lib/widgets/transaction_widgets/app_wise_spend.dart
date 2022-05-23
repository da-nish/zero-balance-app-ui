import 'package:expense_tracker/models/category_spend_model.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:expense_tracker/widgets/merchant_card/merchant_card.dart';
import 'package:flutter/material.dart';

class AppWiseSpend extends StatelessWidget {
  final CategorySpendModel transaction;
  final bool showStatus;
  AppWiseSpend(this.transaction, {this.showStatus = false, Key? key})
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
          MerchantCard(transaction.image, colorCard: true),
          SizedBox(width: Dimens.grid10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.marchent),
              SizedBox(height: Dimens.grid4),
              Text(transaction.amount.toString().rupee()),
            ],
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(top: Dimens.grid12),
            child: Icon(Icons.arrow_forward_ios_rounded, size: Dimens.grid16),
          ),
        ],
      ),
    );
  }
}
