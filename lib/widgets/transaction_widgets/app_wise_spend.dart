import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
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
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: AppBoxDecoration.borderBottom(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MerchantCard(AppAssets.swiggyColored, colorCard: true),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.marchent),
              SizedBox(height: 4),
              Text(transaction.amount.toString().rupee()),
            ],
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ),
        ],
      ),
    );

    // Container(
    //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    //   decoration: AppBoxDecoration.borderBottom(),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       MerchantCard(AppAssets.amazon),
    //       SizedBox(width: 10),
    //       Column(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(transaction.marchent),
    //           SizedBox(height: 4),
    //           Text(
    //             transaction.date.dateFormat(),
    //             style: AppTextStyle.h5Regular(color: AppColors.textSecondary),
    //           ),
    //         ],
    //       ),
    //       Expanded(child: Container()),
    //       if (!showStatus)
    //         Text(
    //           transaction.amount.toString().rupee(),
    //           style: AppTextStyle.h3Bold(color: AppColors.white),
    //         )
    //       else
    //         Column(
    //           crossAxisAlignment: CrossAxisAlignment.end,
    //           children: [
    //             Text(
    //               transaction.amount.toString().rupee(),
    //               style: AppTextStyle.h3Bold(
    //                   color: transaction.paymentStatus
    //                       ? AppColors.success
    //                       : AppColors.alert),
    //             ),
    //             SizedBox(height: 4),
    //             Text(
    //               transaction.paymentStatus ? "Success" : "Failed",
    //               style: AppTextStyle.h6Regular(
    //                   color: transaction.paymentStatus
    //                       ? AppColors.success
    //                       : AppColors.alert),
    //             ),
    //           ],
    //         ),
    //     ],
    //   ),
    // );
  }
}
