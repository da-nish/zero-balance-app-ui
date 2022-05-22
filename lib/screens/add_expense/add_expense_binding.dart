import 'package:get/get.dart';

import 'add_expense_controller.dart';

class AddExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AddExpenseController());
  }
}
