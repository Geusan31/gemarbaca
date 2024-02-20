import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OtpController extends GetxController {
  final loading = false.obs;
  late final SharedPreferences _prefs;
  String? email;
  String? token;
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final TextEditingController controller4 = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    _prefs = await SharedPreferences.getInstance();
    token =  await _prefs.getString('otp_token');
    getEmailToken();
  }

  getEmailToken() async {
    if (token != null) {
      Map<String, dynamic> tokenData = JwtDecoder.decode(token!);
      email = tokenData['email'];
      print(email);
      return email;
    }
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

  verifyOtp(String verifyCode) async {
    print(verifyCode);
    loading(true);
    try {
      if (token != null) {
        final response =
        await ApiProvider.instance().post(EndPoint.verifyOtp, data: {
          "otp": verifyCode.toString(),
          "token": token.toString(),
        });
        if (response.statusCode == 200) {
          showToastSuccess(response.data['message']);
          Get.offAllNamed(Routes.LOGIN);
        } else {
          showToastError("Verifikasi OTP Gagal!");
        }
      } else {
        showToastError("Token tidak ditemukan!");
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
      print("Error catch: KOCAKK | ${e.toString()}");
      showToastError(e.toString());
    }
  }
}
