import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_genre.dart';
import 'package:gemarbaca/app/data/model/response_kategori.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';

class BookController extends GetxController with SingleGetTickerProviderMixin {
  //TODO: Implement BookController
  late TabController tabController;
  late TabController appBarController;
  var appBarTitles = ['Kategori', 'Genre'];
  var dataGenreList = RxList<DataGenre>();
  var dataKategoriList = RxList<DataKategori>();
  var status = Rx<RxStatus>(RxStatus.loading());
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    appBarController = TabController(length: appBarTitles.length, vsync: this);
    tabController = TabController(
      length: dataGenreList.length + dataKategoriList.length,
      vsync: this,
    );
    getGenre();
    getKategori();
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

  Future<void> getGenre() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    print(StorageProvider.read('token'));
    try {
      var responses = await Future.wait([
        ApiProvider.instance().get(EndPoint.genre,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
      ]);
      final ResponseGenre responseGenre =
          ResponseGenre.fromJson(responses[0].data);

      if (responseGenre.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Genre: ${responseGenre.data!}");
        dataGenreList.value = responseGenre.data!;
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
      showToastError(e.toString());
    }
  }

  Future<void> getKategori() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    print(StorageProvider.read('token'));
    try {
      var responses = await Future.wait([
        ApiProvider.instance().get(EndPoint.kategori,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
      ]);
      final ResponseKategori responseKategori =
          ResponseKategori.fromJson(responses[0].data);

      if (responseKategori.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Kategori: ${responseKategori.data!}");
        dataKategoriList.value = responseKategori.data!;
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
      showToastError(e.toString());
    }
  }
}
