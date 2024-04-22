import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
// import 'package:gemarbaca/app/data/model/response_create_book.dart';
import 'package:gemarbaca/app/data/model/response_detail_book.dart';
import 'package:gemarbaca/app/data/model/response_genre.dart';
import 'package:gemarbaca/app/data/model/response_kategori.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class EditBookController extends GetxController
    with SingleGetTickerProviderMixin {
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
  final TextEditingController filePickNameController = TextEditingController();
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
  final dataDetailBuku = Rx<DataDetailBook?>(null);
  late RxList<DataKategori> dataKategoriList = RxList<DataKategori>();
  // final status = Rx<RxStatus>(RxStatus.loading());
  late RxList<Episode> dataFile = RxList<Episode>();
  final filePath = ''.obs;
  final filePick = "".obs;
  late String originalImagePath;

  final fileLoading = false.obs;

  late final TabController tabController =
      TabController(length: 2, vsync: this);

  List data = [];
  List selectedItems = [];
  var valueData = <dynamic>[].obs;

  List selectedItemsGenre = [].obs;
  List items = [].obs;
  final idBuku = Get.parameters['id'];

  @override
  void onInit() async {
    super.onInit();
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
    try {
      await getDetailBuku();
      await getDataKategori();
      await getDataGenre();
      print("OKE");
    } catch (e) {
      print(e.toString());
      showToastError(e.toString());
    }
    print("ID BUKU: $idBuku");
    // print("Status: ${status.value}");
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

  Future<void> getDataKategori() async {
    try {
      // status.value = RxStatus.loading();
      String token = StorageProvider.read(StorageKey.token);
      var response = await ApiProvider.instance().get(EndPoint.kategori,
          options: dio.Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseKategori responseKategori =
          ResponseKategori.fromJson(response.data!);
      if (responseKategori.data!.isEmpty) {
        print("Empty Kategori");
        // status.value = RxStatus.empty();
      } else {
        print("Response Kategori: ${responseKategori.data!}");
        data = responseKategori.data!;
        valueData.clear();
        valueData.add(data[0].kategoriID);
        // status.value = RxStatus.success();
        update();
      }
      data.map((item) => log("${item.kategoriID}: ${item.namaKategori}"));
    } catch (e) {
      // status.value = RxStatus.error(e.toString());
      print(e.toString());
      showToastError(e.toString());
    }
  }

  Future<void> getDataGenre() async {
    // status.value = RxStatus.loading();
    try {
      String token = StorageProvider.read(StorageKey.token);
      var response = await ApiProvider.instance().get(EndPoint.genre,
          options: dio.Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseGenre responseGenre =
          ResponseGenre.fromJson(response.data!);
      if (responseGenre.data!.isEmpty) {
        print("Empty Genre");
        // status.value = RxStatus.empty();
      } else {
        print("Response Genre: ${responseGenre.data!}");
        items = responseGenre.data!;
        // status.value = RxStatus.success();
        update();
      }
    } catch (e) {
      // status.value = RxStatus.error(e.toString());
      print(e.toString());
      showToastError(e.toString());
    }
    data.map((item) => log("${item.kategoriID}: ${item.namaKategori}"));
  }

  Future<void> getImage() async {
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

  Future<void> getFile() async {
    try {
      final fileResult = await FilePicker.platform.pickFiles(
          allowedExtensions: ['pdf'],
          type: FileType.custom,
          allowCompression: true,
          allowMultiple: false);

      if (fileResult != null) {
        final file = File(fileResult.files.single.path ?? '');
        log("Path file: ${file.path}");
        filePath.value = file.path;
        filePickNameController.value =
            TextEditingValue(text: file.path.split('/').last);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> sendFile() async {
    String token = StorageProvider.read(StorageKey.token);
    var idBuku = Get.parameters['id'];
    if (namaEpisodeController.text.isEmpty ||
        namaEpisodeController.text.trim() == "") {
      return showToastInfo("Nama file tidak boleh kosong");
    }

    if (filePath.value.isNotEmpty ||
        filePath.value.trim() != "" ||
        filePath.value != "") {
      try {
        fileLoading(true);
        dio.FormData formData = dio.FormData.fromMap({
          "bukuId": idBuku,
          "judul": namaEpisodeController.text.toString(),
          "file": await dio.MultipartFile.fromFile(filePath.value,
              filename: filePickNameController.text, contentType: MediaType('application', 'pdf')),
        });

        final response = await dio.Dio().post(EndPoint.episode,
            data: formData,
            options: dio.Options(
                headers: {"authorization": "Bearer $token"}),
            onSendProgress: (int sent, int total) {
          print('Send: $sent $total');
        });

        log("Response: ${response.toString()}");

        if (response.statusCode == 200) {
          await getDetailBuku();
          update();
        } else {
          throw Exception(
              'Failed to upload file. Status code: ${response.statusCode}');
        }
        fileLoading(false);
      } on dio.DioException catch (e) {
        if (e.response != null) {
          if (e.response?.data != null) {
            log("Error data: ${e.response?.data['message']}");
            // status.value = RxStatus.error("${e.response?.data['message']}");
          }
        } else {
          log("Error data: ${e.message ?? ''}");
          // status.value = RxStatus.error(e.message ?? "");
        }
      } catch (e) {
        fileLoading(false);
        log(e.toString());
        if (e is dio.DioError) {
          log('DioError occurred: ${e.message}');
        }
      }
    } else {
      return showToastInfo("File buku tidak boleh kosong");
    }
  }

  Future<void> deleteFile(fileid) async {
    String token = StorageProvider.read(StorageKey.token);
    var idEpisode = Get.parameters['id'];
    log(fileid.toString());
    try {
      fileLoading(true);
      final response = await ApiProvider.instance().delete(
          "${EndPoint.episode}/$fileid",
          options: dio.Options(headers: {"authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        await getDetailBuku();
        update();
        fileLoading(false);
      }
    } on dio.DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          log("Error data: ${e.response?.data['message']}");
          // status.value = RxStatus.error("${e.response?.data['message']}");
        }
      } else {
        log("Error data: ${e.message ?? ''}");
        // status.value = RxStatus.error(e.message ?? "");
      }
    } catch (e) {
      fileLoading(false);
      log(e.toString());
    }
  }

  Future<void> getDetailBuku() async {
    // status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    print("Id Buku $idBuku");
    try {
      var response = await ApiProvider.instance().get(
          "${EndPoint.book}/$idBuku",
          options: dio.Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseDetailBook responseDetailBuku =
          ResponseDetailBook.fromJson(response.data!);

      if (responseDetailBuku.data == null) {
        print("Empty Buku");
        // status.value = RxStatus.empty();
      } else {
        print("MASUK BUKU");
        judulController.text = (responseDetailBuku.data!.judul! ?? '');
        penulisController.text = responseDetailBuku.data!.penulis! ?? '';
        penerbitController.text = responseDetailBuku.data!.penerbit ?? '';
        deskripsiController.text = responseDetailBuku.data!.deskripsi ?? '';
        tahunTerbitController.text =
            responseDetailBuku.data!.tahunTerbit.toString() ?? '';
        imagePath.value = responseDetailBuku.data!.cover ?? '';
        // log("Image: ${responseDetailBuku.data!.cover ?? ''}");
        stokController.text = responseDetailBuku.data!.stok.toString() ?? '';
        // valueData = [
        //   responseDetailBuku.data!.kategoryBuku
        //       ?.map((kategory) => kategory.bukuID)
        // ] as RxList;
        // selectedItemsGenre = responseDetailBuku.data!.genreBuku!
        //     .map((genre) => genre.genreBuku?.id)
        //     .toList()
        //     .cast<dynamic>();
        print("Response Profile: ${responseDetailBuku.data!}");
        dataDetailBuku.value = responseDetailBuku.data!;
        dataFile.value = responseDetailBuku.data!.episode!;
        update();
        // status.value = RxStatus.success();
      }
    } on dio.DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          // status.value = RxStatus.error("${e.response?.data['message']}");
        }
      } else {
        // status.value = RxStatus.error(e.message ?? "");
      }
    } catch (e) {
      // status.value = RxStatus.error(e.toString());
      print("Catch Error Detail Buku: ${e.toString()}");
      showToastError(e.toString());
    }
  }

  editBook() async {
    loading(true);
    try {
      String token = StorageProvider.read(StorageKey.token);
      var idBuku = Get.parameters['id'];
      // if (imagePath.value.isNotEmpty) {
      //   try {
      //     File imageFile = File(imagePath.value);
      //     if(await imageFile.exists()) {
      //       List<int> imageBytes = await imageFile.readAsBytes();
      //       String base64Image = base64Encode(imageBytes);
      //       profilePict = base64Image;
      //       log(profilePict);
      //     } else {
      //       showToastError("File does not exist at this path: ${imagePath.value}");
      //     }
      //   } catch (e) {
      //     profilePict = imagePath.value;
      //     log("Error converting image to base64: $e");
      //     return null;
      //   }
      // } else {
      //   showToastInfo("Image kosong");
      // }

      if (imagePath.value.isNotEmpty ||
          imagePath.value.trim() != "" ||
          imagePath.value != "") {
        try {
          // Coba dekode string. Jika berhasil, itu adalah string base64.
          base64Decode(imagePath.value);
          profilePict = imagePath.value;
        } catch (e) {
          // Jika gagal, itu adalah jalur file dan perlu dikonversi ke base64.
          File imageFile = File(imagePath.value);
          List<int> imageBytes = await imageFile.readAsBytes();
          profilePict = base64Encode(imageBytes);
        }
      } else if (imagePath.value == "" && profilePict == "") {
        return showToastInfo("Cover buku tidak boleh kosong");
      }

      if (Get.context == null) {
        print("Error: Context is null");
        return;
      }

      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().patch(
            "${EndPoint.book}/$idBuku",
            options: dio.Options(headers: {"Authorization": "Bearer $token"}),
            data: {
              "judul": judulController.text.toString(),
              "penulis": penulisController.text.toString(),
              "penerbit": penerbitController.text.toString(),
              "deskripsi": deskripsiController.text.toString(),
              "tahun_terbit": int.parse(tahunTerbitController.text),
              "cover": profilePict.toString(),
              'stok': 10,
              "kategoryIds": valueData.toList(),
              "genreIds": selectedItemsGenre,
            });
        if (response.statusCode == 200) {
          showToastSuccess(response.data['message']);
          Get.back();
        } else {
          showToastError("Edit Book Gagal!");
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
