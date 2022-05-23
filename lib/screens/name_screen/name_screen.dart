import 'package:expense_tracker/screens/name_screen/name_controller.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
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
      padding: EdgeInsets.symmetric(horizontal: Dimens.grid16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Please type your \nname",
            style: TextStyle(
                fontSize: Dimens.grid40,
                fontWeight: FontWeight.bold,
                color: AppColors.grey),
          ),
          SizedBox(height: Dimens.grid28),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: Dimens.grid8, vertical: Dimens.grid4),
            decoration: BoxDecoration(
                color: AppColors.containerColor,
                borderRadius: BorderRadius.circular(Dimens.grid52)),
            child: Row(
              children: [
                SizedBox(width: Dimens.grid8),
                Icon(Icons.account_circle_rounded),
                SizedBox(width: Dimens.grid8),
                Expanded(
                  child: AppTextField(
                    startText: "",
                    maxLines: 1,
                    inputType: TextInputType.name,
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
