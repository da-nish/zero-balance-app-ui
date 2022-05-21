import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/theme/app_colors.dart';

class NameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();

    return Scaffold(
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
                    color: AppColors.grey),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                    color: AppColors.white,
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
                        color: AppColors.blue,
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
