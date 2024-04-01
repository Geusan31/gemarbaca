import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_genre.dart';
import 'package:gemarbaca/app/data/model/response_kategori.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';

class BukuController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement BukuController
  var dataGenreList = RxList<DataGenre>();
  var dataKategoriList = RxList<DataKategori>();
  TabController? tabController;
  TabController? genreTabController;
  TabController? categoryTabController;
  List<TabController>? genreBookControllers;
  List<TabController>? categoryBookControllers;
  var status = Rx<RxStatus>(RxStatus.loading());

  var appBarTitles = ['Kategori', 'Genre'];

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getGenre().then((_) {
      genreBookControllers = dataGenreList.map((genre) {
        return TabController(
          length: genre.buku!.length,
          vsync: this,
        );
      }).toList();
    });

    await getKategori().then((_) {
      categoryBookControllers = dataKategoriList.map((category) {
        print("Category List: $category");
        return TabController(
          length: category.buku!.length,
          vsync: this,
        );
      }).toList();
    });

    genreTabController =
        TabController(length: dataGenreList.length, vsync: this);
    categoryTabController =
        TabController(length: dataKategoriList.length, vsync: this);
    tabController = TabController(length: appBarTitles.length, vsync: this);

    // Get argumen genre
    // String genreName = Get.arguments as String;
    //
    // int tabIndex = dataGenreList.indexWhere((genre) => genre.nama == genreName);
    //
    // // pindah ke tab sesuai dengan genre nama
    // if(tabIndex != -1) {
    //   Future.delayed(Duration.zero, () {
    //     genreTabController!.animateTo(tabIndex);
    //   });
    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  void disposeTabControllers(List<TabController>? controllers) {
    controllers?.forEach((controller) {
      controller.dispose();
    });
  }

  @override
  void onClose() {
    disposeTabControllers(genreBookControllers);
    disposeTabControllers(categoryBookControllers);
    genreTabController?.dispose();
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
