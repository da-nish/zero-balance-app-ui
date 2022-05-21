import 'package:expense_tracker/screens/main/planning/planning_controller.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/services/api_service.dart';

class PlanningBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(PlanningController());
  }
}
