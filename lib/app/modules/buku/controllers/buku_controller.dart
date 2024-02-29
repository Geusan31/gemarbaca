import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_genre.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';

class BukuController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement BukuController
  TabController? tabController;
  TabController? subTabController;
  var dataGenreList = RxList<DataGenre>();
  var status = Rx<RxStatus>(RxStatus.loading());

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    subTabController = TabController(length: dataGenreList.length, vsync: this);
    getGenre();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController?.dispose();
    subTabController?.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> getGenre() async {
    status.value = RxStatus.loading();
    print(StorageProvider.read('token'));
    try {
      var responses = await Future.wait([
        ApiProvider.instance().get(EndPoint.genre,
            options: Options(headers: {
              'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwibmFtZSI6IlJhaXNzYW4iLCJlbWFpbCI6InJhaXNhcmlhMzQxQGdtYWlsLmNvbSIsInJvbGUiOiJhZG1pbiIsImlhdCI6MTcwOTE3ODQxNywiZXhwIjoxNzA5MjY0ODE3fQ.woR6sItRCiShph__Zc4PLs-sZfwnK4QDC7MbXOzwZ_4'
            })),
      ]);
      final ResponseGenre responseGenre =
      ResponseGenre.fromJson(responses[0].data);

      if (responseGenre.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Genre: ${responseGenre.data!}");
        dataGenreList.value = responseGenre.data!;
        tabController = TabController(length: dataGenreList.length, vsync: this);
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
