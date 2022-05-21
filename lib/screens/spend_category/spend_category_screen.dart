import 'package:expense_tracker/screens/spend_category/widget/bar_chart.dart';
import 'package:expense_tracker/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class SpendCategoryScreen extends StatelessWidget {
  SpendCategoryScreen();

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<AddExpenseController>();
    // homeController.setName(Get.arguments);
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: ListView(
            children: [
              SizedBox(height: 10),
              Text(
                  "Record your expenses for them to \nreflectin your catefories"),
              SizedBox(height: 10),
              Container(width: 400, height: 400, child: CustomRoundedBars([]))
              // card1(),
            ],
          ),
        ),
      ),
    );
  }
}
