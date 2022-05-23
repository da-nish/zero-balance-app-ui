import 'package:expense_tracker/models/model.dart';
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
            radius: 26,
            lineWidth: 1.5,
            percent: item.percentage,
            reverse: true,
            center: CircleAvatar(
              backgroundColor: item.color,
              radius: 20.0,
              child: ClipRRect(
                child: SvgPicture.asset(item.icon, height: 18),
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            backgroundColor: AppColors.grey,
            progressColor: item.color),
      ],
    );
  }
}
