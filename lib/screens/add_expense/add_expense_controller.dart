import 'package:expense_tracker/screens/main/dashboard_controller.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:get/get.dart';

class AddExpenseController extends GetxController {
  int amount = 0;
  Pair<String, CategoryType>? category;
  DateTime date = DateTime.now();
  String? marchant;
  String? paidVia;

  var paymentList = [
    'GPay',
    'Paytm',
    'PhonePe',
    'other',
  ];

  var marchentList = [
    'Zomato',
    'Netflix',
    'Amazon',
    'Other',
  ];

  List<Pair<String, CategoryType>> categories = [
    Pair('Food', CategoryType.Food),
    Pair('Shopping', CategoryType.Shopping),
    Pair('Entertainment', CategoryType.Entertainment),
  ];

  void submit() {
    CategorySpendModel transaction = CategorySpendModel(
        category!.second, date, amount, marchant!, paidVia!, "");

    final service = Get.find<AppData>();
    service.addTransaction(transaction);
    Get.offAndToNamed("/dashboard");
  }
}

class Pair<T, F> {
  final T first;
  final F second;

  Pair(this.first, this.second);
}
