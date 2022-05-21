import 'package:flutter/material.dart';
import 'package:getx_setup/models/model.dart';

class MessageBubble extends StatelessWidget {
  final Message message;
  final bool isMyMessage;

  const MessageBubble(this.message, this.isMyMessage);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment:
          isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: message.error
                    ? Color.fromARGB(255, 251, 124, 124)
                    : isMyMessage
                        ? Colors.blue[50]
                        : Colors.blue[100],
                borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: const Radius.circular(12),
                    bottomRight: Radius.circular(isMyMessage ? 0 : 12))),
            constraints: const BoxConstraints(maxWidth: 240),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Text(
              message.message,
              textAlign: isMyMessage ? TextAlign.end : TextAlign.start,
            ))
      ],
    );
  }
}
