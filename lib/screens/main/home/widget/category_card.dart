import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel item;
  const CategoryCard(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 100,
              padding: const EdgeInsets.all(15.0),
              child: CircularPercentIndicator(
                  radius: 44.0,
                  lineWidth: 1.5,
                  percent: 0.5,
                  center: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: item.color,
                        borderRadius: BorderRadius.circular(50)),
                    alignment: Alignment.center,
                    child: SvgPicture.asset(item.icon),
                  ),
                  backgroundColor: item.color,
                  progressColor: AppColors.dark)),
          SizedBox(height: Dimens.grid20),
          Text(
            item.name,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
