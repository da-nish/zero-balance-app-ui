import 'package:expense_tracker/screens/main/home/home_controller.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CategorySmallCard extends StatelessWidget {
  final CategoryModel item;
  final double size;
  const CategorySmallCard(this.item, {this.size = 60});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircularPercentIndicator(
            reverse: true,
            radius: 26,
            lineWidth: 1.5,
            percent: 0.5,
            center: CircleAvatar(
              backgroundColor: item.color,
              radius: 20.0,
              child: ClipRRect(
                child: SvgPicture.asset(item.icon, height: 18),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            backgroundColor: item.color,
            progressColor: AppColors.dark),
      ],
    );
  }
}
