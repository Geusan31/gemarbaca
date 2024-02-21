import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  //TODO: Implement RegisterController
  late SharedPreferences _prefs;
  final FocusNode nameFocusNode = FocusNode();
  // final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  // final FocusNode alamatFocusNode = FocusNode();
  var isObscure = true.obs;
  var nameIsFocused = false.obs;
  var usernameIsFocused = false.obs;
  var emailIsFocused = false.obs;
  var passwordIsFocused = false.obs;
  var alamatIsFocused = false.obs;
  final loading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    setupSharedPreferences();
    nameFocusNode.addListener(() {
      nameIsFocused.value = nameFocusNode.hasFocus;
    });
    // usernameFocusNode.addListener(() {
    //   usernameIsFocused.value = usernameFocusNode.hasFocus;
    // });
    emailFocusNode.addListener(() {
      emailIsFocused.value = emailFocusNode.hasFocus;
    });
    passwordFocusNode.addListener(() {
      passwordIsFocused.value = passwordFocusNode.hasFocus;
    });
    // alamatFocusNode.addListener(() {
    //   alamatIsFocused.value = alamatFocusNode.hasFocus;
    // });
  }

  void setupSharedPreferences() async {
    _prefs = await SharedPreferences.getInstance();
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
  }

  register() async {
    print(usernameController.text.toString());
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        String email = emailController.text.toString();
        if (email.isEmpty) {
          showToastError("Email is required");
          return;
        }
        final response =
            await ApiProvider.instance().post(EndPoint.register, data: {
          "nama_lengkap": nameController.text.toString(),
          "email": emailController.text.toString(),
          "password": passwordController.text.toString(),
        });
        if (response.statusCode == 200) {
          await _prefs.setString('otp_token', response.data['token']);
          showToastSuccess(response.data['message']);
          Get.offAllNamed(Routes.OTP);
        } else {
          showToastError("Register Gagal!");
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          showToastError(e.response!.data['message']);
        } else {
          showToastError(e.message ?? "");
        }
      }
    } catch (e) {
      showToastError(e.toString());
    }
  }
}
