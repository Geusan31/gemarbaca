import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_detail_book.dart';
import 'package:gemarbaca/app/data/model/response_koleksiPribadi.dart';
import 'package:gemarbaca/app/data/model/response_peminjaman.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/modules/koleksi/controllers/koleksi_controller.dart';
import 'package:gemarbaca/app/modules/layout/controllers/layout_controller.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class DetailBukuController extends GetxController {
  KoleksiController koleksiController =
      Get.put(KoleksiController(), permanent: true);
  LayoutController layoutController =
      Get.put(LayoutController(), permanent: true);
  //TODO: Implement DetailBukuController
  int currentChapterIndex = 0;
  final dataDetailBukuList = Rx<DataDetailBook?>(null);
  var status = Rx<RxStatus>(RxStatus.loading());
  final TextEditingController dateController = TextEditingController();
  final count = 0.obs;
  var statusPeminjaman = RxBool(false);
  @override
  void onInit() async {
    super.onInit();
    await getDetailBook().then((_) {
      print(
          "Data Detail Buku List: ${dataDetailBukuList.value?.ulasan?.isEmpty}");
    });
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

  void alertShow() {
    if (Get.context != null) {
      QuickAlert.show(
        context: Get.context!,
        type: QuickAlertType.custom,
        barrierDismissible: true,
        confirmBtnText: 'Save',
        customAsset: 'assets/gif/calendar.gif',
        widget: TextField(
          controller: dateController,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              labelText: 'Date',
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(
                Icons.date_range,
              ),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue))),
          readOnly: true,
          onTap: selectedDate,
        ),
        onConfirmBtnTap: () async {
          if (dateController.text.length < 5) {
            if (Get.context != null) {
              await QuickAlert.show(
                context: Get.context!,
                type: QuickAlertType.error,
                text: 'Mohon untuk pilih tanggal pengembalian',
              );
            }
            return;
          }
          if (Get.context != null) {
            Navigator.pop(Get.context!);
            await QuickAlert.show(
              context: Get.context!,
              type: QuickAlertType.success,
              text:
                  "Tanggal Pengembalian '${dateController.text}' sudah disimpan!.",
            );
            await pinjam();
          }
        },
        text: 'Pilih Tanggal Pengembalian',
      );
    }
  }

  Future<void> selectedDate() async {
    if (Get.context != null) {
      DateTime? picked = await showDatePicker(
          context: Get.context!,
          firstDate: DateTime.now().add(Duration(days: 1)),
          initialDate: DateTime.now().add(Duration(days: 1)),
          lastDate: DateTime.now().add(Duration(days: 30)));
      if (picked != null) {
        dateController.text = picked.toString().split(" ")[0];
      }
    }
  }

  pinjam() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    DateTime dueDate = DateTime.parse(dateController.text);
    // print("Tanggal $dueDate");
    // DateTime dueDate = DateTime.now().add(Duration(minutes: 1));
    print("Tanggal $dueDate");
    var idBuku = Get.parameters['id'];
    print("Decoded Token Id User: ${decodedToken['id']}");
    print("Decoded Token Id Buku: $idBuku");
    print("Tanggal: ${dateController.text.toString()}");
    try {
      if (Get.context != null && idBuku != null) {
        FocusScope.of(Get.context!).unfocus();
        final response = await ApiProvider.instance().post(EndPoint.pinjam,
            options: Options(headers: {'Authorization': 'Bearer $token'}),
            data: {
              "userId": decodedToken['id'].toString(),
              "bukuId": idBuku.toString(),
              "tanggalPengembalian": dateController.text.toString(),
            });
        if (response.statusCode == 200) {
          status.value = RxStatus.success();
          ResponsePeminjaman responsePeminjaman =
              ResponsePeminjaman.fromJson(response.data);
          var peminjamanID = responsePeminjaman.data!.peminjaman!.peminjamanID;
          var judulBuku = responsePeminjaman.data!.peminjaman!.buku?.judul;
          if (peminjamanID != null && judulBuku != null) {
            koleksiController.startTimer(dueDate, peminjamanID, judulBuku);
          } else {
            print("Error: peminjamanID or  bookTitle is null");
          }
          layoutController.onTap(2);
        } else {
          showToastError("Pinjam buku Gagal");
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.data != null) {
          log("Response message error: ${e.response!.data['message']}");
          status.value = RxStatus.error("${e.response?.data['message']}");
          showToastError(e.response!.data['message']);
        } else {
          log("Response error: ${e.message ?? ""}");
          status.value = RxStatus.error(e.message ?? "");
          showToastError(e.message.toString());
        }
      }
    } catch (e) {
      log("Response error Catch: ${e.toString()}");
      showToastError(e.toString());
    }
  }

  koleksi() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var idBuku = Get.parameters['id'];
    print("Decoded Token Id User: ${decodedToken['id']}");
    print("ID Buku: $idBuku");
    print("Tanggal: ${dateController.text.toString()}");
    try {
      if (Get.context != null && idBuku != null) {
        FocusScope.of(Get.context!).unfocus();
        final response = await ApiProvider.instance().post(EndPoint.koleksi,
            options: Options(headers: {'Authorization': 'Bearer $token'}),
            data: {
              "userId": decodedToken['id'].toString(),
              "bukuId": idBuku.toString()
            });
        if (response.statusCode == 200) {
          status.value = RxStatus.success();
          ResponseKoleksiPribadi responseKoleksiPribadi =
              ResponseKoleksiPribadi.fromJson(response.data);
          var peminjamanID = responseKoleksiPribadi.data!.koleksiID;
          var judulBuku = responseKoleksiPribadi.data!.buku?.judul;
          if (peminjamanID != null && judulBuku != null) {
            showToastSuccess(response.data['message']);
          } else {
            print("Error: koleksiID or bookTitle is null");
          }
          layoutController.onTap(2);
        } else {
          showToastError("Pinjam buku Gagal");
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.data != null) {
          log("Response message error: ${e.response!.data['message']}");
          status.value = RxStatus.error("${e.response?.data['message']}");
          showToastInfo(e.response!.data['message']);
        } else {
          log("Response error: ${e.message ?? ""}");
          status.value = RxStatus.error(e.message ?? "");
          showToastError(e.message.toString());
        }
      }
    } catch (e) {
      log("Response error Catch: ${e.toString()}");
      showToastError(e.toString());
    }
  }

  Future<void> getDetailBook() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    var idBuku = Get.parameters['id'];
    // var idBuku = 5;
    try {
      var response = await ApiProvider.instance().get(
          "${EndPoint.book}/$idBuku",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseDetailBook responseDetailBook =
          ResponseDetailBook.fromJson(response.data!);

      if (responseDetailBook.data == null) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        if (responseDetailBook.data!.status == 'diPinjamkan') {
          statusPeminjaman.value = true;
          print("Status Peminjaman: ${responseDetailBook.data!.status}");
        }
        print("Response Genre: ${responseDetailBook.data!}");
        dataDetailBukuList.value = responseDetailBook.data!;
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
