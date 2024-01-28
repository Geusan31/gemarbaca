import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  @override
  void onInit() {
    super.onInit();
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
    if(jam >= 1 && jam <= 11) {
      return 'Selamat Pagi';
    } else if(jam > 11 && jam <= 15) {
      return 'Selamat Siang';
    } else if(jam > 15 && jam <= 18) {
      return 'Selamat Sore';
    } else {
      return 'Selamat Malam';
    }
  }
}
