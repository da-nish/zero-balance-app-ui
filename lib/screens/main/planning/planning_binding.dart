import 'package:expense_tracker/screens/main/planning/planning_controller.dart';
import 'package:get/get.dart';

class PlanningBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PlanningController());
  }
}
