import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_book.dart';
import 'package:gemarbaca/app/data/model/response_dash_koleksi.dart';
import 'package:gemarbaca/app/data/model/response_dash_peminjaman.dart';
import 'package:gemarbaca/app/data/model/response_dash_users.dart';
import 'package:gemarbaca/app/data/model/response_detail_profile.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
  late int dataDashUserList = 0;
  late int dataDashPeminjamanList = 0;
  late int dataDashKoleksiList = 0;
  late int dataBookList = 0;
  final status = Rx<RxStatus>(RxStatus.loading());

  final dataDetailProfile = Rx<DataDetailProfile?>(null);

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await getDetailProfile();
    await getDataDashboard();
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

  Future<void> getDataDashboard() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print("Decoded Token: ${decodedToken['id']}");
    try {
      var responses = await Future.wait([
        ApiProvider.instance().get(EndPoint.user,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
        ApiProvider.instance().get(EndPoint.book,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
        ApiProvider.instance().get(EndPoint.pinjam,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
        ApiProvider.instance().get(EndPoint.koleksi,
            options: Options(headers: {'Authorization': 'Bearer $token'})),
      ]);
      final ResponseDashUsers responseDashUsers =
          ResponseDashUsers.fromJson(responses[0].data);
      final ResponseBook responseBook =
          ResponseBook.fromJson(responses[1].data);
      final ResponseDashPeminjaman responseDashPeminjaman =
          ResponseDashPeminjaman.fromJson(responses[2].data);
      final ResponseDashKoleksi responseDashKoleksi =
          ResponseDashKoleksi.fromJson(responses[3].data);

      if (responseDashUsers.data!.isEmpty) {
        print("Empty Users");
        status.value = RxStatus.empty();
      } else {
        print("Total Users: ${responseDashUsers.total!}");
        dataDashUserList = responseDashUsers.total!;
        status.value = RxStatus.success();
      }

      if (responseBook.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Total Buku: ${responseBook.total!}");
        dataBookList = responseBook.total!;
        status.value = RxStatus.success();
      }

      if (responseDashPeminjaman.data!.isEmpty) {
        print("Empty Peminjaman");
        status.value = RxStatus.empty();
      } else {
        print("Total Peminjaman: ${responseDashPeminjaman.total!}");
        dataDashPeminjamanList = responseDashPeminjaman.total!;
        status.value = RxStatus.success();
      }

      if (responseDashKoleksi.data!.isEmpty) {
        print("Empty Koleksi");
        status.value = RxStatus.empty();
      } else {
        print("Total Koleksi: ${responseDashKoleksi.total!}");
        dataDashKoleksiList = responseDashKoleksi.total!;
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

  Future<void> getDetailProfile() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var id = decodedToken['id'];
    // var idBuku = 5;
    try {
      var response = await ApiProvider.instance().get("${EndPoint.book}/$id",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseDetailProfile responseDetailProfile =
          ResponseDetailProfile.fromJson(response.data!);

      if (responseDetailProfile.data == null) {
        print("Empty Profile");
        status.value = RxStatus.empty();
      } else {
        print("Response Genre: ${responseDetailProfile.data!}");
        dataDetailProfile.value = responseDetailProfile.data!;
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
      print(e.toString());
      showToastError(e.toString());
    }
  }
}
