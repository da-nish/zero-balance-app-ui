import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:get/get.dart';

class AddExpenseController extends GetxController {
  int amount = 0;
  Pair<String, CategoryType>? category;
  DateTime date = DateTime.now();
  Pair<String, String>? marchant;
  String? paidVia;

  var paymentList = [
    'GPay',
    'Paytm',
    'PhonePe',
    'other',
  ];

  List<Pair<String, String>> marchentList = [
    Pair('Zomato', AppAssets.zomatoColored),
    Pair('Netflix', AppAssets.netflix),
    Pair('Amazon', AppAssets.amazon),
    Pair('Swiggy', AppAssets.swiggy),
    Pair('McDonal', AppAssets.mcDonalColored),
  ];

  List<Pair<String, CategoryType>> categories = [
    Pair('Food', CategoryType.Food),
    Pair('Shopping', CategoryType.Shopping),
    Pair('Entertainment', CategoryType.Entertainment),
  ];

  void submit() {
    if (category?.second == null || marchant == null || paidVia == null) {
      return;
    }
    CategorySpendModel transaction = CategorySpendModel(category!.second, date,
        amount, marchant!.first, paidVia!, marchant!.second);

    final service = Get.find<AppData>();
    service.addTransaction(transaction);
    Get.offAndToNamed("/dashboard");
  }
}
