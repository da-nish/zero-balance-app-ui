import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/services/api_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(HomeController());
  }
}
