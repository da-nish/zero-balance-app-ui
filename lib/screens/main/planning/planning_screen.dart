import 'package:expense_tracker/screens/main/planning/planning_controller.dart';
import 'package:expense_tracker/screens/main/planning/widget/category_record.dart';
import 'package:expense_tracker/screens/main/planning/widget/circular_chart.dart';
import 'package:expense_tracker/screens/main/planning/widget/recent_transactions.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class PlanningScreen extends StatelessWidget {
  PlanningScreen();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlanningController>();
    controller.init();
    return Scaffold(
      appBar: CustomAppBar("Planning"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Container(
                padding: const EdgeInsets.all(30),
                decoration: AppBoxDecoration.container(),
                child: CircularChart(controller.totalSpend, controller)),
            SizedBox(height: 20),
            Text(
              "categories",
              style: AppTextStyle.h4Regular(color: AppColors.white),
            ),
            SizedBox(height: 20),
            Container(
              decoration: AppBoxDecoration.container(),
              child: Column(
                  children: controller.categories
                      .map((e) => CategoryRow(e, controller))
                      .toList()),
            ),
            SizedBox(height: 20),
            Container(
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
                ...controller.transactionList
                    .map((e) => RecentTransaction(e))
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
            )
          ],
        ),
      ),
    );
  }
}
