import 'package:expense_tracker/screens/main/dashboard_controller.dart';
import 'package:expense_tracker/screens/main/home/home_screen.dart';
import 'package:expense_tracker/screens/main/planning/planning_screen.dart';
import 'package:expense_tracker/screens/spend_category/spend_category_screen.dart';
import 'package:expense_tracker/theme/app_assets.dart';
import 'package:expense_tracker/theme/app_colors.dart';
import 'package:expense_tracker/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    controller.setName(Get.arguments);
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: [
          _wrapPage(HomeScreen("")),
          _wrapPage(PlanningScreen()),
          _wrapPage(SpendCategoryScreen()),
          _wrapPage(Container()),
        ],
        items: [
          _item(AppAssets.nagivationTab1),
          _item(AppAssets.nagivationTab2),
          _item(AppAssets.nagivationTab3),
          _item(AppAssets.nagivationTab4),
        ],
        confineInSafeArea: true,
        backgroundColor: AppColors.darkGrey,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.grid16),
              topRight: Radius.circular(Dimens.grid16)),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Dimens.durationS,
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Dimens.durationXS,
        ),
        navBarStyle: NavBarStyle.style2,
        bottomScreenMargin: 0,
        padding: NavBarPadding.all(5),
      ),
    );
  }

  PersistentBottomNavBarItem _item(String asset) => PersistentBottomNavBarItem(
      activeColorPrimary: AppColors.activeBlue,
      inactiveColorPrimary: AppColors.textPrimary,
      icon: SvgPicture.asset(asset, color: AppColors.activeBlue),
      inactiveIcon: SvgPicture.asset(asset, color: AppColors.textPrimary));

  Widget _wrapPage(Widget child) => child;
}
