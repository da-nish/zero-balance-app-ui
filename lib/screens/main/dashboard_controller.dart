import 'package:get/get.dart';

class DashboardController extends GetxController {
  String username = "User";

  void setName(String? name) {
    if (name == null) return;
    username = name;
  }
}
