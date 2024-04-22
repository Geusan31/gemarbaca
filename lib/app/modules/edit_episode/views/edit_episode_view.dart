import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_episode_controller.dart';

class EditEpisodeView extends GetView<EditEpisodeController> {
  const EditEpisodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Episode'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Form Episode',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Form(
                  key: controller.formKeyEpisode,
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Obx(() {
                            return TextFormField(
                              controller:
                              controller.namaEpisodeController,
                              focusNode:
                              controller.namaEpisodeFocusNode,
                              decoration: InputDecoration(
                                labelText: "Nama Episode",
                                labelStyle: TextStyle(
                                    color: controller
                                        .namaEpisodeIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .primaryColor)),
                                prefixIcon: Icon(Icons.person_outline,
                                    color: controller
                                        .namaEpisodeIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Nama Episode tidak boleh kosong!';
                                }
                                return null;
                              },
                            );
                          })),
                      const SizedBox(height: 13.0),
                      Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Obx(() {
                            return TextFormField(
                              controller:
                              controller.filePickNameController,
                              readOnly: true,
                              onTap: () {
                                controller.getFile();
                              },
                              decoration: InputDecoration(
                                hintText: controller.originalFilePath.value == '' ? 'Tidak ada file' : 'Ada Filenya',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .primaryColor)),
                                prefixIcon: Icon(Icons.person,
                                    color: Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'File tidak boleh kosong!';
                                }
                                return null;
                              },
                            );
                          })),
                      const SizedBox(height: 13.0),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                Theme.of(context).primaryColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0)),
                            onPressed: () {
                              controller.updateFile();
                            },
                            child: Obx(() {
                              return controller.fileLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text("Submit");
                            })),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
