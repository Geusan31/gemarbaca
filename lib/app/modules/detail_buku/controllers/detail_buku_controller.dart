import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
  late RxList<Peminjaman> dataPeminjamanList = RxList<Peminjaman>();
  final status = Rx<RxStatus>(RxStatus.loading());
  final TextEditingController dateController = TextEditingController();
  final count = 0.obs;
  var statusPeminjaman = RxBool(false);
  final rating = 1.0.obs;
  final loading = false.obs;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController ulasanController = TextEditingController();
  final FocusNode ulasanFocusNode = FocusNode();
  final ulasanIsFocused = false.obs;
  @override
  void onInit() async {
    super.onInit();
    await getDetailBook();
    ulasanController.addListener(() {
      ulasanIsFocused.value = ulasanFocusNode.hasFocus;
    });
    // await getPeminjaman();
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

  // void validasi(int idUserP, idBukuP) async {
  //   String token = StorageProvider.read(StorageKey.token);
  //   final idBuku = Get.parameters['id'];
  //   Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
  //   print("Decoded Token Id User: ${decodedToken['id']}");
  //   final idUser = decodedToken['id'];
  //
  //   if (idUser == idUserP && idBuku == idBukuP) {
  //     print('Status Peminjaman BERHASIL: ${statusPeminjaman.value}');
  //     statusPeminjaman.value = true;
  //   } else {
  //     print('Status Peminjaman GAGAL: ${statusPeminjaman.value}');
  //     statusPeminjaman.value = false;
  //   }
  // }

  Future<void> getDetailBook() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var idBuku = Get.parameters['id'];
    var idUser = decodedToken['id'];
    // var idBuku = 5;
    try {
      var response = await ApiProvider.instance().get(
          "${EndPoint.book}/$idBuku",
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseDetailBook responseDetailBook =
          ResponseDetailBook.fromJson(response.data!);

      if (responseDetailBook.data == null) {
        log("Empty Book");
        status.value = RxStatus.empty();
      } else {
        if(responseDetailBook.data!.status == 'diPinjamkan') {
          statusPeminjaman.value = true;
          print("Status Peminjaman: ${responseDetailBook.data!.status}");
        }
        log("Rating:  ${responseDetailBook.data!.ulasan?[0].rating}");
        // validasi(idUser, responseDetailBook.data!.bukuID);
        log("Response Genre: ${responseDetailBook.data!}");
        dataDetailBukuList.value = responseDetailBook.data!;
        status.value = RxStatus.success();
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          log("Error Data Detail Buku: ${e.response?.data['message']}");
          status.value = RxStatus.error("${e.response?.data['message']}");
        }
      } else {
        log("Error Detail Buku: ${e.message ?? " "}");
        status.value = RxStatus.error(e.message ?? "");
      }
    } catch (e) {
      log("Catch Error Detail Buku: ${e.toString()}");
      showToastError(e.toString());
    }
  }

  Future<void> getPeminjaman() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    final idBuku = int.tryParse(Get.parameters['id'] ?? ''); // Parse to int here
    log("ID Buku: $idBuku");
    final idUser = int.tryParse(decodedToken['id']); // Parse to int here
    if (idUser == null) {
      log("Error: decodedToken['id'] cannot be parsed into an integer");
      return;
    }
    log("ID User: $idUser");

    try {
      log("Masuk");
      var response = await ApiProvider.instance().get(EndPoint.peminjaman,
          options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponsePeminjaman responsePeminjaman =
      ResponsePeminjaman.fromJson(response.data!);

      if (responsePeminjaman.data == null) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Genre: ${responsePeminjaman.data!}");
        dataPeminjamanList.value =
        responsePeminjaman.data?.peminjaman! as List<Peminjaman>;
        status.value = RxStatus.success();
      }

      for (var data in dataPeminjamanList) {
        log("ID Buku Pinjam: ${data.bukuID}");
        log("ID User Pinjam: ${data.userID}");
        log("ID Buku Kondisi Pinjam: ${data.bukuID == idBuku}");
        log("ID User Kondisi Pinjam: ${data.userID == idUser}");
        if (idBuku != null && data.bukuID == idBuku) {
          if (data.userID == idUser && data.statusPeminjaman == "dipinjam") {
            log("Buku sudah dipinjam oleh pengguna ini");
            statusPeminjaman.value = true;
            break;
          } else if (data.userID != idUser &&
              data.statusPeminjaman == "dipinjam") {
            log("Buku sudah dipinjam oleh pengguna lain");
            statusPeminjaman.value = false;
            break;
          }
        }
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          log("Error Data Peminjaman: ${e.response?.data['message']}");
          status.value = RxStatus.error("${e.response?.data['message']}");
        }
      } else {
        log("Error Peminjaman: ${e.message ?? ""}");
        status.value = RxStatus.error(e.message ?? "");
      }
    } catch (e) {
      log("Catch Error Peminjaman: ${e.toString()}");
      showToastError(e.toString());
    }
  }

  sendRating() async {
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var idBuku = Get.parameters['id'];
    var idUser = decodedToken['id'];
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState!.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(EndPoint.ulasan,
            options: Options(headers: {"Authorization": "Bearer $token"}),
            data: {
              "rating": rating.value,
              "ulasan": ulasanController.text.toString(),
              "bukuId": idBuku.toString(),
              "userId": idUser.toString(),
            });
        log("MASUK");
        if (response.statusCode == 200) {
          await getDetailBook();
          update();
          showToastSuccess(response.data['message']);
        } else {
          showToastError("Gagal Membuat Ulasan");
        }
      }
    } on DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response!.data != null) {
          log(e.response!.data['message']);
          showToastError(e.response!.data['message']);
        } else {
          log(e.message ?? '');
          showToastError(e.message ?? "");
        }
      }
    } catch (e) {
      log(e.toString());
      showToastError(e.toString());
    } finally {
      loading(false);
    }
  }

  showRating() {
    return showDialog(
        context: Get.context!,
        builder: (context) => AlertDialog(
              title: Text("Nilai buku ini",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Silahkan tinggalkan nilai untuk buku ini.',
                      style: TextStyle(fontSize: 20)),
                  SizedBox(
                    height: 32,
                  ),
                  buildRating(),
                  SizedBox(
                    height: 32,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: TextFormField(
                              controller: ulasanController,
                              focusNode: ulasanFocusNode,
                              decoration: InputDecoration(
                                labelText: "Judul Buku",
                                labelStyle: TextStyle(
                                    color: ulasanIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                prefixIcon: Icon(Icons.person_outline,
                                    color: ulasanIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Ulasan tidak boleh kosong!';
                                }
                                return null;
                              },
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      sendRating();
                      Navigator.pop(Get.context!);
                    },
                    child: Text("OK", style: TextStyle(fontSize: 20)))
              ],
            ));
  }

  Widget buildRating() {
    return RatingBar.builder(
      minRating: 1,
      itemCount: 5,
      itemSize: 46,
      initialRating: rating.value.toDouble(),
      itemPadding: EdgeInsets.symmetric(horizontal: 3),
      itemBuilder: (context, _) {
        return Icon(Icons.star, color: Colors.yellow);
      },
      updateOnDrag: true,
      onRatingUpdate: (rating) {
        print('Rating is updated to: $rating of type ${rating.runtimeType}');
        updateRating(rating);
      },
    );
  }

  updateRating(rating) {
    print('Rating before rounding: $rating of type ${rating.runtimeType}');
    this.rating.value = rating;
    print('Updated rating value: ${this.rating.value} of type ${this.rating.value.runtimeType}');
  }
}
