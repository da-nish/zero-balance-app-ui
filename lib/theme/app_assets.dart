import 'package:flutter/material.dart';

class LottieJson {
  static const String reload = 'assets/animation/reload.json';
}

mixin AppAssets {
  //PNG
  static const String basePNGPath = "assets/images/png/";
  static const String amazonImage = basePNGPath + 'amazon.png';
  static const String zomatoImage = basePNGPath + 'zomato.png';
  static const String logoImage = basePNGPath + 'logo.png';
  static const String messageBannerImage = basePNGPath + 'message_banner.png';
  static const String shareArrowImage = basePNGPath + 'share_arrow.png';

  //SVG
  static const String baseSVGPath = "assets/images/svg/";
  static const String bell = baseSVGPath + 'bell.svg';
  static const String entertainment = baseSVGPath + 'entertainment.svg';
  static const String food = baseSVGPath + 'food.svg';
  static const String plus = baseSVGPath + 'plus.svg';
  static const String shop = baseSVGPath + 'shop.svg';
  static const String user = baseSVGPath + 'user.svg';

  //bottom navigation
  static const String baseNavigationPath = "assets/images/bottom_navigation/";
  static const String nagivationTab1 = baseNavigationPath + 'home.svg';
  static const String nagivationTab2 = baseNavigationPath + 'card.svg';
  static const String nagivationTab3 = baseNavigationPath + 'bars.svg';
  static const String nagivationTab4 = baseNavigationPath + 'reward.svg';
}

class AppIcon {
  static const Icon rupee = Icon(IconData(0x20B9, fontFamily: 'MaterialIcons'));
}
