import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
