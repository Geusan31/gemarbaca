import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_books_by_peminjaman.dart';
import 'package:gemarbaca/app/data/model/response_genre_by_peminjaman.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  //TODO: Implement SearchController
  final dataBookByPeminjamanList = RxList<DataBookByPeminjaman>();
  final dataGenreByPeminjamanList = RxList<DataGenreByPeminjaman>();
  TextEditingController searchController = TextEditingController();
  var status = Rx<RxStatus>(RxStatus.loading());

  Map<String, IconData> genreIcons = {
    'Advanture': CupertinoIcons.book,
    'Fantasy': CupertinoIcons.music_note,
    'Action': CupertinoIcons.film,
  };

  IconData getIconForGenre(String genreName) {
    return genreIcons[genreName] ?? CupertinoIcons.question;
  }

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getData();
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

  Future<void> getData() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);

    try {
      var response = await Future.wait([
        ApiProvider.instance().get(EndPoint.bookByPeminjaman,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
        ApiProvider.instance().get(EndPoint.genreByPeminjaman,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
      ]);
      final ResponseBooksByPeminjaman responseBooksByPeminjaman =
          ResponseBooksByPeminjaman.fromJson(response[0].data!);
      final ResponseGenreByPeminjaman responseGenreByPeminjaman =
          ResponseGenreByPeminjaman.fromJson(response[1].data!);

      if (responseBooksByPeminjaman.data!.isEmpty) {
        log("Empty Book By Peminjaman");
        status.value = RxStatus.empty();
      } else {
        log("Response Buku By Peminjaman: ${responseBooksByPeminjaman.data!}");
        dataBookByPeminjamanList.value = responseBooksByPeminjaman.data!;
        status.value = RxStatus.success();
      }

      if (responseGenreByPeminjaman.data!.isEmpty) {
        log("Empty Genre By Peminjaman");
        status.value = RxStatus.empty();
      } else {
        log("Response Genre By Peminjaman: ${responseGenreByPeminjaman.data!}");
        dataGenreByPeminjamanList.value = responseGenreByPeminjaman.data!;
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
}
