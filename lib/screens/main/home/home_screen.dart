import 'package:expense_tracker/screens/main/dashboard_controller.dart';
import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:expense_tracker/screens/main/home/widget/add_button.dart';
import 'package:expense_tracker/screens/main/home/widget/category_card.dart';
import 'package:expense_tracker/screens/main/home/widget/offer_card.dart';
import 'package:expense_tracker/screens/main/home/widget/refer_card.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/widgets/appbar/main_appbar.dart';
import 'package:expense_tracker/widgets/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    final homeController = Get.find<HomeController>();
    homeController.init();
    return Container(
      color: AppColors.appBackground,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.grid16),
          child: Scaffold(
            appBar: CustomMainAppBar(),
            body: ListView(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Hello, ${dashboardController.username}!",
                        style: AppTextStyle.h1Bold(),
                      ),
                    ),
                    // Expanded(child: Container()),
                    AddButton()
                  ],
                ),
                SizedBox(height: 10),
                Text("Lets help you stay on top \nof your finances",
                    style: AppTextStyle.h3Medium(color: AppColors.textGrey)),
                SizedBox(height: 10),
                SliderCard(homeController.totalSpend.value),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "favourite categories",
                        style: AppTextStyle.h4Regular(color: AppColors.white),
                      ),
                      Text(
                        "mangage",
                        style: AppTextStyle.h4Bold(color: AppColors.blue),
                      )
                    ]),
                SizedBox(height: 10),
                Container(
                  height: 140,
                  width: 140,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: homeController.categories
                          .map((e) => CategoryCard(e))
                          .toList()),
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "popular rewards",
                        style: AppTextStyle.h4Regular(color: AppColors.white),
                      ),
                      Text(
                        "explore all",
                        style: AppTextStyle.h4Bold(color: AppColors.blue),
                      )
                    ]),
                SizedBox(height: 10),
                Text(
                  "pay with zerobalance card",
                  style: AppTextStyle.h5Medium(color: AppColors.textGrey),
                ),
                SizedBox(height: 10),
                Container(
                  height: 160,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: homeController.offerItems
                          .map((e) => OfferCard(e))
                          .toList()),
                ),
                SizedBox(height: 10),
                ReferCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
