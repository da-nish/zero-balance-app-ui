import 'package:get/get.dart';
import 'package:expense_tracker/api/api.dart';

class SpendCategoryController extends GetxController {
  List<List<Restaurant>> history = [<Restaurant>[]];

  String? dropdownvalue;
  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
}
