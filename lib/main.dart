import 'package:calzada/app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
// ffffff
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.CARTPAGE,
      getPages: AppPages.routes,
    ),
  );
}
