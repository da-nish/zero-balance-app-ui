import 'package:get/get.dart';
import 'package:expense_tracker/screens/chat_topic_list/topiclist_controller.dart';

class TopicListBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TopicListController());
  }
}
