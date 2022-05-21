import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/screens/dashboard/dashboard_controller.dart';
import 'package:expense_tracker/theme/app_colors.dart';

class DashboardScreen extends StatelessWidget {
  final String name;
  DashboardScreen(this.name);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<DashboardController>();
    homeController.setName(Get.arguments);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        width: double.infinity,
        child: ListView(
          children: [
            card1(),
            card1(),
            card1(),
          ],
        ),
      ),
    );
  }

  Widget card1() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.dark, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Left",
          ),
          Text("right")
        ],
      ),
    );
  }
}
