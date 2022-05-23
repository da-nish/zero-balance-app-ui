import 'package:expense_tracker/models/enums.dart';
import 'package:expense_tracker/models/pair.dart';
import 'package:expense_tracker/screens/add_expense/add_expense_controller.dart';
import 'package:expense_tracker/screens/add_expense/widget/item_field.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/theme/app_theme.dart';
import 'package:expense_tracker/utils/datetime_extension.dart';
import 'package:expense_tracker/widgets/appbar/appbar.dart';
import 'package:expense_tracker/widgets/text_field/app_text_field.dart';
import 'package:expense_tracker/widgets/text_field/app_text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:get/get.dart';

class AddExpenseScreen extends StatefulWidget {
  AddExpenseScreen();

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AddExpenseController>();
    // homeController.setName(Get.arguments);
    return Scaffold(
      appBar: CustomAppBar("Add expense", showBackButton: true),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.grid10, vertical: Dimens.grid8),
          child: ListView(
            children: [
              SizedBox(height: Dimens.grid10),
              Text(
                  "Record your expenses for them to \nreflectin your catefories"),
              SizedBox(height: Dimens.grid10),

              ItemField(
                "Amount",
                AppTextField(
                  child: SizedBox(),
                  startText: controller.amount.toString(),
                  maxLines: 1,
                  maxLetters: 5,
                  isRightAlign: true,
                  inputType: TextInputType.number,
                  style: AppTextFieldStyle.fromTheme(AppTheme.defaultTheme),
                  labelText: "999",
                  onChanged: (value) {
                    controller.amount = int.parse(value);
                  },
                  error: null,
                ),
              ),

              ItemField(
                "Category",
                DropdownButton(
                  alignment: Alignment.bottomRight,
                  underline: SizedBox(),
                  icon: SizedBox(),
                  isExpanded: false,
                  value: controller.category,
                  style: AppTextStyle.h4Bold(color: AppColors.white),
                  hint: Text(
                    "Category",
                    textAlign: TextAlign.right,
                    style: AppTextStyle.h4Medium(color: AppColors.white),
                  ),
                  items: controller.categories.map((Pair items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items.first),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      controller.category =
                          newValue as Pair<String, CategoryType>;
                    });
                  },
                ),
              ),
              ItemField(
                "Date",
                InkWell(
                  onTap: () async {
                    controller.date =
                        await _selectDate(context, controller.date);
                    setState(() {});
                  },
                  child: Text(
                    controller.date.dateFormat(),
                    textAlign: TextAlign.right,
                    style: AppTextStyle.h3Bold(color: AppColors.white),
                  ),
                ),
              ),
              ItemField(
                "Merchant",
                DropdownButton(
                  underline: SizedBox(),
                  icon: SizedBox(),
                  isExpanded: false,
                  alignment: Alignment.bottomRight,
                  style: AppTextStyle.h3Bold(color: AppColors.white),
                  hint: Text(
                    "select",
                    textAlign: TextAlign.right,
                    style: AppTextStyle.h4Medium(color: AppColors.white),
                  ),
                  value: controller.marchant,
                  items: controller.marchentList.map((Pair items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items.first),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      controller.marchant = newValue! as Pair<String, String>;
                    });
                  },
                ),
              ),
              ItemField(
                "Paid via",
                DropdownButton(
                  underline: SizedBox(),
                  icon: SizedBox(),
                  alignment: Alignment.bottomRight,
                  value: controller.paidVia,
                  style: AppTextStyle.h3Bold(color: AppColors.white),
                  hint: Text(
                    "select",
                    textAlign: TextAlign.right,
                    style: AppTextStyle.h4Bold(color: AppColors.white),
                  ),
                  items: controller.paymentList.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      controller.paidVia = newValue!;
                    });
                  },
                ),
              ),
              // card1(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          controller.submit();
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(Dimens.grid16),
          margin: EdgeInsets.all(Dimens.grid20),
          decoration:
              AppBoxDecoration.container(containerColor: AppColors.blue),
          height: Dimens.grid52,
          width: double.infinity,
          child: Text("Done"),
        ),
      ),
    );
  }

  Future<DateTime> _selectDate(
      BuildContext context, DateTime selectedDate) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate:
            DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
        lastDate: DateTime.now(),
        firstDate: DateTime(2020, 1));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    return selectedDate;
  }
}
