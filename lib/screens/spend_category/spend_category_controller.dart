import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/screens/spend_category/widget/bar_chart.dart';
import 'package:expense_tracker/service/app_data.dart';
import 'package:expense_tracker/utils/datetime_extension.dart';
import 'package:get/get.dart';

class SpendCategoryController extends GetxController {
  List<CategorySpendModel> transactionList = [];
  List<Spends> chartData = <Spends>[].obs;

  int totalSpend = 0;
  double percent = 0;
  Rx<ChartView> selectChartView = ChartView.Days7.obs;

  init(CategoryType type) {
    final data = Get.find<AppData>();
    transactionList = data.getCategory(type);
    totalSpend = data.totalSpend;
    percent = findPercentage(totalSpend, data.categorySpend[type]!);

    DateTime now = new DateTime.now();
    int days = 7;
    DateTime from = now.subtract(Duration(days: days));
    for (CategorySpendModel item in transactionList) {
      print("from:: ${from.toString()} item:: ${item.date.toString()}");
      if (from.isBefore(item.date)) {
        print(item.date.toString());
        chartData.add(Spends(item.date.dateFormat().toString(), item.amount));
      }
    }
    refresh();
  }

  updateChart(ChartView view) {
    if (view == selectChartView.value) return;
    selectChartView.value = view;

    DateTime now = new DateTime.now();
    int days = 7;
    if (view == ChartView.Days30) days = 30;
    if (view == ChartView.Days90) days = 90;

    DateTime from = now.subtract(Duration(days: days));
    chartData.clear();
    for (CategorySpendModel item in transactionList) {
      print("from:: ${from.toString()} item:: ${item.date.toString()}");
      if (from.isBefore(item.date)) {
        print(item.date.toString());
        chartData.add(Spends(item.date.dateFormat().toString(), item.amount));
      }
    }

    refresh();
  }

  double findPercentage(int total, int categoryTotal) {
    if (total == 0) return 0;
    return (categoryTotal / total);
  }
}
