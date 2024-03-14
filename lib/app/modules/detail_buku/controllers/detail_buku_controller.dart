import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_detail_book.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DetailBukuController extends GetxController {
  //TODO: Implement DetailBukuController
  final dataDetailBukuList = Rx<DataDetailBook?>(null);
  var status = Rx<RxStatus>(RxStatus.loading());
  final TextEditingController messageController = TextEditingController();

  final count = 0.obs;
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
    QuickAlert.show(
      context: Get.context!,
      type: QuickAlertType.custom,
      barrierDismissible: true,
      confirmBtnText: 'Save',
      customAsset: 'assets/custom.gif',
      // widget: TextFormField(
      //   decoration: const InputDecoration(
      //     alignLabelWithHint: true,
      //     hintText: 'Masukkan tanggal pengembalian',
      //     prefixIcon: Icon(
      //       Icons.date_range,
      //     ),
      //   ),
      //   textInputAction: TextInputAction.next,
      //   keyboardType: TextInputType.phone,
      //   onChanged: (value) => messageController.text = value,
      // ),
      widget: SfDateRangePicker(),
      onConfirmBtnTap: () async {
        if (messageController.text.length < 5) {
          await QuickAlert.show(
            context: Get.context!,
            type: QuickAlertType.error,
            text: 'Please input something',
          );
          return;
        }
        Navigator.pop(Get.context!);
        await Future.delayed(const Duration(milliseconds: 1000));
        await QuickAlert.show(
          context: Get.context!,
          type: QuickAlertType.success,
          text:
              "Tanggal Pengembalian '${messageController.text}' sudah disimpan!.",
        );
      },
      title: 'Tanggal Pengembalian',
      text: 'Pilih Tanggal Pengembalian',
    );
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
      showToastError(e.toString());
    }
  }
}
