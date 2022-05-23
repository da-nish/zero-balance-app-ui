import 'package:expense_tracker/screens/add_expense/add_expense_screen.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.white, width: 2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(AppAssets.plus),
          InkWell(
            onTap: () {
              Get.toNamed("/add-expense");
            },
            child: Text("Add expense",
                style: AppTextStyle.h4Bold(color: AppColors.white)),
          )
        ],
      ),
    );
  }
}
