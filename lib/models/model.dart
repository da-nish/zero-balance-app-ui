import 'package:flutter/material.dart';

class Pair<T, F> {
  final T first;
  final F second;

  Pair(this.first, this.second);
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

enum ChartView { Days7, Days30, Days90 }

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
