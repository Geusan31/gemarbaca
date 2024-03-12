import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  late String email;
  late String nama;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    String token = StorageProvider.read(StorageKey.token);
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    nama = decodedToken['name'];
    email = decodedToken['email'];
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
}
