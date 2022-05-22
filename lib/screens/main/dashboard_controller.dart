import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  String username = "User";

  void setName(String? name) {
    if (name == null) return;
    username = name;
    print("username: $name");
  }
}

class CategorySpendModel {
  final CategoryType type;
  final DateTime date;
  final int amount;
  final String marchent;
  final String paidVia;
  final String image;
  final bool paymentStatus;

  CategorySpendModel(this.type, this.date, this.amount, this.marchent,
      this.paidVia, this.image,
      {this.paymentStatus = true});
}

enum CategoryType { Food, Shopping, Entertainment, None }

class CategoryModel {
  String name;
  Color color;
  String icon;
  final CategoryType type;
  int totalSpend;
  double percentage;

  CategoryModel(this.name, this.color, this.icon, this.type, this.totalSpend,
      this.percentage);
}

class OffersModel {
  final String offer;
  final String text;
  final String image;

  OffersModel(this.offer, this.text, this.image);
}
