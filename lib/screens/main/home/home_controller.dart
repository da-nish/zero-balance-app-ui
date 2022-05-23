import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/utils/functions.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CategoryModel> categories = <CategoryModel>[];
  List<OffersModel> offerItems = [];
  var totalSpend = 0.obs;

  init() {
    final controller = Get.find<AppData>();
    totalSpend.value = controller.totalSpend;

    categories.clear();
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
    // controller.display();
    // for (CategoryModel e in categories) {
    //   print("${e.type.toString()} ==> ${e.percentage}");
    // }
    refresh();
  }
}
