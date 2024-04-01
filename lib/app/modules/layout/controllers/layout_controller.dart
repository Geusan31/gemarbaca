import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/modules/buku/controllers/buku_controller.dart';
import 'package:gemarbaca/app/modules/buku/views/buku_view.dart';
import 'package:gemarbaca/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:gemarbaca/app/modules/dashboard/views/dashboard_view.dart';
import 'package:gemarbaca/app/modules/home/controllers/home_controller.dart';
import 'package:gemarbaca/app/modules/home/views/home_view.dart';
import 'package:gemarbaca/app/modules/koleksi/controllers/koleksi_controller.dart';
import 'package:gemarbaca/app/modules/koleksi/views/koleksi_view.dart';
import 'package:gemarbaca/app/modules/profile/controllers/profile_controller.dart';
import 'package:gemarbaca/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class LayoutController extends GetxController {
  //TODO: Implement LayoutController
  var role = '';
  DashboardController dashboardController =
      Get.put(DashboardController(), permanent: true);
  HomeController homeController = Get.put(HomeController(), permanent: true);
  BukuController bukuController = Get.put(BukuController(), permanent: true);
  KoleksiController koleksiController =
      Get.put(KoleksiController(), permanent: true);
  ProfileController profileController =
      Get.put(ProfileController(), permanent: true);

  var index = 0.obs;
  final screen = const [
    HomeView(),
    BukuView(),
    KoleksiView(),
    ProfileView(),
  ];
  final screenAdmin = const [
    DashboardView(),
    BukuView(),
    DashboardView(),
    DashboardView(),
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
    checkRole();
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

  checkRole() async {
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    role = decodedToken['role'];
    print("Role: ${decodedToken['role']}");
  }
}
