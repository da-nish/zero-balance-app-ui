import 'package:expense_tracker/screens/add_expense/add_expense_binding.dart';
import 'package:expense_tracker/screens/add_expense/add_expense_screen.dart';
import 'package:expense_tracker/screens/main/dashboard/dashboard_binding.dart';
import 'package:expense_tracker/screens/main/dashboard/dashboard_screen.dart';
import 'package:expense_tracker/screens/main/home/home_binding.dart';
import 'package:expense_tracker/screens/main/home/home_screen.dart';
import 'package:expense_tracker/screens/main/planning/planning_binding.dart';
import 'package:expense_tracker/screens/main/planning/planning_screen.dart';
import 'package:expense_tracker/screens/spend_category/spend_category_binding.dart';
import 'package:expense_tracker/screens/spend_category/spend_category_screen.dart';
import 'package:get/get.dart';
import 'package:expense_tracker/screens/name_screen/name_binding.dart';
import 'package:expense_tracker/screens/name_screen/name_screen.dart';

class GetPages {
  static const dashboard = "/dashboard";
  static const home = "/home";
  static const addExpense = "/add-expense";
  static const planning = "/planning";
  static const spendCategory = "/spend-category";
  static const name = "/name";

  static List<GetPage<dynamic>> routes() => [
        GetPage(
            name: dashboard,
            page: () => DashboardScreen(),
            binding: DashboardBinding()),
        GetPage(name: home, page: () => HomeScreen(), binding: HomeBinding()),
        GetPage(
            name: addExpense,
            page: () => AddExpenseScreen(),
            binding: AddExpenseBinding()),
        GetPage(
            name: planning,
            page: () => PlanningScreen(),
            binding: PlanningBinding()),
        GetPage(
            name: spendCategory,
            page: () => SpendCategoryScreen(),
            binding: SpendCategoryBinding()),
        GetPage(name: name, page: () => NameScreen(), binding: NameBinding())
      ];
}
