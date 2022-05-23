import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:expense_tracker/utils/functions.dart';
import 'package:get/get.dart';

class PlanningController extends GetxController {
  List<CategorySpendModel> transactionList = [];
  List<CategoryModel> categories = [];
  int totalSpend = 0;
  int totalFood = 0;
  int totalShopping = 0;
  int totalEntertainment = 0;

  init() {
    final data = Get.find<AppData>();
    transactionList = data.recentTransactions();
    totalSpend = data.totalSpend;
    totalFood = data.categorySpend[CategoryType.Food]!;
    totalShopping = data.categorySpend[CategoryType.Shopping]!;
    totalEntertainment = data.categorySpend[CategoryType.Entertainment]!;

    categories = [
      addFood(CategoryType.Food, totalSpend, totalFood),
      addShopping(CategoryType.Shopping, totalSpend, totalShopping),
      addEntertainment(
          CategoryType.Entertainment, totalSpend, totalEntertainment)
    ];
  }

  String getTitle(CategoryType type) {
    switch (type) {
      case CategoryType.Food:
        return "Food";
      case CategoryType.Shopping:
        return "Shopping";
      case CategoryType.Entertainment:
        return "Entertainment";
      default:
        return "";
    }
  }

  int getSpend(CategoryType type) {
    switch (type) {
      case CategoryType.Food:
        return totalFood;
      case CategoryType.Shopping:
        return totalShopping;
      case CategoryType.Entertainment:
        return totalEntertainment;
      default:
        return 0;
    }
  }
}
