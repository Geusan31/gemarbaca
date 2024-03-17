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
          return Text(controller.judul.value,style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white));
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
      body: SfPdfViewer.memory(
        controller: controller.pdfViewerController,
        base64.decode(controller.file.value),
        canShowScrollHead: false,
        canShowScrollStatus: false,
      ),
    );
  }
}
