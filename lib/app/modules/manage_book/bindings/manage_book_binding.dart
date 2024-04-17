import 'package:get/get.dart';

import '../controllers/manage_book_controller.dart';

class ManageBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManageBookController>(
      () => ManageBookController(),
    );
  }
}
