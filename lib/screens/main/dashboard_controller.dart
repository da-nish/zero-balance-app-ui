import 'package:get/get.dart';

class DashboardController extends GetxController {
  String username = "User";

  void setName(String name) {
    username = name;
    print("username: $name");
  }
}
