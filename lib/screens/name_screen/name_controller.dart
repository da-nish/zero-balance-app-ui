import 'package:get/get.dart';

class NameController extends GetxController {
  void submit(String name) => Get.offAndToNamed("/dashboard", arguments: name);
}
