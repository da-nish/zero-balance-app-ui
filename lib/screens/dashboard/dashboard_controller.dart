import 'package:get/get.dart';
import 'package:expense_tracker/api/api.dart';

class DashboardController extends GetxController {
  String username = "";
  List<List<Restaurant>> history = [<Restaurant>[]];

  void setName(String name) {
    username = name;
  }
}
