import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_login.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:gemarbaca/app/widget/toast/toast.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  var isObscure = true.obs;
  var emailIsFocused = false.obs;
  var passwordIsFocused = false.obs;
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    emailFocusNode.addListener(() {
      emailIsFocused.value = emailFocusNode.hasFocus;
    });
    passwordFocusNode.addListener(() {
      passwordIsFocused.value = passwordFocusNode.hasFocus;
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleObscure() {
    isObscure.value = !isObscure.value;
    update();
    print(isObscure.value);
  }

  login() async {
    loading(false);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        final response =
            await ApiProvider.instance().post(EndPoint.login, data: {
          "email": emailController.text.toString(),
          "password": passwordController.text.toString(),
        });
        if (response.statusCode == 200) {
          if (response.data != null) {
            ResponseLogin responseLogin = ResponseLogin.fromJson(response.data);
            print(responseLogin.data!.namaLengkap);
            if (responseLogin.data != null &&
                responseLogin.data!.namaLengkap != null) {
              await StorageProvider.write(
                  StorageKey.name, responseLogin.data!.namaLengkap!);
              log("Name Now: ${StorageProvider.read(StorageKey.name)}");
            }
            String? token = response.data['token'];
            print(token);
            if (token != null) {
              await StorageProvider.write(StorageKey.token, token);
              log("Token Now: ${StorageProvider.read(StorageKey.token)}");
              await StorageProvider.write(StorageKey.status, 'logged');
              showToastSuccess(response.data['message']);
              Get.offAllNamed(Routes.LAYOUT);
            } else {
              showToastError("Token tidak ditemukan!");
            }
          }
        } else {
          showToastError("Login Gagal");
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          showToastError(e.response!.data['message']);
        } else {
          showToastError(e.message.toString());
        }
      }
    } catch (e) {
      print("Error: ${e.toString()}");
      showToastError(e.toString());
    }
  }
}
