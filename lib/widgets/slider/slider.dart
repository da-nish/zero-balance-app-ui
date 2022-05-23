import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:expense_tracker/utils/string_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatefulWidget {
  final int totalSpend;

  SliderCard(this.totalSpend, {Key? key}) : super(key: key);

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  @override
  Widget build(BuildContext context) {
    double percentage = (widget.totalSpend / 50000);
    percentage = percentage > 1 ? 1 : percentage;
    percentage = percentage < 0.1 ? 0.04 : percentage;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      margin: const EdgeInsets.symmetric(vertical: 18),
      width: double.infinity,
      height: Dimens.grid120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.containerColorWhite),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Total spent this month",
            style: AppTextStyle.h3Bold(color: AppColors.dark),
          ),
          SizedBox(height: 20),
          Stack(
            children: [
              Container(
                height: 12,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                        0.1,
                        0.4,
                        0.6,
                      ],
                      colors: [
                        Color.fromARGB(255, 255, 192, 115),
                        Color.fromARGB(255, 197, 190, 134),
                        Color.fromARGB(255, 20, 216, 197),
                      ],
                    )),
              ),
              FractionallySizedBox(
                widthFactor: percentage,
                alignment: Alignment.centerRight,
                // heightFactor: 0.2,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: Dimens.grid16,
                        height: Dimens.grid16,
                        transform: Matrix4.translationValues(0.0, -2.0, 0.0),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 0.8, color: AppColors.dark),
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(12)),
                      )
                    ],
                  ),
                ),
              ),
              FractionallySizedBox(
                  widthFactor:
                      percentage < 0.2 ? (percentage + 0.1) : percentage,
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    width: 180,
                    alignment: widget.totalSpend < 4000
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Text(
                      widget.totalSpend.toString().rupee(),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      style: AppTextStyle.h4Regular(color: AppColors.dark),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
