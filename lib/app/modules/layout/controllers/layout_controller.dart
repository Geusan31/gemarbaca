import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/modules/buku/controllers/buku_controller.dart';
import 'package:gemarbaca/app/modules/buku/views/buku_view.dart';
import 'package:gemarbaca/app/modules/home/controllers/home_controller.dart';
import 'package:gemarbaca/app/modules/home/views/home_view.dart';
import 'package:gemarbaca/app/modules/koleksi/controllers/koleksi_controller.dart';
import 'package:gemarbaca/app/modules/koleksi/views/koleksi_view.dart';
import 'package:gemarbaca/app/modules/profile/controllers/profile_controller.dart';
import 'package:gemarbaca/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  //TODO: Implement LayoutController
  HomeController homeController = Get.put(HomeController(), permanent: true);
  BukuController bukuController = Get.put(BukuController(), permanent: true);
  KoleksiController koleksiController = Get.put(KoleksiController(), permanent: true);
  ProfileController profileController = Get.put(ProfileController(), permanent: true);

  var index = 0.obs;
  final screen = [
    HomeView(),
    BukuView(),
    KoleksiView(),
    ProfileView(),
  ];
  final items = [
    const BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(
        Icons.home_outlined,
        size: 30,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Book',
      icon: Icon(
        Icons.book_outlined,
        size: 30,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Bookmark',
      icon: Icon(
        Icons.bookmark_border_outlined,
        size: 30,
      ),
    ),
    const BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(
        Icons.account_circle_outlined,
        size: 30,
      ),
    ),
  ];

  final destination = [
    const NavigationDestination(icon: Icon(CupertinoIcons.home), label: 'Home'),
    const NavigationDestination(
      icon: Icon(CupertinoIcons.book),
      label: 'Buku',
    ),
    const NavigationDestination(
      icon: Icon(CupertinoIcons.bookmark),
      label: 'Favorite',
    ),
    const NavigationDestination(
      icon: Icon(CupertinoIcons.person),
      label: 'Profile',
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
    print('Tapped index: $index');
    print('Current index: ${this.index.value}');
    this.index.value = index;
    print('New index: ${this.index.value}');
  }
}
