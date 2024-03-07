import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController extends GetxController {
  late Timer timer;
  final start = 60.obs;
  var isTimerRunning = false.obs;

  var isResendCode = false.obs;

  final loading = false.obs;
  late final SharedPreferences _prefs;
  String? token;
  final String email = Get.parameters['email'] ?? "No Have Email";
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('otp_token');
    print("Token Otp: $token");
    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    super.onClose();
  }

  void startTimer() {
    isTimerRunning.value = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value == 0) {
        timer.cancel();
        isTimerRunning.value = false;
      } else {
        start.value--;
      }
    });
  }

  RxInt get seconds => start;

  void resetTimer() {
    start.value = 60;
    startTimer();
  }

  void resendOtp() async {
    isResendCode.value = true;
    try {
      final response = await ApiProvider.instance()
          .post(EndPoint.resendOtp, data: {'email': email, 'token': token});
      if (response.statusCode == 200) {
        await StorageProvider.write(StorageKey.retoken, response.data['token']);
        print("Token baru: ${response.data['token']}");
        print("Token baru: ${StorageProvider.read(StorageKey.retoken)}");
        showToastSuccess(response.data['message']);
      }
    } catch (e) {
      showToastError("Something went wrong ${e.toString()}");
    }
  }

  verifyOtp(String verifyCode) async {
    print(verifyCode);
    String retoken = StorageProvider.read(StorageKey.retoken);
    print("Token Storage: $retoken");
    loading(true);
    try {
      final response =
          await ApiProvider.instance().post(EndPoint.verifyOtp, data: {
        "otp": verifyCode.toString(),
        "token": isResendCode.value ? retoken.toString() : token.toString(),
      });
      if (response.statusCode == 200) {
        showToastSuccess(response.data['message']);
        Get.offAllNamed(Routes.LOGIN);
      } else {
        showToastError("Verifikasi OTP Gagal!");
      }
          loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          print(e.response!.data['message']);
          showToastError(e.response!.data['message']);
        } else {
          print(e.message ?? "");
          showToastError(e.message ?? "");
        }
      }
    } catch (e) {
      print("Error catch: ${e.toString()}");
      showToastError(e.toString());
    }
  }
}
