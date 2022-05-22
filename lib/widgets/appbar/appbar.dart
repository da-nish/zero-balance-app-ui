import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final onTap;
  final bool showBackButton;
  final String title;

  CustomAppBar(this.title, {this.onTap, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      excludeHeaderSemantics: false,
      // elevation: 0,
      title: Row(
        children: [
          if (showBackButton)
            IconButton(
                onPressed: () => onTap.call(),
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                )),
          Text(title),
        ],
      ),
      // centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
