import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/api/api.dart';
import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/screens/chat/chat_controller.dart';
import 'package:expense_tracker/screens/widget/suggestion_text/suggestion_text.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:lottie/lottie.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class CustomBottomSheet extends StatefulWidget {
  final ChatController _chatController;
  CustomBottomSheet(this._chatController, {Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  bool isListening = false;
  stt.SpeechToText speech = stt.SpeechToText();
  String? _textString;
  double confidence = 1.0;
  List<Restaurant>? data;

  @override
  void initState() {
    super.initState();
    listen();
    loadApi();
  }

  String getText() => _textString ?? "";
  void setText(String? s) {
    _textString = s;
  }

  void listen() async {
    setText(null);
    if (!isListening) {
      bool avail = await speech.initialize();
      if (avail) {
        setState(() {
          isListening = true;
        });
        speech.listen(onResult: (value) {
          setState(() {
            setText(value.recognizedWords);
            if (value.hasConfidenceRating && value.confidence > 0) {
              confidence = value.confidence;
            }
          });
        });
      }
    } else {
      setState(() {
        isListening = false;
      });
      speech.stop();
    }
  }

  bool get hasText => getText().isNotEmpty;
  Future<void> loadApi() async {
    data = (await restaurent).restaurant;
  }

  @override
  Widget build(BuildContext context) {
    restaurent;
    return Container(
      height: MediaQuery.of(context).size.height * 0.40 - (!hasText ? 40 : 0),
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: ListView(
        children: <Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(isListening ? "Listening..." : "Try again...",
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.blue,
                )),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            InkWell(
              onTap: () {
                listen();
              },
              child: Lottie.asset(LottieJson.reload,
                  repeat: isListening,
                  width: 100,
                  height: 100,
                  alignment: Alignment.center),
            )
          ]),
          const SizedBox(height: 8),
          if (hasText)
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                  onPressed: () {
                    widget._chatController
                        .addMessage(Message(UserType.User, getText()));
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  label: const Text("Send")),
            ),
          const SizedBox(height: 8),
          Text((!isListening && getText().isEmpty) ? "" : getText() + "...",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          if (!isListening)
            Container(
              height: 44,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: data
                          ?.map(
                              (e) => SuggestionText(e, widget._chatController))
                          .toList() ??
                      []),
            )
        ],
      ),
    );
  }

  @override
  void dispose() {
    speech.cancel();
    super.dispose();
  }
}
