import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel item;
  final double size;
  const CategoryCard(this.item, {this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size + 20,
        margin: const EdgeInsets.only(right: 20),
        child: Column(
          children: [
            CircularPercentIndicator(
                radius: 42,
                lineWidth: 1.5,
                percent: 0.5,
                center: CircleAvatar(
                  backgroundColor: item.color,
                  radius: 35.0,
                  child: ClipRRect(
                    child: SvgPicture.asset(item.icon),
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
                backgroundColor: item.color,
                progressColor: AppColors.dark),
            SizedBox(height: Dimens.grid10),
            Text(
              item.name,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
