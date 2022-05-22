import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';

class ReferCard extends StatelessWidget {
  const ReferCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      width: screen.width * 0.8,
      height: 170,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: AppColors.containerPink,
          borderRadius: BorderRadius.circular(15)),
      child: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Positioned(
              right: 0,
              child: Image.asset(
                AppAssets.messageBannerImage,
                height: 100,
              )),
          SizedBox(height: Dimens.grid20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: "Help your \nfriends",
                  style: AppTextStyle.h3Regular(color: AppColors.dark),
                  children: <TextSpan>[
                    TextSpan(
                        text: " balance",
                        style: AppTextStyle.h3Bold(color: AppColors.dark)),
                    TextSpan(
                        text: "\ntheir finances",
                        style: AppTextStyle.h3Regular(color: AppColors.dark)),
                  ],
                ),
              ),
              SizedBox(height: Dimens.grid20),
              Container(
                width: 80,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Refer"),
                      Image.asset(AppAssets.shareArrowImage, height: 8)
                    ],
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          AppColors.referButton),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(AppColors.dark)),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
