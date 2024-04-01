import 'package:dio/dio.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/model/response_detail_profile.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/widget/toast/toast.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  late String email;
  late String nama;
  var status = Rx<RxStatus>(RxStatus.loading());
  final dataDetailProfile = Rx<DataDetailProfile?>(null);

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    nama = decodedToken['name'];
    email = decodedToken['email'];
    await getDetailProfile();
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

  Future<void> getDetailProfile() async {
    status.value = RxStatus.loading();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    var id = decodedToken['id'];
    // var idBuku = 5;
    try {
      var response = await ApiProvider.instance().get(
          "${EndPoint.book}/$id",
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
