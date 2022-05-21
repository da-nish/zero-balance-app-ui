import 'package:get/get.dart';
import 'package:expense_tracker/services/api_service.dart';

import 'add_expense_controller.dart';

class AddExpenseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(AddExpenseController());
  }
}
