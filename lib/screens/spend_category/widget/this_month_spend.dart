import 'package:expense_tracker/models/model.dart';
import 'package:expense_tracker/screens/main/home/widget/category_small_card.dart';
import 'package:expense_tracker/screens/spend_category/spend_category_controller.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/utils/functions.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/spend_category/widget/bar_chart.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_text_style.dart';

class ThisMonthSpend extends StatefulWidget {
  final CategoryModel item;
  final SpendCategoryController controller;
  ThisMonthSpend(this.item, this.controller, {Key? key}) : super(key: key);

  @override
  State<ThisMonthSpend> createState() => _ThisMonthSpendState();
}

class _ThisMonthSpendState extends State<ThisMonthSpend> {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    ChartView selectedView = widget.controller.selectChartView.value;
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
        height: screen.height * 0.5,
        decoration: AppBoxDecoration.container(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Lasts",
                    style: AppTextStyle.h4Regular(color: AppColors.buttonText)),
                button("7 Days", ChartView.Days7 == selectedView,
                    () => widget.controller.updateChart(ChartView.Days7)),
                button("30 Days", ChartView.Days30 == selectedView,
                    () => widget.controller.updateChart(ChartView.Days30)),
                button("90 Days", ChartView.Days90 == selectedView,
                    () => widget.controller.updateChart(ChartView.Days90)),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    CategorySmallCard(widget.item),
                    Text(getTitle(widget.item.type),
                        style: AppTextStyle.h4Regular(
                            color: AppColors.buttonText)),
                  ],
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Spend this month",
                        style: AppTextStyle.h4Regular(
                            color: AppColors.buttonText)),
                    SizedBox(height: 4),
                    Text(
                        "${widget.item.percentage * widget.item.totalSpend}"
                            .toString()
                            .rupee(),
                        style:
                            AppTextStyle.h2Bold(color: AppColors.textPrimary)),
                  ],
                ),
              ],
            ),
            Expanded(child: CustomRoundedBars(widget.controller.chartData)),
          ],
        ));
  }

  Widget button(String text, bool isActive, Function onPressed) {
    return ElevatedButton(
      onPressed: () {
        onPressed.call();
        setState(() {});
      },
      child: Text(text),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 10, vertical: 2)),
          backgroundColor: MaterialStateProperty.all<Color>(
              isActive ? AppColors.textGrey : AppColors.button),
          foregroundColor: MaterialStateProperty.all<Color>(
              isActive ? AppColors.dark : AppColors.buttonText)),
    );
  }
}
