import 'package:gemarbaca/app/modules/detail_buku/controllers/detail_buku_controller.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BacaController extends GetxController {
  //TODO: Implement BacaController
  DetailBukuController detailBukuController = Get.put(DetailBukuController(), permanent: true);
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

  void nextChapter() {
    if (detailBukuController.currentChapterIndex < (detailBukuController.dataDetailBukuList.value?.episode?.length ?? 0) - 1) {
      detailBukuController.currentChapterIndex++;
      Get.toNamed(Routes.BACA, parameters: {
        'judul': detailBukuController.dataDetailBukuList.value?.judul?.toString() ?? '-',
        'file': detailBukuController.dataDetailBukuList.value?.episode?[detailBukuController.currentChapterIndex].file
      });
    }
  }

  void previousChapter() {
    if (detailBukuController.currentChapterIndex > 0) {
      detailBukuController.currentChapterIndex--;
      Get.toNamed(Routes.BACA, parameters: {
        'judul': detailBukuController.dataDetailBukuList.value?.judul?.toString() ?? '-',
        'file': detailBukuController.dataDetailBukuList.value?.episode?[detailBukuController.currentChapterIndex].file
      });
    }
  }

}
