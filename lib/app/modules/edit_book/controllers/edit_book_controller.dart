import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_create_book.dart';
import 'package:gemarbaca/app/data/model/response_genre.dart';
import 'package:gemarbaca/app/data/model/response_kategori.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditBookController extends GetxController {
  //TODO: Implement EditBookController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyEpisode = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController deskripsiController = TextEditingController();
  final TextEditingController tahunTerbitController = TextEditingController();
  final TextEditingController stokController = TextEditingController();
  final TextEditingController kategoriController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController namaEpisodeController = TextEditingController();
  final FileController = ''.obs;
  final FocusNode judulFocusNode = FocusNode();
  final FocusNode penulisFocusNode = FocusNode();
  final FocusNode penerbitFocusNode = FocusNode();
  final FocusNode deskripsiFocusNode = FocusNode();
  final FocusNode tahunTerbitFocusNode = FocusNode();
  final FocusNode stokFocusNode = FocusNode();
  final FocusNode kategoriFocusNode = FocusNode();
  final FocusNode genreFocusNode = FocusNode();
  final FocusNode namaEpisodeFocusNode = FocusNode();
  final isObscure = true.obs;
  final judulIsFocused = false.obs;
  final penulisIsFocused = false.obs;
  final penerbitIsFocused = false.obs;
  final deskripsiIsFocused = false.obs;
  final tahunTerbitIsFocused = false.obs;
  final stokIsFocused = false.obs;
  final kategoriIsFocused = false.obs;
  final genreIsFocused = false.obs;
  final namaEpisodeIsFocused = false.obs;
  final loading = false.obs;
  final imagePath = ''.obs;
  final imageSize = ''.obs;
  String profilePict = 'nopicture';
  final count = 0.obs;
  final dataCreateBook = Rx<DataCreateBook?>(null);
  late RxList<DataKategori> dataKategoriList = RxList<DataKategori>();
  final status = Rx<RxStatus>(RxStatus.loading());

  List data = [];
  List selectedItems = [];
  final valueData = <dynamic>[].obs;

  List selectedItemsGenre = [].obs;
  List items = [].obs;

  @override
  void onInit() async {
    super.onInit();
    await getDataKategori();
    await getDataGenre();
    judulFocusNode.addListener(() {
      judulIsFocused.value = judulFocusNode.hasFocus;
    });
    penulisFocusNode.addListener(() {
      penulisIsFocused.value = penulisFocusNode.hasFocus;
    });
    deskripsiFocusNode.addListener(() {
      deskripsiIsFocused.value = deskripsiFocusNode.hasFocus;
    });
    tahunTerbitFocusNode.addListener(() {
      tahunTerbitIsFocused.value = tahunTerbitFocusNode.hasFocus;
    });
    stokFocusNode.addListener(() {
      stokIsFocused.value = stokFocusNode.hasFocus;
    });
    namaEpisodeFocusNode.addListener(() {
      namaEpisodeIsFocused.value = namaEpisodeFocusNode.hasFocus;
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
  getDataKategori() async {
    status.value = RxStatus.loading();
    try {
      String token = StorageProvider.read(StorageKey.token);
      var response = await ApiProvider.instance().get(EndPoint.kategori,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseKategori responseKategori =
          ResponseKategori.fromJson(response.data!);
      if (responseKategori.data!.isEmpty) {
        print("Empty Kategori");
        status.value = RxStatus.empty();
      } else {
        print("Response Kategori: ${responseKategori.data!}");
        data = responseKategori.data!;
        valueData.clear();
        valueData.add(data[0].kategoriID);
        status.value = RxStatus.success();
        update();
      }
    } catch (e) {
      status.value = RxStatus.error(e.toString());
      print(e.toString());
      showToastError(e.toString());
    }
    data.map((item) => log("${item.kategoriID}: ${item.namaKategori}"));
  }

  getDataGenre() async {
    status.value = RxStatus.loading();
    try {
      String token = StorageProvider.read(StorageKey.token);
      var response = await ApiProvider.instance().get(EndPoint.genre,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseGenre responseGenre =
          ResponseGenre.fromJson(response.data!);
      if (responseGenre.data!.isEmpty) {
        print("Empty Genre");
        status.value = RxStatus.empty();
      } else {
        print("Response Genre: ${responseGenre.data!}");
        items = responseGenre.data!;
        status.value = RxStatus.success();
        update();
      }
    } catch (e) {
      status.value = RxStatus.error(e.toString());
      print(e.toString());
      showToastError(e.toString());
    }
    data.map((item) => log("${item.kategoriID}: ${item.namaKategori}"));
  }

  Future<void> getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    try {
      if (image != null) {
        imagePath.value = image.path;
        imageSize.value =
            "${((File(imagePath.value)).lengthSync() / 1024 / 1024).toStringAsFixed(2)}Mb";
        showToastSuccess("Profile picture changed successfully");
      } else {
        imagePath.value = '';
        imageSize.value = '';
        showToastInfo("Cancel profile image selection");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> getFile() async {
    try {
      final fileResult = await FilePicker.platform.pickFiles(
          allowedExtensions: ['pdf'],
          type: FileType.custom,
          allowCompression: true,
          allowMultiple: false);

      if (fileResult != null) {
        final file = fileResult.files.first;
        log("Path file: ${file.path}");
        FileController.value = file.path!;
        namaEpisodeController.value = TextEditingValue(text: file.name);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  createBook() async {
    try {
      String token = StorageProvider.read(StorageKey.token);
      loading(true);
      if (imagePath.value.isNotEmpty) {
        try {
          File imageFile = File(imagePath.value);
          List<int> imageBytes = await imageFile.readAsBytes();
          String base64Image = base64Encode(imageBytes);
          profilePict = base64Image;
          log(profilePict);
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
        final response = await ApiProvider.instance().post(EndPoint.book,
            options: Options(headers: {"Authorization": "Bearer $token"}),
            data: {
              "judul": judulController.text.toString(),
              "penulis": penulisController.text.toString(),
              "penerbit": penerbitController.text.toString(),
              "deskripsi": deskripsiController.text.toString(),
              "tahun_terbit": tahunTerbitController.text.toString(),
              "cover": profilePict,
              'stok': 10,
              "kategoryIds": valueData.toList(),
              "genreIds": selectedItemsGenre,
            });
        if (response.statusCode == 200) {
          showToastSuccess(response.data['message']);
          Get.offAllNamed(Routes.MANAGE_BOOK);
        } else {
          showToastError("Create Book Gagal!");
        }
      }
      loading(false);
    } on DioException catch (e) {
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
