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

  static void initialize() {
    if (read(StorageKey.onboarding) == "") {
      write(StorageKey.onboarding, "onboarding");
    }

    if (read(StorageKey.status) == "") {
      write(StorageKey.status, "status");
    }

    if (read(StorageKey.token) == "") {
      write(StorageKey.token, "token");
    }

    if (read(StorageKey.name) == "") {
      write(StorageKey.name, "name");
    }
  }
}

class StorageKey {
  static const String status = "status";
  static const String token = "token";
  static const String name = "name";
  static const String onboarding = 'onboarding';
}
