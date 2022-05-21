import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_setup/screens/dashboard/dashboard_controller.dart';
import 'package:getx_setup/screens/dashboard/widget/history_card.dart';
import 'package:getx_setup/theme/colors.dart';

class DashboardScreen extends StatelessWidget {
  final String name;
  DashboardScreen(this.name);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<DashboardController>();
    homeController.setName(Get.arguments);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        width: double.infinity,
        child: ListView.builder(
            itemCount: homeController.history.length,
            itemBuilder: ((context, index) => History(index + 1))),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed("/topic-list");
        },
        icon: Icon(Icons.messenger_outline),
        label: Text("Start new conversation"),
      ),
    );
  }
}
