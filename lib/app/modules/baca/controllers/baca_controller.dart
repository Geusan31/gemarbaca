import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BacaController extends GetxController {
  //TODO: Implement BacaController
  late PdfViewerController pdfViewerController;
  var file = (Get.parameters['file'] ?? '').obs;
  var judul = (Get.parameters['judul'] ?? '').obs;

  final count = 0.obs;
  @override
  void onInit() {
    pdfViewerController = PdfViewerController();
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

  void increment() => count.value++;

  Future<void> getFilePdf() async {

  }
}
