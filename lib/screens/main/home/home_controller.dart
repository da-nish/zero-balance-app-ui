import 'package:expense_tracker/screens/main/dashboard_controller.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CategoryModel> categories = <CategoryModel>[];
  List<OffersModel> offerItems = [];
  List<CategorySpendModel> transactions = [];
  int totalSpend = 0;

  HomeController() {
    print("workinsdf");
    final controller = Get.find<AppData>();
    transactions = controller.allTransactions();
    totalSpend = controller.totalSpend;

    categories.add(addFood(CategoryType.Food, controller.totalSpend,
        controller.categorySpend[CategoryType.Food]!));
    categories.add(addShopping(CategoryType.Shopping, controller.totalSpend,
        controller.categorySpend[CategoryType.Shopping]!));
    categories.add(addEntertainment(
        CategoryType.Entertainment,
        controller.totalSpend,
        controller.categorySpend[CategoryType.Entertainment]!));

    offerItems = [
      OffersModel(
          "10% cashback", "Activate offer to reveal", AppAssets.amazonImage),
      OffersModel(
          "10% cashback", "Activate offer to reveal", AppAssets.zomatoImage),
      OffersModel(
          "10% cashback", "Activate offer to reveal", AppAssets.amazonImage)
    ];
    controller.display();
    update();
  }

  double findPercentage(int total, int categoryTotal) {
    if (total == 0) return 0;
    print(":: ${(categoryTotal / total)}");
    return (categoryTotal / total);
  }

  CategoryModel addFood(CategoryType type, int total, int categoryTotal) {
    return CategoryModel("Food", AppColors.foodColor, AppAssets.food, type,
        total, findPercentage(total, categoryTotal));
  }

  CategoryModel addShopping(CategoryType type, int total, int categoryTotal) {
    return CategoryModel("Shopping", AppColors.shoppingColor, AppAssets.shop,
        type, total, findPercentage(total, categoryTotal));
  }

  CategoryModel addEntertainment(
      CategoryType type, int total, int categoryTotal) {
    return CategoryModel(
        "Entertainment",
        AppColors.entertainment,
        AppAssets.entertainment,
        type,
        total,
        findPercentage(total, categoryTotal));
  }
}
