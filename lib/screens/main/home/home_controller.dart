import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/api/api.dart';

class HomeController extends GetxController {
  String username = "";
  List<List<Restaurant>> history = [<Restaurant>[]];

  void setName(String name) {
    username = name;
  }

  String? dropdownvalue;
  // List of items in our dropdown menu
  List<CategoryModel> items = [
    CategoryModel("Food", AppColors.activeBlue, AppAssets.food),
    CategoryModel("Shopping", AppColors.activeYellow, AppAssets.shop),
    CategoryModel(
        "Entertainment", AppColors.darkSelected, AppAssets.entertainment),
  ];

  List<OffersModel> offerItems = [
    OffersModel(
        "10% cashback", "Activate offer to reveal", AppAssets.amazonImage),
    OffersModel(
        "10% cashback", "Activate offer to reveal", AppAssets.zomatoImage),
    OffersModel(
        "10% cashback", "Activate offer to reveal", AppAssets.amazonImage)
  ];
}

class CategoryModel {
  final String name;
  final Color color;
  final String icon;

  CategoryModel(this.name, this.color, this.icon);
}

class OffersModel {
  final String offer;
  final String text;
  final String image;

  OffersModel(this.offer, this.text, this.image);
}
