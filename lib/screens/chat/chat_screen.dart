import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/api/api.dart';
import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/screens/bottom_sheet/bottom_sheet.dart';
import 'package:expense_tracker/screens/chat/chat_controller.dart';
import 'package:expense_tracker/screens/chat/widget/message_bubble.dart';
import 'package:expense_tracker/screens/widget/suggestion_text/suggestion_text.dart';
import 'package:expense_tracker/theme/app_colors.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController textController = TextEditingController();
  final _contoller = Get.find<ChatController>();

  List<Restaurant>? data = [];

  bool hasText() {
    return textController.text.isNotEmpty;
  }

  Future<void> loadApi() async {
    data = (await restaurent).restaurant;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Obx(() => Expanded(
              child: ListView(
                  children: _contoller.messages
                      .map((e) => MessageBubble(e, e.user == UserType.User))
                      .toList()))),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 44,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: data
                            ?.map((e) => SuggestionText(e, _contoller))
                            .toList() ??
                        []),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: Row(
                    children: [
                      SizedBox(width: 6),
                      Icon(Icons.edit),
                      SizedBox(width: 6),
                      Expanded(
                        child: TextField(
                          controller: textController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write here ... ',
                          ),
                          onChanged: (String value) {
                            setState(() {});
                          },
                        ),
                      ),
                      IconButton(
                          color: AppColors.blue,
                          onPressed: () {
                            if (hasText()) {
                              _contoller.addMessage(
                                  Message(UserType.User, textController.text));
                              textController.text = "";
                              setState(() {});
                              return;
                            }
                            showModalBottomSheet(
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                context: context,
                                enableDrag: false,
                                builder: (context) =>
                                    CustomBottomSheet(_contoller));
                          },
                          icon: hasText() ? Icon(Icons.send) : Icon(Icons.mic))
                    ],
                  )),
            ],
          ),
        ],
      )),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
