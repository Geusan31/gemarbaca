import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_book.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ListBookEditController extends GetxController {
  //TODO: Implement ListBookEditController

  late RxList<DataBook> dataBookList = RxList<DataBook>();
  final status = Rx<RxStatus>(RxStatus.loading());
  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getBuku();
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

  Future<void> getBuku() async {
    status.value = RxStatus.loading();
    // await Future.delayed(Duration(seconds: 5));
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print("Decoded Token: ${decodedToken['id']}");
    try {
      var responses = await ApiProvider.instance().get(EndPoint.book,
            options: Options(headers: {'Authorization': 'Bearer $token'}));
      final ResponseBook responseBook =
      ResponseBook.fromJson(responses.data);

      if (responseBook.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Buku: ${responseBook.data!}");
        dataBookList.value = responseBook.data!;
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
      log(e.toString());
      showToastError(e.toString());
    }
  }

  void deleteBook(String idBuku) async {
    print('deleteBook called with id: $idBuku');
    String token = StorageProvider.read(StorageKey.token);
    try {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.confirm,
        showCancelBtn: true,
        showConfirmBtn: true,
        title: "Hapus Buku",
        text: "Apakah anda yakin?.",
        onConfirmBtnTap: () async {
          print("ID Buku: $idBuku");
          Navigator.of(Get.context!, rootNavigator: true).pop('dialog');

          final response = await ApiProvider.instance().delete(
              "${EndPoint.book}/$idBuku",
              options: Options(headers: {"authorization": "Bearer $token"}));
          print('API response: ${response.statusCode}');

          if (response.statusCode == 200) {
            status.value = RxStatus.success();
            QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.success,
                autoCloseDuration: const Duration(seconds: 3),
                title: "Berhasil Dihapus!",
                text: "Buku berhasil dihapus");
            await getBuku();
            update();
          }
        },
      );
    } catch (e) {
      print('Error in deleteBook: $e');
      log(e.toString());
    }
  }
}
