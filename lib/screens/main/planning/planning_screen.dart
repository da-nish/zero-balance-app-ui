import 'package:expense_tracker/screens/main/planning/widget/circular_chart.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/widgets/appbar/appbar.dart';
import 'package:expense_tracker/widgets/appbar/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';

class PlanningScreen extends StatelessWidget {
  PlanningScreen();

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<PlanningController>();
    // homeController.setName(Get.arguments);
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: ListView(
          children: [SizedBox(height: 100), CircularChart()],
        ),
      ),
    );
  }
}