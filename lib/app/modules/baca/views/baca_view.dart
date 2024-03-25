import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/baca_controller.dart';

class BacaView extends GetView<BacaController> {
  const BacaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Obx(() {
          return Text(controller.judul.value ?? '-',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white));
        }),
        actions: [
          IconButton(onPressed: () {
            controller.pdfViewerController.zoomLevel = 1.25;
          }, icon: Icon(CupertinoIcons.zoom_in, color: Colors.white,)),
          IconButton(onPressed: () {
            controller.pdfViewerController.zoomLevel = -1.25;
          }, icon: Icon(CupertinoIcons.zoom_out, color: Colors.white,)),
          IconButton(onPressed: () {
            controller.pdfViewerController.jumpToPage(5);
          }, icon: Icon(CupertinoIcons.arrow_down_circle, color: Colors.white,))
        ],
      ),
      body: Stack(
        children: <Widget>[
          SfPdfViewer.memory(
            controller: controller.pdfViewerController,
            base64.decode(controller.file.value),
            canShowScrollHead: false,
            canShowScrollStatus: false,
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: FloatingActionButton(
              child: Icon(Icons.arrow_forward),
              onPressed: controller.detailBukuController.currentChapterIndex < (controller.detailBukuController.dataDetailBukuList.value?.episode?.length ?? 0) - 1 ? controller.nextChapter : null,
              backgroundColor: controller.detailBukuController.currentChapterIndex < (controller.detailBukuController.dataDetailBukuList.value?.episode?.length ?? 0) - 1 ? Theme.of(context).primaryColor : Colors.grey,
              foregroundColor: controller.detailBukuController.currentChapterIndex < (controller.detailBukuController.dataDetailBukuList.value?.episode?.length ?? 0) - 1 ? Colors.white : Colors.black,
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: 20.0,
            child: FloatingActionButton(
              child: Icon(Icons.arrow_back),
              onPressed: controller.detailBukuController.currentChapterIndex > 0 ? controller.previousChapter : null,
              backgroundColor: controller.detailBukuController.currentChapterIndex > 0 ? Theme.of(context).primaryColor : Colors.grey,
              foregroundColor: controller.detailBukuController.currentChapterIndex > 0 ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
