import 'package:flutter/material.dart';
import 'package:gemarbaca/app/modules/layout/controllers/layout_controller.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  final ThemeData myTheme = ThemeData(
    primaryColor: Color(0xff19D670),
    primaryColorLight: Color(0xff57FAA2),
    hintColor: Color(0xff929292),
  );
  runApp(
    GetMaterialApp(
      title: "Gemar Baca",
      initialBinding: BindingsBuilder(() {
        Get.put(LayoutController());
      }),
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      theme: myTheme
    ),
  );
}
