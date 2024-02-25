import 'package:dio/dio.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_book.dart';
import 'package:gemarbaca/app/data/model/response_populer_book.dart';
import 'package:gemarbaca/app/data/model/response_riwayat.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var dataBookList = RxList<DataBook>();
  var dataRiwayatList = RxList<DataRiwayat>();
  var dataPopulerBookList = RxList<DataPopulerBook>();
  var status = Rx<RxStatus>(RxStatus.loading());
  final rating = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getBuku();
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
    var name = await StorageProvider.read('name');
    print(name);
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

  // Future<void> getBuku() async {
  //   change(null, status: RxStatus.loading());
  //   try {
  //     final response = await ApiProvider.instance().get(EndPoint.book,
  //         options: Options(headers: {
  //           'Authorization': 'Bearer ${StorageProvider.read('token')}'
  //         }));
  //     print(StorageProvider.read('token'));
  //     if (response.statusCode == 200) {
  //       final ResponseBook responseBook = ResponseBook.fromJson(response.data);
  //       if (responseBook.data!.isEmpty) {
  //         change(null, status: RxStatus.empty());
  //       } else {
  //         change(responseBook.data, status: RxStatus.success());
  //       }
  //     } else {
  //       change(null, status: RxStatus.error("Gagal mengambil data"));
  //     }
  //   } on DioException catch (e) {
  //     if (e.response != null) {
  //       if (e.response?.data != null) {
  //         change(null,
  //             status: RxStatus.error("${e.response?.data['message']}"));
  //       }
  //     } else {
  //       change(null, status: RxStatus.error(e.message ?? ""));
  //     }
  //   } catch (e) {
  //     showToastError(e.toString());
  //   }
  // }

  Future<void> getBuku() async {
    status.value = RxStatus.loading();
    print(StorageProvider.read('token'));
    try {
      var responses = await Future.wait([
        ApiProvider.instance().get(EndPoint.book,
            options: Options(headers: {
              'Authorization': 'Bearer ${StorageProvider.read('token')}'
            })),
        ApiProvider.instance().get(EndPoint.riwayat,
            options: Options(headers: {
              'Authorization': 'Bearer ${StorageProvider.read('token')}'
            })),
        ApiProvider.instance().get(EndPoint.populerBook,
            options: Options(headers: {
              'Authorization': 'Bearer ${StorageProvider.read('token')}'
            })),
      ]);
      final ResponseBook responseBook =
          ResponseBook.fromJson(responses[0].data);
      final ResponseRiwayat responseRiwayat =
          ResponseRiwayat.fromJson(responses[1].data);
      final ResponsePopulerBook responsePopulerBook =
          ResponsePopulerBook.fromJson(responses[2].data);

      if (responseBook.data!.isEmpty || responseRiwayat.data!.isEmpty || responsePopulerBook.data!.isEmpty) {
        status.value = RxStatus.empty();
      } else {
        dataBookList.value = responseBook.data!;
        dataRiwayatList.value = responseRiwayat.data!;
        dataPopulerBookList.value = responsePopulerBook.data!;
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
