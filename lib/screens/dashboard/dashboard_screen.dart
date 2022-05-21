import 'package:expense_tracker/screens/dashboard/dashboard_controller.dart';
import 'package:expense_tracker/screens/dashboard/widget/history_card.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/theme/app_theme.dart';
import 'package:expense_tracker/widgets/appbar/appbar.dart';
import 'package:expense_tracker/widgets/text_field/app_text_field.dart';
import 'package:expense_tracker/widgets/text_field/app_text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  final String name;
  DashboardScreen(this.name);

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<DashboardController>();
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
            ],
          ),
        ),
      ),
    );
  }
}
