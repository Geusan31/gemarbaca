import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_book.dart';
import 'package:gemarbaca/app/data/model/response_high_rate_book.dart';
import 'package:gemarbaca/app/data/model/response_populer_book.dart';
import 'package:gemarbaca/app/data/model/response_user_peminjaman_riwayat.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var dataBookList = RxList<DataBook>();
  var dataUserPeminjamanRiwayatList = RxList<HistoryPeminjam>();
  var dataPopulerBookList = RxList<DataPopulerBook>();
  var dataHighRateBookList = RxList<DataHighRateBook>();
  var status = Rx<RxStatus>(RxStatus.loading());
  final rating = 0.0.obs;

  @override
  void onInit() async {
    super.onInit();
    // await getBuku();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<String> nameView() async {
    var name = StorageProvider.read(StorageKey.name);
    log(name);
    return name;
  }

  String welcome() {
    var jam = DateTime.now().hour;
    if (jam >= 1 && jam <= 11) {
      return 'Selamat Pagi';
    } else if (jam > 11 && jam <= 15) {
      return 'Selamat Siang';
    } else if (jam > 15 && jam <= 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }

  Future<void> getBuku() async {
    status.value = RxStatus.loading();
    await Future.delayed(Duration(seconds: 5));
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print("Decoded Token: ${decodedToken['id']}");
    try {
      var responses = await Future.wait([
        ApiProvider.instance().get(EndPoint.book,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
        ApiProvider.instance().get(
            "${EndPoint.user}/${decodedToken['id']}/peminjaman",
            options: Options(headers: {'Authorization': 'Bearer $token'})),
        ApiProvider.instance().get(EndPoint.populerBook,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
        ApiProvider.instance().get(EndPoint.highRateBook,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
      ]);
      final ResponseBook responseBook =
          ResponseBook.fromJson(responses[0].data);
      final ResponseUserPeminjamanRiwayat responseUserPeminjamanRiwayat =
          ResponseUserPeminjamanRiwayat.fromJson(responses[1].data);
      final ResponsePopulerBook responsePopulerBook =
          ResponsePopulerBook.fromJson(responses[2].data);
      final ResponseHighRateBook responseHighRateBook =
          ResponseHighRateBook.fromJson(responses[3].data);

      if (responseBook.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Buku: ${responseBook.data!}");
        dataBookList.value = responseBook.data!;
        status.value = RxStatus.success();
      }

      if (responseUserPeminjamanRiwayat.data!.peminjaman!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print(
            "Response Buku: ${responseUserPeminjamanRiwayat.data!.peminjaman!.isEmpty}");
        dataUserPeminjamanRiwayatList.value =
            responseUserPeminjamanRiwayat.data!.peminjaman![0].historyPeminjam!;
        status.value = RxStatus.success();
      }

      if (responsePopulerBook.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Buku: ${responsePopulerBook.data!}");
        dataPopulerBookList.value = responsePopulerBook.data!;
        status.value = RxStatus.success();
      }

      if (responseHighRateBook.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Buku: ${responseHighRateBook.data!}");
        dataHighRateBookList.value = responseHighRateBook.data!;
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
