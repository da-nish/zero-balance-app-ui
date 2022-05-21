import 'package:expense_tracker/screens/add_expense/add_expense_binding.dart';
import 'package:expense_tracker/screens/add_expense/add_expense_screen.dart';
import 'package:expense_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/screens/chat/chat_binding.dart';
import 'package:expense_tracker/screens/chat/chat_screen.dart';
import 'package:expense_tracker/screens/chat_topic_list/topiclist_binding.dart';
import 'package:expense_tracker/screens/chat_topic_list/topiclist_screen.dart';
import 'package:expense_tracker/screens/dashboard/dashboard_binding.dart';
import 'package:expense_tracker/screens/dashboard/dashboard_screen.dart';
import 'package:expense_tracker/screens/name_screen/name_binding.dart';
import 'package:expense_tracker/screens/name_screen/name_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: "/home",
            page: () => DashboardScreen(""),
            binding: DashboardBinding()),
        GetPage(
            name: "/add-expense",
            page: () => AddExpenseScreen(""),
            binding: AddExpenseBinding()),
        GetPage(
            name: "/topic-list",
            page: () => TopicListScreen(),
            binding: TopicListBinding()),
        GetPage(
            name: "/chat", page: () => ChatScreen(), binding: ChatBinding()),
        GetPage(
            name: "/name", page: () => NameScreen(), binding: NameBinding()),
      ],
      initialRoute: "/name",
    );
  }
}
