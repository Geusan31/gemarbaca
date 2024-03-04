import 'package:dio/dio.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    checkOnboarding();
    checkLogin();
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

    if(onboarding == 'onboarding') {
      print("Seen to Onboarding: $onboarding");
      await StorageProvider.write(StorageKey.onboarding, 'true');
      Get.offAllNamed(Routes.ONBOARDING);
    } else {
      print("Seen to Login: $onboarding");
      Get.offAllNamed(Routes.LOGIN);
    }
  }

  void checkLogin() async {
    String status = StorageProvider.read(StorageKey.status);
    String token = StorageProvider.read(StorageKey.token);
    print("Status : $status");
    print("Token : $token");

    if(status == 'logged') {
      try {
        final response = await ApiProvider.instance().get(EndPoint.validate, options: Options(headers: {
          'Authorization' : 'Bearer $token'
        }));
        if (response.statusCode == 200) {
          return Get.offAllNamed(Routes.HOME);
        } else {
          return Get.offAllNamed(Routes.LOGIN);
        }
      }catch(e) {
        showToastError(e.toString());
      }
    }
  }
}
