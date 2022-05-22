import 'package:expense_tracker/screens/main/planning/widget/circular_chart.dart';
import 'package:expense_tracker/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class PlanningScreen extends StatelessWidget {
  PlanningScreen();

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<PlanningController>();
    // homeController.setName(Get.arguments);
    return Scaffold(
      appBar: CustomAppBar("Planning"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: ListView(
          children: [SizedBox(height: 100), CircularChart()],
        ),
      ),
    );
  }
}
