import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_user_koleksi.dart';
import 'package:gemarbaca/app/data/model/response_user_peminjaman_riwayat.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class KoleksiController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement KoleksiController
  TabController? tabController;
  var dataUserKoleksiList = RxList<KoleksiPribadi>();
  var dataUserPeminjamanList = RxList<Peminjaman>();
  var status = Rx<RxStatus>(RxStatus.loading());

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    await getKoleksi();
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

  Future<void> getKoleksi() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print("Decoded Token: ${decodedToken['id']}");
    try {
      var responses = await Future.wait([
        ApiProvider.instance().get(
            "${EndPoint.user}/${decodedToken['id']}/bookmark",
            options: Options(headers: {'Authorization': "Bearer $token"})),
        ApiProvider.instance().get(
            "${EndPoint.user}/${decodedToken['id']}/peminjaman",
            options: Options(headers: {'Authorization': 'Bearer $token'}))
      ]);
      final ResponseUserKoleksi responseUserKoleksi =
          ResponseUserKoleksi.fromJson(responses[0].data);
      final ResponseUserPeminjamanRiwayat responseUserPeminjamanRiwayat =
          ResponseUserPeminjamanRiwayat.fromJson(responses[1].data);

      if (responseUserKoleksi.data!.koleksiPribadi!.isEmpty) {
        print("Empty Koleksi Pribadi");
        status.value = RxStatus.empty();
      } else {
        print(
            "Response Koleksi Pribadi: ${responseUserKoleksi.data!.koleksiPribadi}");
        if (responseUserKoleksi.data!.koleksiPribadi != null) {
          dataUserKoleksiList.clear();
          dataUserKoleksiList.addAll(responseUserKoleksi.data!.koleksiPribadi!);
          print(dataUserKoleksiList);
          status.value = RxStatus.success();
        }
      }

      if (responseUserPeminjamanRiwayat.data!.peminjaman!.isEmpty) {
        print("Empty Peminjaman User");
        status.value = RxStatus.empty();
      } else {
        print(
            "Response Peminjaman User: ${responseUserPeminjamanRiwayat.data!.peminjaman}");
        if (responseUserPeminjamanRiwayat.data!.peminjaman != null) {
          dataUserPeminjamanList.clear();
          dataUserPeminjamanList.addAll(responseUserPeminjamanRiwayat.data!.peminjaman!);
          print(dataUserPeminjamanList);
          status.value = RxStatus.success();
        }
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
