import 'package:get/get.dart';

import '../controllers/baca_controller.dart';

class BacaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BacaController>(
      () => BacaController(),
    );
  }
}
