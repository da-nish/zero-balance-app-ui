import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/theme/app_colors.dart';

class History extends StatelessWidget {
  final int index;
  History(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: const Icon(
              Icons.message,
              size: 50,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 14),
              InkWell(
                  onTap: () => Get.toNamed("/chat"),
                  child: Text(
                    "History $index",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
