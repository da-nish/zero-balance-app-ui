import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_decoration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MerchantCard extends StatelessWidget {
  final String image;
  final bool colorCard;
  const MerchantCard(this.image, {this.colorCard = false, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = colorCard ? AppColors.blue : AppColors.white;
    return Container(
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(10),
      decoration: colorCard
          ? AppBoxDecoration.coloredImageCard()
          : AppBoxDecoration.imageCard(),
      child: SvgPicture.asset(
        image,
        color: color,
      ),
    );
  }
}
