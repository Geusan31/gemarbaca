import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';

import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../controllers/edit_book_controller.dart';

class EditBookView extends GetView<EditBookController> {
  const EditBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Edit Buku'),
            centerTitle: true,
            bottom: TabBar(
              controller: controller.tabController,
              tabs: const [Tab(text: "Buku"), Tab(text: "Episode")],
            )),
        body: TabBarView(controller: controller.tabController, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  height: 200,
                  width: 150,
                  child: Obx(
                    () => InkWell(
                      onTap: () {
                        controller.getImage();
                      },
                      child: ClipRect(
                        child: Container(
                          color: Colors.grey,
                          child: controller.imagePath.value == ''
                              ? Image.asset(
                                  "assets/img/default/default_image.png",
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 200,
                                )
                              : kIsWeb
                                  ? Image.network(
                                      controller.imagePath.value,
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 200,
                                    )
                                  : controller.imagePath.value
                                          .contains('/data/user/0/')
                                      ? Image.file(
                                          File(controller.imagePath.value),
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 200,
                                        )
                                      : Image.memory(
                                          base64Decode(
                                              controller.imagePath.value),
                                          fit: BoxFit.cover,
                                          width: 100,
                                          height: 200,
                                        ),
                        ),
                      ),
                    ),
                  ),
                ),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Obx(() {
                            return TextFormField(
                              controller: controller.judulController,
                              focusNode: controller.judulFocusNode,
                              decoration: InputDecoration(
                                labelText: "Judul Buku",
                                labelStyle: TextStyle(
                                    color: controller.judulIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                prefixIcon: Icon(Icons.person_outline,
                                    color: controller.judulIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Judul tidak boleh kosong!';
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
                              controller: controller.penulisController,
                              focusNode: controller.penulisFocusNode,
                              decoration: InputDecoration(
                                labelText: "Penulis",
                                labelStyle: TextStyle(
                                    color: controller.penulisIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                prefixIcon: Icon(Icons.person,
                                    color: controller.penulisIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Penulis tidak boleh kosong!';
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
                              controller: controller.penerbitController,
                              focusNode: controller.penerbitFocusNode,
                              decoration: InputDecoration(
                                labelText: "Penerbit",
                                labelStyle: TextStyle(
                                    color: controller.penerbitIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                prefixIcon: Icon(Icons.notes,
                                    color: controller.penerbitIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Penerbit tidak boleh kosong!';
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
                              controller: controller.deskripsiController,
                              focusNode: controller.deskripsiFocusNode,
                              decoration: InputDecoration(
                                labelText: "Deskripsi",
                                labelStyle: TextStyle(
                                    color: controller.deskripsiIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                prefixIcon: Icon(Icons.location_on_outlined,
                                    color: controller.deskripsiIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Deskripsi tidak boleh kosong!';
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
                              controller: controller.tahunTerbitController,
                              focusNode: controller.tahunTerbitFocusNode,
                              decoration: InputDecoration(
                                labelText: "Tanggal Terbit",
                                labelStyle: TextStyle(
                                    color: controller.tahunTerbitIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        color: Theme.of(context).primaryColor)),
                                prefixIcon: Icon(Icons.date_range,
                                    color: controller.tahunTerbitIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey),
                              ),
                            );
                          })),
                      const SizedBox(height: 13.0),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: Obx(() {
                          return DropdownButtonFormField(
                            style: TextStyle(color: Colors.black),
                            value: controller.valueData.isEmpty
                                ? null
                                : controller.valueData[0],
                            onChanged: (v) {
                              print(controller.valueData);
                              controller.valueData.clear();
                              controller.valueData.add(v);
                            },
                            items: controller.data.map((e) {
                              return DropdownMenuItem(
                                value: e.kategoriID,
                                child: Text(e.namaKategori),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              labelText: "Kategori",
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.blue.shade700,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 13.0),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        child: GetBuilder<EditBookController>(
                            init: EditBookController(),
                            builder: (controller) {
                              return MultiSelectDialogField(
                                // initialValue: controller.selectedItemsGenre,
                                items: controller.items
                                    .map((e) => MultiSelectItem(e.id, e.nama))
                                    .toList(),
                                listType: MultiSelectListType.CHIP,
                                onConfirm: (values) {
                                  print(values);
                                  controller.selectedItemsGenre = values;
                                  // controller.selectedItemsGenre.add(values);
                                  print(controller.selectedItemsGenre);
                                },
                              );
                            }),
                      ),
                      const SizedBox(height: 13.0),
                      const SizedBox(height: 16.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Theme.of(context).primaryColor,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0)),
                            onPressed: () {
                              controller.editBook();
                            },
                            child: Obx(() {
                              return controller.loading.value
                                  ? const CircularProgressIndicator()
                                  : const Text("Submit");
                            })),
                      )
                    ],
                  ),
                ),
              ]),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RefreshIndicator(
                      onRefresh: () async {
                        await controller.getDetailBuku();
                      },
                      child: Obx(() {
                        return controller.fileLoading.value
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: const Center(
                                    child: CircularProgressIndicator()))
                            : SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height * 0.4,
                                child: ListView.separated(
                                    itemBuilder: (context, index) {
                                      return Container(
                                        color: Colors.black12,
                                        child: ListTile(
                                          title: Text(
                                              controller.dataFile[index].judul!),
                                          trailing: SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width *
                                                    0.35,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                    style: const ButtonStyle(
                                                        padding:
                                                            MaterialStatePropertyAll(
                                                                EdgeInsets.all(1))),
                                                    onPressed: () {

                                                        Get.toNamed(Routes.EDIT_EPISODE, parameters: {
                                                          'id': controller.dataFile[index].id.toString(),
                                                          'idBuku': controller.idBuku.toString()
                                                        });
                                                    },
                                                    child: const Icon(Icons.edit)),
                                                ElevatedButton(
                                                    style: const ButtonStyle(
                                                        padding:
                                                            MaterialStatePropertyAll(
                                                                EdgeInsets.all(1))),
                                                    onPressed: () {
                                                      controller.deleteFile(
                                                          controller
                                                              .dataFile[index].id!);
                                                    },
                                                    child: const Icon(Icons.delete))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) {
                                      return const Divider();
                                    },
                                    itemCount: controller.dataFile.length),
                              );
                      }),
                    ),
                    Column(
                      children: [
                        const Text('Form Episode',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.symmetric(
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
                                    child: TextFormField(
                                      controller:
                                      controller.filePickNameController,
                                      readOnly: true,
                                      onTap: () {
                                        controller.getFile();
                                      },
                                      decoration: InputDecoration(
                                        hintText: 'Tidak ada file',
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
                                    )),
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
                                      onPressed: () async {
                                        await controller.sendFile();
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
                  ]),
            ),
          )
        ]));
  }
}
