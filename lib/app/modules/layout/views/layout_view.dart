import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/layout_controller.dart';

class LayoutView extends GetView<LayoutController> {
  const LayoutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => controller.screen[controller.index.value]),
        bottomNavigationBar: Obx(() {
          return Theme(
            data: Theme.of(context)
                .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 1,
                    spreadRadius: 0,
                    offset: const Offset(0, -2))
              ]),
              child: NavigationBar(
                height: 80,
                elevation: 0,
                selectedIndex: controller.index.value,
                onDestinationSelected: (index) => controller.onTap(index),
                destinations:controller.destination
              )
              // child: BottomNavigationBar(
              //   selectedItemColor: Theme.of(context).primaryColor,
              //   unselectedItemColor: Colors.grey.withOpacity(0.5),
              //   showSelectedLabels: false,
              //   showUnselectedLabels: false,
              //   elevation: 0,
              //   currentIndex: controller.index.value,
              //   backgroundColor: Colors.transparent,
              //   items: controller.items,
              //   onTap: (index) => controller.onTap(index),
              // ),
            ),
          );
        }));
  }
}
