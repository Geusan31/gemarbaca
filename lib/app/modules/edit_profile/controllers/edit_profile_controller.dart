import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode alamatFocusNode = FocusNode();
  final FocusNode tanggalLahirFocusNode = FocusNode();
  var isObscure = true.obs;
  var nameIsFocused = false.obs;
  var usernameIsFocused = false.obs;
  var emailIsFocused = false.obs;
  var alamatIsFocused = false.obs;
  final loading = false.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    nameFocusNode.addListener(() {
      nameIsFocused.value = nameFocusNode.hasFocus;
    });
    usernameFocusNode.addListener(() {
      usernameIsFocused.value = usernameFocusNode.hasFocus;
    });
    emailFocusNode.addListener(() {
      emailIsFocused.value = emailFocusNode.hasFocus;
    });
    alamatFocusNode.addListener(() {
      alamatIsFocused.value = alamatFocusNode.hasFocus;
    });
    tanggalLahirFocusNode.addListener(() {
      alamatIsFocused.value = alamatFocusNode.hasFocus;
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

  void increment() => count.value++;

  editProfile() async {
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
          "username": usernameController.text.toString(),
          "email": emailController.text.toString(),
          "tanggal_lahir": tanggalLahirController.text.toString(),
        });
        if (response.statusCode == 200) {
          showToastSuccess(response.data['message']);
          Get.back();
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
    loading(false);
  }
}
