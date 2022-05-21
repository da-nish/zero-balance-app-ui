import 'package:expense_tracker/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final onTap;
  final navigateCardDetail;

  CustomAppBar({this.navigateCardDetail = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      title: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.white,
              )),
          Text("Add expense"),
        ],
      ),
      // centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
