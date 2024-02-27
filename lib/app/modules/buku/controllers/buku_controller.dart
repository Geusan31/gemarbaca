import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BukuController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement BukuController
  TabController? tabController;
  TabController? subTabController;
  final List<String> kategori = ['Kategori 1', 'Kategori 2', 'Kategori 3'];
  final List<String> genre = ['Genre 1', 'Genre 2', 'Genre 3'];

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    subTabController = TabController(length: 3, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController?.dispose();
    subTabController?.dispose();
    super.onClose();
  }

  void increment() => count.value++;
}
