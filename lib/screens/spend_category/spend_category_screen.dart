import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:expense_tracker/screens/main/home/widget/category_small_card.dart';
import 'package:expense_tracker/screens/spend_category/widget/this_month_spend.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:expense_tracker/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SpendCategoryScreen extends StatelessWidget {
  SpendCategoryScreen();

  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<AddExpenseController>();
    // homeController.setName(Get.arguments);

    return Scaffold(
      appBar: CustomAppBar("Food", showBackButton: true),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: ListView(
            children: [
              SizedBox(height: 10),
              ThisMonthSpend(),
              SizedBox(height: 10),
              Container(
                decoration: AppBoxDecoration.container(),
                child: Column(
                  children: [
                    _row(),
                    _row(),
                    _row(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: AppBoxDecoration.container(),
                child: Column(
                  children: [
                    _row1(),
                    _row1(),
                    _row1(),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: AppBoxDecoration.container(),
                child: Column(
                  children: [
                    _row2(),
                    _row2(),
                    _row2(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget imageCard(String image, {bool colorCard = false}) {
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: colorCard
          ? AppBoxDecoration.coloredImageCard()
          : AppBoxDecoration.imageCard(),
      child: SvgPicture.asset(image),
    );
  }

  Widget _row() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: AppBoxDecoration.borderBottom(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageCard(AppAssets.amazon),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Amazon"),
              SizedBox(height: 4),
              Text(
                "\u{20B9} 1500",
                style: AppTextStyle.h5Regular(color: AppColors.textSecondary),
              ),
            ],
          ),
          Expanded(child: Container()),
          Column(
            children: [
              Text(
                "\u{20B9} 1500",
                style: AppTextStyle.h3Bold(color: AppColors.alert),
              ),
              SizedBox(height: 4),
              Text(
                "Failed",
                style: AppTextStyle.h6Regular(color: AppColors.alert),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _row1() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: AppBoxDecoration.borderBottom(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          imageCard(AppAssets.swiggyColored, colorCard: true),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Amazon"),
              SizedBox(height: 4),
              Text("\u{20B9} 1500"),
            ],
          ),
          Expanded(child: Container()),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Icon(Icons.arrow_forward_ios_rounded, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _row2() {
    return Container(
      height: 95,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      decoration: AppBoxDecoration.borderBottom(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategorySmallCard(
            CategoryModel("Food", AppColors.activeBlue, AppAssets.food),
          ),
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Food"),
              SizedBox(height: 4),
              Row(
                children: [
                  circularImage(AppAssets.swiggyColored),
                  circularImage(AppAssets.amazon),
                  circularImage(AppAssets.amazon),
                ],
              )
            ],
          ),
          Expanded(child: Container()),
          Center(
            child: Text(
              "1500".rupee(),
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

  Widget circularImage(String image) {
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
