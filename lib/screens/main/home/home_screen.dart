import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:expense_tracker/screens/main/home/widget/category_card.dart';
import 'package:expense_tracker/screens/main/home/widget/offer_card.dart';
import 'package:expense_tracker/screens/main/home/widget/refer_card.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/widgets/appbar/main_appbar.dart';
import 'package:expense_tracker/widgets/slider/slider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final String name;
  HomeScreen(this.name);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    homeController.setName(Get.arguments);
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, ${homeController.username}!",
                          style: AppTextStyle.h1Bold(),
                        ),
                        SizedBox(height: Dimens.grid8),
                        Text(
                            "Lets help you stay on top \nof your finances, ${homeController.username}!",
                            style: AppTextStyle.h3Medium(
                                color: AppColors.textGrey)),
                      ],
                    ),
                    Text("button")
                  ],
                ),
                SizedBox(height: 10),
                SliderCard(10000),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("data"), Text("manage")]),
                Container(
                  height: 200,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: homeController.items
                          .map((e) => CategoryCard(e))
                          .toList()),
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("data"), Text("explore all")]),
                SizedBox(height: 10),
                Container(
                  height: 180,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: homeController.offerItems
                          .map((e) => OfferCard(e))
                          .toList()),
                ),
                SizedBox(height: 10),
                ReferCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
