import 'package:flutter/material.dart';
import 'package:gemarbaca/app/modules/home/controllers/home_controller.dart';
import 'package:gemarbaca/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LayoutController extends GetxController {
  //TODO: Implement LayoutController
  HomeController homeController = Get.put(HomeController(), permanent: true);

  var index = 0.obs;
  final screen = [
    HomeView(),
    HomeView(),
    HomeView(),
    HomeView(),
  ];
  final items = <Widget>[
    Icon(
      Icons.home_outlined,
      size: 30,
    ),
    Icon(
      Icons.book_outlined,
      size: 30,
    ),
    Icon(
      Icons.bookmark_border_outlined,
      size: 30,
    ),
    Icon(
      Icons.account_circle_outlined,
      size: 30,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onTap(int index) {
    this.index.value = index;
  }
}
