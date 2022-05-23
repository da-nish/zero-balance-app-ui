import 'package:expense_tracker/screens/main/dashboard_controller.dart';
import 'package:expense_tracker/screens/main/home/widget/category_card.dart';
import 'package:expense_tracker/screens/main/home/widget/category_small_card.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/screens/spend_category/widget/bar_chart.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_text_style.dart';

class ThisMonthSpend extends StatelessWidget {
  final CategoryModel item;
  const ThisMonthSpend(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
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
                button("7 Days"),
                button("30 Days"),
                button("90 Days"),
              ],
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategorySmallCard(item),
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
                        "${item.percentage * item.totalSpend}"
                            .toString()
                            .rupee(),
                        style:
                            AppTextStyle.h2Bold(color: AppColors.textPrimary)),
                  ],
                ),
              ],
            ),
            Expanded(child: CustomRoundedBars([])),
          ],
        ));
  }

  Widget button(String t) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(t),
      style: ButtonStyle(
          padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 10, vertical: 2)),
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.button),
          foregroundColor:
              MaterialStateProperty.all<Color>(AppColors.buttonText)),
    );
  }
}
