import 'package:get/get.dart';
import 'package:expense_tracker/screens/chat/chat_controller.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatController());
  }
}
