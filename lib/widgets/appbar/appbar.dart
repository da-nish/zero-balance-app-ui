import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String title;

  CustomAppBar(this.title, {this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (showBackButton)
              IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.white,
                  )),
            Expanded(
                child: Text(
              title,
              style: AppTextStyle.h2Bold(),
            )),
          ],
        ),
        // centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
