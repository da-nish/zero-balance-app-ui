import 'package:expense_tracker/screens/add_expense/add_expense_binding.dart';
import 'package:expense_tracker/screens/add_expense/add_expense_screen.dart';
import 'package:expense_tracker/screens/main/dashboard.dart';
import 'package:expense_tracker/screens/main/dashboard_binding.dart';
import 'package:expense_tracker/screens/main/home/home_binding.dart';
import 'package:expense_tracker/screens/main/home/home_screen.dart';
import 'package:expense_tracker/screens/main/planning/planning_binding.dart';
import 'package:expense_tracker/screens/main/planning/planning_screen.dart';
import 'package:expense_tracker/screens/spend_category/spend_category_binding.dart';
import 'package:expense_tracker/screens/spend_category/spend_category_screen.dart';
import 'package:expense_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            name: "/dashboard",
            page: () => DashboardScreen(),
            binding: DashboardBinding()),
        GetPage(
            name: "/home", page: () => HomeScreen(""), binding: HomeBinding()),
        GetPage(
            name: "/add-expense",
            page: () => AddExpenseScreen(),
            binding: AddExpenseBinding()),
        GetPage(
            name: "/planning",
            page: () => PlanningScreen(),
            binding: PlanningBinding()),
        GetPage(
            name: "/spend-category",
            page: () => SpendCategoryScreen(),
            binding: SpendCategoryBinding()),
        GetPage(
            name: "/name", page: () => NameScreen(), binding: NameBinding()),
      ],
      initialRoute: "/name",
    );
  }
}
