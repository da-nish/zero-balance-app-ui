import 'dart:convert';
import 'package:flutter/services.dart';

Future<RestaurentModel> get restaurent async =>
    RestaurentModel.fromJson(await parseJson("assets/json/restaurent.json"));

Future<dynamic> parseJson(String assetPath) async {
  return rootBundle
      .loadString(assetPath)
      .then((jsonStr) => (jsonDecode(jsonStr)));
}

class RestaurentModel {
  List<Restaurant> restaurant = [];

  RestaurentModel(this.restaurant);

  RestaurentModel.fromJson(Map<String, dynamic> json) {
    if (json['restaurant'] != null) {
      restaurant = <Restaurant>[];
      json['restaurant'].forEach((v) {
        restaurant.add(Restaurant.fromJson(v));
      });
    }
  }
}

class Restaurant {
  String? bot;
  String? human;

  Restaurant(this.bot, this.human);

  Restaurant.fromJson(Map<String, dynamic> json) {
    bot = json['bot'];
    human = json['human'];
  }
}
