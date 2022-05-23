import 'package:expense_tracker/screens/main/dashboard_controller.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentTransaction extends StatelessWidget {
  final CategorySpendModel transaction;
  RecentTransaction(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: AppBoxDecoration.borderBottom(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageCard(transaction.image),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(transaction.marchent),
              SizedBox(height: 4),
              Text(
                transaction.amount.toString().rupee(),
                style: AppTextStyle.h5Regular(color: AppColors.textSecondary),
              ),
            ],
          ),
          Expanded(child: Container()),
          Column(
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

  Widget imageCard(String image, {bool colorCard = false}) {
    print("$image");
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: colorCard
          ? AppBoxDecoration.coloredImageCard()
          : AppBoxDecoration.imageCard(),
      child: SvgPicture.asset(image,
          placeholderBuilder: (_) => SvgPicture.asset(AppAssets.swiggy)),
    );
  }
}
