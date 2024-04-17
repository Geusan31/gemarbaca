import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_create_book.dart';
import 'package:gemarbaca/app/data/model/response_kategori.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CreateBookController extends GetxController {
  //TODO: Implement CreateBookController

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final FocusNode judulFocusNode = FocusNode();
  final FocusNode penulisFocusNode = FocusNode();
  final FocusNode penerbitFocusNode = FocusNode();
  final FocusNode deskripsiFocusNode = FocusNode();
  final FocusNode tahunTerbitFocusNode = FocusNode();
  final FocusNode stokFocusNode = FocusNode();
  final FocusNode kategoriFocusNode = FocusNode();
  final FocusNode genreFocusNode = FocusNode();
  final isObscure = true.obs;
  final judulIsFocused = false.obs;
  final penulisIsFocused = false.obs;
  final penerbitIsFocused = false.obs;
  final deskripsiIsFocused = false.obs;
  final tahunTerbitIsFocused = false.obs;
  final stokIsFocused = false.obs;
  final kategoriIsFocused = false.obs;
  final genreIsFocused = false.obs;
  final loading = false.obs;
  final imagePath = ''.obs;
  final imageSize = ''.obs;
  String profilePict = 'nopicture';
  final count = 0.obs;
  final dataCreateBook = Rx<DataCreateBook?>(null);
  late RxList<DataKategori> dataKategoriList = RxList<DataKategori>();
  final status = Rx<RxStatus>(RxStatus.loading());

  List data = [];
  int valueData = 1;

  @override
  void onInit() {
    super.onInit();
    getDataKategori();
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

  getDataKategori() async {
    String token = StorageProvider.read(StorageKey.token);
    var response = await ApiProvider.instance().get(EndPoint.kategori,
        options: Options(headers: {'Authorization': 'Bearer $token'}));

    final ResponseKategori responseKategori =
        ResponseKategori.fromJson(response.data!);
    dataKategoriList.value = responseKategori.data!;
    print(dataKategoriList);
  }

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
}
