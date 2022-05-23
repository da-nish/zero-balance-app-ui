import 'package:expense_tracker/screens/name_screen/name_controller.dart';
import 'package:expense_tracker/theme/app_theme.dart';
import 'package:expense_tracker/widgets/text_field/app_text_field.dart';
import 'package:expense_tracker/widgets/text_field/app_text_field_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/theme/app_colors.dart';

class NameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    final controller = Get.find<NameController>();
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 120),
          Text(
            "Please type your name",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: AppColors.grey),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(50)),
            child: Row(
              children: [
                SizedBox(width: 6),
                Icon(Icons.account_circle_rounded),
                SizedBox(width: 6),
                Expanded(
                  child: AppTextField(
                    startText: "",
                    maxLines: 1,
                    inputType: TextInputType.number,
                    style: AppTextFieldStyle.fromTheme(AppTheme.defaultTheme),
                    labelText: "Name",
                    onChanged: (value) {
                      textController.text = value;
                    },
                    error: null,
                  ),
                ),
                IconButton(
                    color: AppColors.grey,
                    onPressed: () => controller.submit(textController.text),
                    icon: Icon(Icons.arrow_forward))
              ],
            ),
          )
        ],
      ),
    ));
  }
}
