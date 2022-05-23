import 'package:expense_tracker/screens/main/planning/planning_controller.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/utils/functions.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';

class CircularChart extends StatelessWidget {
  final int totalSpend;
  final PlanningController controller;

  const CircularChart(this.totalSpend, this.controller, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: MultiCircularSlider(
          size: MediaQuery.of(context).size.width * .7,
          values: [
            findPercentage(controller.totalSpend, controller.totalFood),
            findPercentage(controller.totalSpend, controller.totalShopping),
            findPercentage(
                controller.totalSpend, controller.totalEntertainment),
            2
          ],
          colors: [
            AppColors.foodColor,
            AppColors.shoppingColor,
            AppColors.entertainment,
            AppColors.white
          ],
          animationDuration: const Duration(milliseconds: 500),
          animationCurve: Curves.easeIn,
          innerIcon: Icon(Icons.integration_instructions),
          innerWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.nagivationTab2),
              SizedBox(height: 10),
              Text('This month spends', textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text(totalSpend.toString().rupee(),
                  style: AppTextStyle.h1Bold(color: AppColors.white),
                  textAlign: TextAlign.center),
            ],
          ),
          trackColor: Colors.white,
          progressBarWidth: 3.0,
          trackWidth: 10.0,
          labelTextStyle: TextStyle(),
          percentageTextStyle: TextStyle(),
        )),
      ],
    );
  }
}
