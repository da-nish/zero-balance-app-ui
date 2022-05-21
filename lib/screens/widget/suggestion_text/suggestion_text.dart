import 'package:flutter/material.dart';
import 'package:getx_setup/api/api.dart';
import 'package:getx_setup/models/model.dart';
import 'package:getx_setup/screens/chat/chat_controller.dart';
import 'package:getx_setup/theme/colors.dart';

class SuggestionText extends StatelessWidget {
  final Restaurant text;
  final ChatController _chatController;
  const SuggestionText(this.text, this._chatController, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: ElevatedButton(
          child: Text(
            text.human!,
            style: TextStyle(color: AppColor.grey),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColor.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: AppColor.backgroundColor)),
            ),
          ),
          onPressed: () {
            _chatController.addMessage(Message(UserType.User, text.human!));
          },
        ));
  }
}
