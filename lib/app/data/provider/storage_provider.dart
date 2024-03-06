import 'dart:developer';

import 'package:get_storage/get_storage.dart';

class StorageProvider {
  static write(key, String value) async {
    await GetStorage().write(key, value);
  }

  static String read(key) {
    try {
      return GetStorage().read(key);
    } catch (e) {
      log("Error Get Storage: ${e.toString()}");
      return "";
    }
  }

  static void clearAll() {
    GetStorage().erase();
  }
}

class StorageKey {
  static const String status = "status";
  static const String token = "token";
  static const String name = "name";
  static const String onboarding = 'onboarding';
}
