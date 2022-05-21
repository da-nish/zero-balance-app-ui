import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_circular_slider/multi_circular_slider.dart';

class CircularChart extends StatelessWidget {
  const CircularChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: MultiCircularSlider(
          size: MediaQuery.of(context).size.width * .7,
          values: [0.2, 0.2, 0.3, 2],
          colors: [
            Color(0xFFFD1960),
            Color(0xFF29D3E8),
            Color(0xFF18C737),
            Color(0xFFFFCC05)
          ],
          showTotalPercentage: false, // to display total percentage in center
          label: 'This is label text', // label to display below percentage
          animationDuration:
              const Duration(milliseconds: 500), // duration of animation
          animationCurve: Curves.easeIn, // smoothness of animation
          innerIcon: Icon(Icons
              .integration_instructions), // to display some icon related to text
          innerWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AppAssets.nagivationTab2),
              SizedBox(height: 10),
              Text('This month spends', textAlign: TextAlign.center),
              SizedBox(height: 10),
              Text('\u{20B9} 10000',
                  style: AppTextStyle.h1Bold(color: AppColors.white),
                  textAlign: TextAlign.center),
            ],
          ), // to show custom innerWidget (to display set showTotalPercentage to false)
          trackColor: Colors.white, // to change color of track
          progressBarWidth: 3.0, // to change width of progressBar
          trackWidth: 10.0, // to change width of track
          labelTextStyle: TextStyle(), // to change TextStyle of label
          percentageTextStyle: TextStyle(), // to change TextStyle of percentage
        )),
      ],
    );
  }
}
