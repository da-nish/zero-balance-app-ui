import 'package:expense_tracker/screens/main/dashboard_controller.dart';

class AppData {
  int totalSpend = 0;
  Map<CategoryType, int> categorySpend = {
    CategoryType.Food: 0,
    CategoryType.Shopping: 0,
    CategoryType.Entertainment: 0,
  };
  List<CategorySpendModel> _transactions = [];
  List<CategorySpendModel> allTransactions() => _transactions;

  void addTransaction(CategorySpendModel newTransaction) {
    _transactions.add(newTransaction);
    if (newTransaction.paymentStatus) {
      totalSpend += newTransaction.amount;
      categorySpend[newTransaction.type] =
          (categorySpend[newTransaction.type]! + newTransaction.amount);
    }
    display();
  }

  void display() {
    print("====Statement====");
    for (CategorySpendModel item in _transactions) {
      print("total:: $totalSpend");
      print("::> ${item.date.toString()}");
      print("::> ${item.amount}");
      print("::> ${item.type.toString()}");
      print("::> ${item.paidVia}");
      print("======================");
    }
  }
}
