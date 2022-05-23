import 'package:expense_tracker/screens/main/dashboard_controller.dart';
import 'package:expense_tracker/screens/main/home/widget/category_small_card.dart';
import 'package:expense_tracker/screens/main/planning/planning_controller.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryRow extends StatelessWidget {
  final CategoryModel item;
  final PlanningController controller;
  CategoryRow(this.item, this.controller);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: AppBoxDecoration.borderBottom(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySmallCard(item),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(controller.getTitle(item.type)),
              SizedBox(height: 4),
              Row(
                children: [
                  _circularImage(AppAssets.swiggyColored),
                  _circularImage(AppAssets.amazon),
                  _circularImage(AppAssets.amazon),
                ],
              )
            ],
          ),
          Expanded(child: Container()),
          Center(
            child: Text(
              controller.getSpend(item.type).toString().rupee(),
              style: AppTextStyle.h3Bold(),
            ),
          ),
          SizedBox(width: 10),
          Center(
            child: Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _circularImage(String image) {
    return Container(
        margin: const EdgeInsets.only(right: 4),
        child: CircleAvatar(
          backgroundColor: AppColors.white,
          radius: 10,
          child: SvgPicture.asset(
            image,
            height: 10,
          ),
        ));
  }
}
