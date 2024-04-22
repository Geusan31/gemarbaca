import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_edit_episode.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';

class EditEpisodeController extends GetxController {
  //TODO: Implement EditEpisodeController

  final GlobalKey<FormState> formKeyEpisode = GlobalKey<FormState>();
  final TextEditingController namaEpisodeController = TextEditingController();
  final TextEditingController filePickNameController = TextEditingController();
  final FileController = ''.obs;
  final FocusNode namaEpisodeFocusNode = FocusNode();
  final namaEpisodeIsFocused = false.obs;
  final filePath = ''.obs;
  final filePick = "".obs;
  late String originalImagePath;
  String originalTitle = '';
  final originalFilePath = ''.obs;

  final fileLoading = false.obs;

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getEpisode();
    log("Original Path: $originalFilePath");
    log("Ori Sama dengan controller Nama: ${namaEpisodeController.text == originalTitle}");
    log("Ori Sama dengan controller File: ${filePath.value == originalFilePath.value}");
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

  Future<void> getEpisode() async {
    final idEpisode = Get.parameters['id'];
    String token = StorageProvider.read(StorageKey.token);
    // final idEpisode = 8;
    try {
      var response = await ApiProvider.instance().get(
          "${EndPoint.episode}/$idEpisode",
          options: dio.Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseEditEpisode responseEpisode =
          ResponseEditEpisode.fromJson(response.data!);
      if (responseEpisode.data == null) {
        debugPrint("Empty Episode");
        // status.value = RxStatus.empty();
      } else {
        debugPrint("Response Episode: ${responseEpisode.data!}");
        originalTitle = responseEpisode.data!.judul! ?? '';
        namaEpisodeController.text = originalTitle;
        originalFilePath.value = responseEpisode.data!.file!;
        filePath.value = originalFilePath.value;
        // status.value = RxStatus.success();
      }
    } catch (e) {
      // status.value = RxStatus.error(e.toString());
      debugPrint(e.toString());
      showToastError(e.toString());
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

  Future<void> updateFile() async {
    fileLoading(true);
    String token = StorageProvider.read(StorageKey.token);
    var idBuku = Get.parameters['idBuku'];
    var id = Get.parameters['id'];
    try {
      dio.FormData formData = dio.FormData.fromMap({
        "bukuId": idBuku,
      });
      log("Ori Sama dengan controller Nama: ${namaEpisodeController.text == originalTitle}");
      if (namaEpisodeController.text != originalTitle) {
        formData.fields
            .add(MapEntry("judul", namaEpisodeController.text.toString()));
      }
      log("Ori Sama dengan controller File: ${filePath.value == originalFilePath.value}");
      if (filePath.value != originalFilePath.value &&
          filePath.value.isNotEmpty) {
        formData.files.add(MapEntry(
          "file",
          await dio.MultipartFile.fromFile(filePath.value,
              filename: filePickNameController.text,
              contentType: MediaType('application', 'pdf')),
        ));
      }

      log("Form Data: ${formData.fields}");
      // Cetak semua file dalam FormData
      for (var mapEntry in formData.files) {
        log('Key: ${mapEntry.key}, Value: ${mapEntry.value}');
      }

      final response = await dio.Dio().patch("${EndPoint.episode}/$id",
          data: formData,
          options: dio.Options(headers: {"Authorization": "Bearer $token"}),
          onSendProgress: (int sent, int total) {
        log('Send: $sent $total');
      });

      log("Response: ${response.toString()}");

      if (response.statusCode == 200) {
        fileLoading(false);
        Get.back();
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
      log("Error Catch: ${e.toString()}");
      if (e is dio.DioError) {
        log('DioError occurred: ${e.message}');
      }
    } finally {
      fileLoading(false);
    }
  }
}
