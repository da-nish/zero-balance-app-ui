import 'package:expense_tracker/routes/get_pages.dart';
import 'package:expense_tracker/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Zero Balance",
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      getPages: GetPages.routes(),
      initialRoute: GetPages.name,
    );
  }
}
