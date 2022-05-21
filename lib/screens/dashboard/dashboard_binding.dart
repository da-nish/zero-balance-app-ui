import 'package:get/get.dart';
import 'package:getx_setup/services/api_service.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(DashboardController());
  }
}
