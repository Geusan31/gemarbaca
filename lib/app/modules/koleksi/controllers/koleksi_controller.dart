import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_user_koleksi.dart';
import 'package:gemarbaca/app/data/model/response_user_peminjaman_riwayat.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/modules/layout/controllers/layout_controller.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print("Native called background task: $task");
    return Future.value(true);
  });
}

class KoleksiController extends GetxController
    with GetTickerProviderStateMixin {
  //TODO: Implement KoleksiController
  Timer? _timer, _pollingTimer;
  DateTime? _dueDate;
  int? _currentBookId;
  String? _currentBookTitle;
  final remainingTime = RxString('');
  TabController? tabController;
  final dataUserKoleksiList = RxList<KoleksiPribadi>();
  final dataUserPeminjamanList = RxList<Peminjaman>();
  var status = Rx<RxStatus>(RxStatus.loading());

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    await getKoleksi();

    _pollingTimer = Timer.periodic(Duration(seconds: 30), (timer) async {
      await getKoleksi();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _pollingTimer?.cancel();
  }

  void increment() => count.value++;

  void startTimer(DateTime dueDate, int bookId, String judulBuku) {
    print("Mulai");
    _dueDate = dueDate;
    _currentBookId = bookId;
    _currentBookTitle = judulBuku;
    print("Id Buku: $_currentBookId");
    print("Judul Buku: $_currentBookTitle");
    _timer = Timer.periodic(Duration(seconds: 1), (Timer t) => updateTime());
    print("Tanggal Start: $_dueDate");
    Workmanager().initialize(callbackDispatcher);
    final duration = dueDate.difference(DateTime.now());
    Workmanager().registerOneOffTask(
      'deleteLoan',
      'deleteLoanTask',
      initialDelay: duration,
    );
  }

  void updateTime() {
    if (_dueDate != null) {
      var now = DateTime.now();
      var remainingDuration = _dueDate!.difference(now);
      var formattedTime = formatDuration(remainingDuration);
      print("Time: ${remainingTime.value}");
      remainingTime.value = formattedTime;

      if (remainingDuration.isNegative) {
        _timer?.cancel();
        deletePeminjaman();
      }
    }
  }

  String formatDuration(Duration d) {
    var days = d.inDays;
    var hours = d.inHours.remainder(24);
    var minutes = d.inMinutes.remainder(60);
    var seconds = d.inSeconds.remainder(60);

    return "${days}d ${hours}h ${minutes}m ${seconds}s";
  }

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
          dataUserPeminjamanList
              .addAll(responseUserPeminjamanRiwayat.data!.peminjaman!);
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

  Future<void> deleteKoleksi(index) async {
    String token = StorageProvider.read(StorageKey.token);
    try {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.confirm,
        showCancelBtn: true,
        showConfirmBtn: true,
        title: "Apakah anda yakin?",
        text:
        "Anda akan menghapus buku ${dataUserKoleksiList[index].buku!.judul} dari daftar koleksi pribadi.",
        onConfirmBtnTap: () async {
          Navigator.pop(Get.context!);
          final response = await ApiProvider.instance().delete("${EndPoint.koleksi}/$index",
              options: Options(headers: {"Authorization": "Bearer $token"}));

          if (response.statusCode == 200) {
            QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.success,
                autoCloseDuration: const Duration(seconds: 3),
                title: "Berhasil Dihapus!",
                text: "Buku berhasil dihapus dari daftar koleksi pribadi.");
            await getKoleksi();
            update();
          }
        },
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void deletePeminjaman() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print("Decoded Token: ${decodedToken['id']}");
    try {
      FocusScope.of(Get.context!).unfocus();
      final response = await ApiProvider.instance().delete(
          "${EndPoint.pinjam}/$_currentBookId",
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (response.statusCode == 200) {
        await getKoleksi();
        showToastInfo("Waktu Peminjaman buku ${_currentBookTitle} sudah habis. Buku akan dihapus dari peminjaman");
      } else {
        showToastError("Gagal mengembalikan buku");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.data != null) {
          print("Error: ${e.response!.data['message']}");
          showToastError(e.response!.data['message']);
        } else {
          print("Error Null: ${e.response!.data.toString()}");
          showToastError(e.message.toString());
        }
      }
    } catch (e) {
      print("Error Catch: ${e.toString()}");
      showToastError(e.toString());
    }
  }
}
