import 'package:get/get.dart';

import 'spend_category_controller.dart';

class SpendCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SpendCategoryController());
  }
}
