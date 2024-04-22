import 'package:get/get.dart';

import '../controllers/list_book_edit_controller.dart';

class ListBookEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListBookEditController>(
      () => ListBookEditController(),
    );
  }
}
