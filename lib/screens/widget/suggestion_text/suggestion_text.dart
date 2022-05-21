import 'package:flutter/material.dart';
import 'package:expense_tracker/api/api.dart';
import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/screens/chat/chat_controller.dart';
import 'package:expense_tracker/theme/app_colors.dart';

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
            style: TextStyle(color: AppColors.grey),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(AppColors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: AppColors.backgroundColor)),
            ),
          ),
          onPressed: () {
            _chatController.addMessage(Message(UserType.User, text.human!));
          },
        ));
  }
}
