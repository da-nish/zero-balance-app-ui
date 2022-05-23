import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:get/get.dart';

class SpendCategoryController extends GetxController {
  List<CategorySpendModel> transactionList = [];
  int totalSpend = 0;
  double percent = 0;
  init(CategoryType type) {
    final data = Get.find<AppData>();
    transactionList = data.getCategory(type);
    totalSpend = data.totalSpend;
    percent = findPercentage(totalSpend, data.categorySpend[type]!);
  }

  double findPercentage(int total, int categoryTotal) {
    if (total == 0) return 0;
    return (categoryTotal / total);
  }
}
