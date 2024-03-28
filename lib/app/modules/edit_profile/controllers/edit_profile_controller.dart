import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_detail_profile.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tanggalLahirController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController bioController = TextEditingController();
  final TextEditingController jenisKelaminController = TextEditingController();
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode alamatFocusNode = FocusNode();
  final FocusNode tanggalLahirFocusNode = FocusNode();
  final FocusNode bioFocusNode = FocusNode();
  final FocusNode jenisKelaminFocusNode = FocusNode();
  var isObscure = true.obs;
  var nameIsFocused = false.obs;
  var usernameIsFocused = false.obs;
  var emailIsFocused = false.obs;
  var alamatIsFocused = false.obs;
  var bioIsFocused = false.obs;
  var tanggalLahirIsFocused = false.obs;
  var jenisKelaminIsFocused = false.obs;
  final loading = false.obs;
  String selectedItem = "other";
  var imagePath = ''.obs;
  var imageSize = ''.obs;
  String profilePict = 'nopicture';
  final count = 0.obs;
  final dataDetailProfile = Rx<DataDetailProfile?>(null);
  var status = Rx<RxStatus>(RxStatus.loading());

  @override
  void onInit() async {
    super.onInit();
    await getDetailProfile();
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
      tanggalLahirIsFocused.value = tanggalLahirFocusNode.hasFocus;
    });
    bioFocusNode.addListener(() {
      bioIsFocused.value = bioFocusNode.hasFocus;
    });
    jenisKelaminFocusNode.addListener(() {
      jenisKelaminIsFocused.value = jenisKelaminFocusNode.hasFocus;
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

  Future<void> getImage() async {
    if (imagePath.value != '') {
      return showToastInfo("Profile picture is already set");
    } else {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image != null) {
        imagePath.value = image.path;
        imageSize.value =
            "${((File(imagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
        return showToastSuccess("Profile picture changed successfully");
      } else {
        imagePath.value = '';
        imageSize.value = '';
        return showToastInfo("Cancel profile image selection");
      }
    }
  }

  Future<DateTime?> selectedDate() async {
    if (Get.context != null) {
      DateTime? picked = await showDatePicker(
        context: Get.context!,
        firstDate: DateTime(2000),
        initialDate: DateTime.now(),
        lastDate: DateTime(2100),
      );
      return picked;
    }
    return null;
  }

  void check() {
    log("Value: $selectedItem");
  }

  Future<void> getDetailProfile() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var id = decodedToken['id'];
    print("Id Profile $id");
    try {
      var response = await ApiProvider.instance().get("${EndPoint.profile}/$id",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseDetailProfile responseDetailProfile =
          ResponseDetailProfile.fromJson(response.data!);

      if (responseDetailProfile.data == null) {
        print("Empty Profile");
        status.value = RxStatus.empty();
      } else {
        nameController.text =
            (responseDetailProfile.data!.user!.namaLengkap ?? '');
        usernameController.text =
            responseDetailProfile.data!.user!.username ?? '';
        alamatController.text = responseDetailProfile.data!.user!.alamat ?? '';
        tanggalLahirController.text =
            responseDetailProfile.data!.tanggalLahir ?? '';
        bioController.text = responseDetailProfile.data!.bio ?? '';
        imagePath.value = responseDetailProfile.data!.fotoProfile ?? '';
        jenisKelaminController.text =
            responseDetailProfile.data!.jenisKelamin ?? '';
        selectedItem = jenisKelaminController.text;
        print("Response Profile: ${responseDetailProfile.data!}");
        dataDetailProfile.value = responseDetailProfile.data!;
        status.value = RxStatus.success();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          status.value = RxStatus.error("${e.response?.data['message']}");
        }
      } else {
        status.value = RxStatus.error(e.message ?? "");
      }
    } catch (e) {
      print(e.toString());
      showToastError(e.toString());
    }
  }

  editProfile() async {
    try {
      String token = StorageProvider.read(StorageKey.token);
      Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      var id = decodedToken['id'];
      print("Id Profile $id");
      print(usernameController.text.toString());
      loading(true);
      if (imagePath.value.isNotEmpty) {
        try {
          FileSystemEntity.typeSync(imagePath.value);
          // If the above line does not throw an exception, imagePath.value is a valid file path
          File imageFile = File(imagePath.value);
          List<int> imageBytes = await imageFile.readAsBytes();
          String base64Image = base64Encode(imageBytes);
          profilePict = base64Image;
        } catch (e) {
          profilePict = imagePath.value;
          log("Error converting image to base64: $e");
          return null;
        }
      } else {
        showToastInfo("Image kosong");
      }

      if (Get.context == null) {
        print("Error: Context is null");
        return;
      }

      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        String name = nameController.text.toString();
        if (name.isEmpty) {
          showToastError("Name is required");
          return;
        }
        final response = await ApiProvider.instance().patch(
            "${EndPoint.profile}/$id",
            options: Options(headers: {"Authorization": "Bearer $token"}),
            data: {
              "NamaLengkap": nameController.text.toString(),
              "Username": usernameController.text.toString(),
              "Alamat": alamatController.text.toString(),
              "tanggal_lahir": tanggalLahirController.text.toString(),
              "jenisKelamin": selectedItem,
              "fotoProfile": profilePict,
              "bio": bioController.text.toString(),
            });
        if (response.statusCode == 200) {
          showToastSuccess(response.data['message']);
          Get.back();
        } else {
          showToastError("Edit Profile Gagal!");
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          print(e.response!.data['message']);
          showToastError(e.response!.data['message']);
        } else {
          showToastError(e.message ?? "");
        }
      }
    } catch (e) {
      print(e.toString());
      showToastError(e.toString());
    }
    loading(false);
  }
}
