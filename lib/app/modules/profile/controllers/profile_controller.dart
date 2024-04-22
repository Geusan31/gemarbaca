import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_book.dart';
import 'package:gemarbaca/app/data/model/response_books_report.dart';
import 'package:gemarbaca/app/data/model/response_detail_profile.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
// import 'package:open_file/open_file.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:permission_handler/permission_handler.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  late String email;
  late String nama;
  var status = Rx<RxStatus>(RxStatus.loading());
  final dataDetailProfile = Rx<DataDetailProfile?>(null);
  String role = '';
  final pdf = pw.Document();
  late RxList<DataBooksReport> dataBookList = RxList<DataBooksReport>();

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    nama = decodedToken['name'];
    email = decodedToken['email'];
    await getDetailProfile();
    await getBukuForReport();
    checkRole();
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

  Future<void> getBukuForReport() async {
    status.value = RxStatus.loading();
    // await Future.delayed(Duration(seconds: 5));
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    print("Decoded Token: ${decodedToken['id']}");
    try {
      var response = await
        ApiProvider.instance().get(EndPoint.bookForReport,
            options: Options(headers: {'Authorization': 'Bearer $token'}));

      final ResponseBooksReport responseBook =
      ResponseBooksReport.fromJson(response.data);

      if (responseBook.data!.isEmpty) {
        print("Empty Book");
        status.value = RxStatus.empty();
      } else {
        print("Response Buku: ${responseBook.data!}");
        dataBookList.value = responseBook.data!;
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

  void checkRole() async {
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    role = decodedToken['role'];
    print("Role: ${decodedToken['role']}");
  }

  Future<Uint8List> generatePDF() async {
    final pdf = pw.Document();
    final fontData =
        await rootBundle.load("assets/fonts/open-sans/OpenSans-Regular.ttf");
    final ttf = pw.Font.ttf(fontData);
    List<pw.Widget> widgets = [];
    final image = (await rootBundle.load('assets/img/logo/logo_utama.png')).buffer.asUint8List();
    final logoArea = pw.Container(
      padding: pw.EdgeInsets.all(10.0),
      height: 100.0,
      child: pw.Image(pw.MemoryImage(image), width: 150, height: 100, fit: pw.BoxFit.cover)
    );

    widgets.add(logoArea);
    widgets.add(table());
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a3,
        build: (pw.Context context) {
          return widgets;
        }
      )
    );
    return pdf.save();
  }

  pw.Table table() {
    List<pw.TableRow> rows=[];
    if(dataBookList.isNotEmpty) {
      for(int i= 0; i < dataBookList.length; i++) {
        rows.add(
            pw.TableRow(
                children:<pw.Widget>[
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text((i+1).toString(), textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(fontSize: 10.0)),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text(dataBookList[i].judul ?? '', textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(fontSize: 10.0)),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text(dataBookList[i].penulis ?? '', textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(fontSize: 10.0)),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text(dataBookList[i].penerbit ?? '', textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(fontSize: 10.0)),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text(dataBookList[i].totalBorrowed.toString() ?? '', textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(fontSize: 10.0)),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text(dataBookList[i].totalCollected.toString() ?? '', textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(fontSize: 10.0)),
                  ),
                  pw.Padding(
                    padding: pw.EdgeInsets.all(10.0),
                    child: pw.Text(dataBookList[i].averageRating.toString() ?? '', textAlign: pw.TextAlign.left,
                        style: pw.TextStyle(fontSize: 10.0)),
                  ),
                ]
            )
        );
      }
    }

    return pw.Table(
      border: pw.TableBorder.all(color: PdfColor.fromHex("#f0f0f0")),
      columnWidths: const <int, pw.TableColumnWidth> {
        0: pw.FixedColumnWidth(50),
        1: pw.FixedColumnWidth(100),
        2: pw.FixedColumnWidth(90),
        6: pw.FixedColumnWidth(90),
        8: pw.FixedColumnWidth(70),
      },
      children: <pw.TableRow>[
        pw.TableRow(
          decoration: pw.BoxDecoration(color:PdfColor.fromHex("#19D670")),
          children: <pw.Widget>[
            pw.Padding(
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Text("No",textAlign: pw.TextAlign.left,style: pw.TextStyle(
                fontSize: 10.0,
                color: PdfColors.white,
                fontWeight:pw.FontWeight.bold
              )),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Text("Judul Buku",textAlign: pw.TextAlign.left,style: pw.TextStyle(
                fontSize: 10.0,
                color: PdfColors.white,
                fontWeight:pw.FontWeight.bold
              )),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Text("Penulis",textAlign: pw.TextAlign.left,style: pw.TextStyle(
                fontSize: 10.0,
                color: PdfColors.white,
                fontWeight:pw.FontWeight.bold
              )),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Text("Penerbit",textAlign: pw.TextAlign.left,style: pw.TextStyle(
                fontSize: 10.0,
                color: PdfColors.white,
                fontWeight:pw.FontWeight.bold
              )),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Text("Jumlah Dipinjam",textAlign: pw.TextAlign.left,style: pw.TextStyle(
                fontSize: 10.0,
                color: PdfColors.white,
                fontWeight:pw.FontWeight.bold
              )),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Text("Jumlah Dikoleksi",textAlign: pw.TextAlign.left,style: pw.TextStyle(
                fontSize: 10.0,
                color: PdfColors.white,
                fontWeight:pw.FontWeight.bold
              )),
            ),
            pw.Padding(
              padding: pw.EdgeInsets.all(10.0),
              child: pw.Text("Rata-rata rating",textAlign: pw.TextAlign.left,style: pw.TextStyle(
                fontSize: 10.0,
                color: PdfColors.white,
                fontWeight:pw.FontWeight.bold
              )),
            ),
          ]
        ),
        ...rows
      ]
    );
  }

  // savePdf(String fileName,Uint8List byteList) async {
  //   try {
  //     PermissionStatus status = await Permission.storage.status;
  //     if (!status.isGranted) {
  //       status = await Permission.storage.request();
  //       if (!status.isGranted) {
  //         return;
  //       }
  //     }
  //     QuickAlert.show(
  //       context: Get.context!,
  //       type: QuickAlertType.confirm,
  //       showCancelBtn: true,
  //       showConfirmBtn: true,
  //       title: "Unduh Laporan",
  //       confirmBtnText: 'Unduh',
  //       onConfirmBtnTap: () async {
  //         Navigator.of(Get.context!, rootNavigator: true).pop('dialog');
  //
  //         Directory documentDirectory =
  //         await getApplicationDocumentsDirectory();
  //         String documentPath = documentDirectory.path;
  //         final filePath = "$documentPath/$fileName.pdf";
  //         File file = File(filePath);
  //         await file.writeAsBytes(byteList);
  //         await OpenFile.open(filePath);
  //
  //         print("Downloading..");
  //       },
  //     );
  //   } catch (e) {
  //     print('Error in download laporan: $e');
  //     log(e.toString());
  //   }
  // }
  savePdf(String fileName, Uint8List byteList) async {
    PermissionStatus status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
      if (!status.isGranted) {
        return;
      }
    }
    final output = await getTemporaryDirectory();
    final filePath = "${output.path}/$fileName.pdf";
    File file = File(filePath);
    await file.writeAsBytes(byteList);
    log('File path: $filePath');
    log('File exists: ${await file.exists()}');
    try {
      await OpenFile.open(filePath);
      log("Berhasil Open File");
    } catch (e) {
      log("Error Open File: ${e.toString()}");
    }
    print("File sudah ada: ${await file.exists() ? 'Sudah' : 'Belum'}");
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
