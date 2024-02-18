import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.screen[controller.index.value],
      bottomNavigationBar: Obx(() {
        return Theme(
          data: Theme.of(context).copyWith(iconTheme: IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            color: Theme.of(context).primaryColor,
            height: 60,
            buttonBackgroundColor: Theme.of(context).primaryColorLight,
            backgroundColor: Colors.transparent,
            index: controller.index.value,
            items: controller.items,
            onTap: (index) => controller.onTap(index),
          ),
        );
      })
    );
  }
}
