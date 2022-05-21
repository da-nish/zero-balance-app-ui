import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/theme/colors.dart';

class TopicListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final apiService = Get.find<ApiService>();

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Topic List"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                color: AppColor.white, borderRadius: BorderRadius.circular(10)),
            height: 100,
            child: Row(
              children: [
                Image.network(
                  "https://cdn-icons-png.flaticon.com/512/3349/3349384.png",
                  // color: AppColor.activeBlue,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 14),
                    InkWell(
                        onTap: () => Get.toNamed("/chat"),
                        child: Text(
                          "Restaurent",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.grey),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
