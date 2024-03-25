import 'dart:developer';

import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController

  final count = 0.obs;
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

  void increment() => count.value++;

  Future<String> nameView() async {
    var name = StorageProvider.read(StorageKey.name);
    log(name);
    return name;
  }

  String welcome() {
    var jam = DateTime.now().hour;
    if (jam >= 1 && jam <= 11) {
      return 'Selamat Pagi';
    } else if (jam > 11 && jam <= 15) {
      return 'Selamat Siang';
    } else if (jam > 15 && jam <= 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }
}
