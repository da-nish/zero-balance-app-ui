import 'package:get/get.dart';
import 'package:expense_tracker/api/api.dart';
import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/screens/dashboard/dashboard_controller.dart';

class ChatController extends GetxController {
  List<Message> messages = <Message>[].obs;
  String? username;
  List<Restaurant> data = [];
  int chatIndex = 0;

  ChatController() {
    // reset();
    final homeController = Get.find<DashboardController>();
    username = homeController.username;
    setPrefixChat();
    loadApi();
  }

  // reset() {
  //   messages = [];
  //   chatIndex = 0;
  //   update();
  // }

  Future<void> loadApi() async {
    data = (await restaurent).restaurant;
    botMessage();
  }

  void setPrefixChat() {
    messages.add(Message(UserType.Bot, "Hi $username"));
    messages.add(Message(UserType.User, "Hi Arya"));
  }

  void botMessage() {
    messages.add(Message(UserType.Bot, data[chatIndex].bot!));
    update();
  }

  Future<bool> validate(String message) async {
    message = message.trim();
    if (message.toLowerCase() == data[chatIndex].human!.toLowerCase()) {
      chatIndex++;
      await Future.delayed(Duration(seconds: 2), () {
        botMessage();
      });
      return true;
    } else {
      return false;
    }
  }

  Future<void> addMessage(Message message) async {
    messages.add(message);
    update();

    bool isvalid = await validate(message.message);
    if (!isvalid) {
      message.error = true;
      update();
    }
  }

  // saveHistory() {
  //   final _contoller = Get.find<DashboardController>();
  //   _contoller.history.add(data);
  // }
}
