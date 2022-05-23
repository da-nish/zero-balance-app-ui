import 'package:expense_tracker/screens/main/dashboard_controller.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';

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

double findPercentage(int total, int categoryTotal) {
  if (total == 0) return 0;
  return (categoryTotal / total);
}

CategoryModel addFood(CategoryType type, int total, int categoryTotal) {
  return CategoryModel("Food", AppColors.foodColor, AppAssets.food, type, total,
      findPercentage(total, categoryTotal));
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
