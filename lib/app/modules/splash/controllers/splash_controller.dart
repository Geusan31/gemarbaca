import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    log("onInit Splash");
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

  void checkOnboarding() async {
    String onboarding = StorageProvider.read(StorageKey.onboarding);

    if (onboarding == 'onboarding') {
      log("Seen to Onboarding: $onboarding");
      await StorageProvider.write(StorageKey.onboarding, "true");
      log("Sudah Onboarding: $onboarding");
      return Get.offAllNamed(Routes.ONBOARDING);
    } else if (onboarding == 'true') {
      log("Already seen Onboarding: $onboarding");
      return Get.offAllNamed(Routes.LOGIN);
    } else {
      log("Seen to Login: $onboarding");
      return Get.offAllNamed(Routes.LOGIN);
    }
  }

  void checkLogin() async {
    String status = StorageProvider.read(StorageKey.status);
    String token = StorageProvider.read(StorageKey.token);
    log("Status : $status");
    log("Token : $token");

    if (status == 'logged') {
      try {
        final response = await ApiProvider.instance().get(EndPoint.validate,
            options: Options(headers: {'Authorization': 'Bearer $token'}));
        if (response.statusCode == 200) {
          return Get.offAllNamed(Routes.HOME);
        } else {
          return Get.offAllNamed(Routes.LOGIN);
        }
      } catch (e) {
        log(e.toString());
      }
    }
  }
}
