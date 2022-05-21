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

class AddExpenseScreen extends StatelessWidget {
  final String name;
  AddExpenseScreen(this.name);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<DashboardController>();
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

              ItemField(
                "Amount",
                AppTextField(
                  child: AppIcon.rupee,
                  startText: "",
                  maxLines: 1,
                  maxLetters: 5,
                  inputType: TextInputType.number,
                  style: AppTextFieldStyle.fromTheme(AppTheme.defaultTheme),
                  labelText: "100",
                  onChanged: (value) {},
                  error: null,
                ),
              ),

              ItemField(
                "Category",
                DropdownButton(
                  // Initial Value
                  // value: dropdownvalue,
                  underline: SizedBox(),
                  // icon: SizedBox(),
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  isExpanded: false,
                  hint: Text(
                    "Category",
                    textAlign: TextAlign.right,
                    style: AppTextStyle.h4Medium(color: AppColors.white),
                  ),
                  items: homeController.items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ),
              ItemField(
                "Date",
                AppTextField(
                  child: AppIcon.rupee,
                  startText: "",
                  maxLines: 1,
                  maxLetters: 5,
                  inputType: TextInputType.number,
                  style: AppTextFieldStyle.fromTheme(AppTheme.defaultTheme),
                  labelText: "100",
                  onChanged: (value) {},
                  error: null,
                ),
              ),
              ItemField(
                "Merchant",
                DropdownButton(
                  // Initial Value
                  // value: dropdownvalue,
                  underline: SizedBox(),
                  // icon: SizedBox(),
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  isExpanded: false,
                  hint: Text(
                    "Category",
                    textAlign: TextAlign.right,
                    style: AppTextStyle.h4Medium(color: AppColors.white),
                  ),
                  items: homeController.items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ),
              ItemField(
                "Paid via",
                DropdownButton(
                  // Initial Value
                  // value: dropdownvalue,
                  underline: SizedBox(),
                  // icon: SizedBox(),
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  isExpanded: false,
                  hint: Text(
                    "Category",
                    textAlign: TextAlign.right,
                    style: AppTextStyle.h4Medium(color: AppColors.white),
                  ),
                  items: homeController.items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {},
                ),
              ),
              // card1(),
            ],
          ),
        ),
      ),
    );
  }
}
