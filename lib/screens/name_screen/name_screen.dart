import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/theme/colors.dart';

class NameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: AppBar(
          title: Text("User Name"),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              Text(
                "Please type your name",
                style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColor.grey),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                  children: [
                    SizedBox(width: 6),
                    Icon(Icons.account_circle_rounded),
                    SizedBox(width: 6),
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Name...',
                        ),
                      ),
                    ),
                    IconButton(
                        color: AppColor.blue,
                        onPressed: () {
                          Get.offAndToNamed("/home",
                              arguments: textController.text);
                        },
                        icon: Icon(Icons.arrow_forward))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
