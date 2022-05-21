import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/api/api.dart';
import 'package:getx_setup/models/model.dart';
import 'package:getx_setup/screens/bottom_sheet/bottom_sheet.dart';
import 'package:getx_setup/screens/chat/chat_controller.dart';
import 'package:getx_setup/screens/chat/widget/message_bubble.dart';
import 'package:getx_setup/screens/widget/suggestion_text/suggestion_text.dart';
import 'package:getx_setup/theme/colors.dart';

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
      backgroundColor: AppColor.backgroundColor,
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
                      color: AppColor.white,
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
                          color: AppColor.blue,
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
