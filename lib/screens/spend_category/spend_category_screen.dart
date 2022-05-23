import 'package:expense_tracker/models/category_model.dart';
import 'package:expense_tracker/routes/get_pages.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/widgets/transaction_widgets/app_wise_spend.dart';
import 'package:expense_tracker/widgets/transaction_widgets/recent_transactions.dart';
import 'package:expense_tracker/screens/spend_category/spend_category_controller.dart';
import 'package:expense_tracker/screens/spend_category/widget/this_month_spend.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/widgets/add_button/add_button.dart';
import 'package:expense_tracker/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SpendCategoryScreen extends StatelessWidget {
  SpendCategoryScreen();

  @override
  Widget build(BuildContext context) {
    CategoryModel item = Get.arguments;
    final controller = Get.find<SpendCategoryController>();
    controller.init(item.type);

    return Scaffold(
      appBar: CustomAppBar("Food", showBackButton: true),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.grid8, vertical: Dimens.grid8),
          child: ListView(
            children: [
              SizedBox(height: Dimens.grid8),
              ThisMonthSpend(item, controller),
              SizedBox(height: Dimens.grid20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(AppAssets.thunder),
                  SizedBox(width: Dimens.grid8),
                  Text(
                    "App wise spends",
                    style: AppTextStyle.h3Medium(
                      color: AppColors.white,
                    ),
                  ),
                  Expanded(child: Container()),
                  AddButton(() {
                    Get.toNamed(GetPages.addExpense);
                  }),
                ],
              ),
              SizedBox(height: Dimens.grid8),
              Container(
                decoration: AppBoxDecoration.container(),
                child: Column(
                    children: controller.transactionList
                        .map((e) => AppWiseSpend(e))
                        .toList()),
              ),
              SizedBox(height: Dimens.grid8),
              Text(
                controller.transactionList.isEmpty
                    ? "No transaction found"
                    : "View all",
                style: AppTextStyle.h4Medium(color: AppColors.textGrey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Dimens.grid20),
              if (controller.transactionList.isNotEmpty)
                Text(
                  "Recent Transactions",
                  style: AppTextStyle.h3Medium(color: AppColors.white),
                ),
              SizedBox(height: Dimens.grid8),
              Container(
                decoration: AppBoxDecoration.container(),
                child: Column(
                    children: controller.transactionList
                        .map((e) => RecentTransaction(e))
                        .toList()),
              ),
              SizedBox(height: Dimens.grid8),
            ],
          ),
        ),
      ),
    );
  }
}
