import 'package:expense_tracker/screens/main/dashboard/dashboard_controller.dart';

import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:expense_tracker/screens/main/planning/planning_controller.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AppData(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(PlanningController());
    Get.put(DashboardController(), permanent: true);
  }
}
