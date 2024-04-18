import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gemarbaca/app/widget/base64/base64_widget.dart';

import 'package:get/get.dart';
// import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
// import 'package:multi_select_flutter/util/multi_select_item.dart';
// import 'package:multiselect/multiselect.dart';
import 'package:multiselect_dropdown_flutter/multiselect_dropdown_flutter.dart';

import '../controllers/create_book_controller.dart';

class CreateBookView extends GetView<CreateBookController> {
  const CreateBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create Book'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(bottom: 50),
                height: 150,
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
                                  "assets/img/default/person.png",
                                  fit: BoxFit.cover,
                                  width: 100,
                                  height: 100,
                                )
                              : kIsWeb
                                  ? Image.network(
                                      controller.imagePath.value,
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    )
                                  : Image(
                                      image: base64Widget(
                                          controller.imagePath.value),
                                      fit: BoxFit.cover,
                                      width: 100,
                                      height: 100,
                                    )),
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
                                return 'Judul Lengkap tidak boleh kosong!';
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
                          value: controller.valueData.value,
                          onChanged: (v) {
                            controller.valueData.value = v as int;
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
                      child: Obx(() {
                        return MultiSelectDropdown(
                          list: controller.items,
                          initiallySelected:
                              controller.selectedItemsGenre.value,
                          onChange: (selectedList) {
                            controller.selectedItemsGenre.value =
                                List<String>.from(selectedList);
                          },
                        );
                        //     // return MultiSelectDialogField(
                        //     //   items: controller.option
                        //     //       .map((e) => MultiSelectItem(e.id, e.nama))
                        //     //       .toList(),
                        //     //   title: Text("Genre"),
                        //     //   selectedColor: Colors.blue.shade700,
                        //     //   decoration: BoxDecoration(
                        //     //     borderRadius: BorderRadius.all(Radius.circular(5)),
                        //     //     border: Border.all(
                        //     //       color: Colors.grey,
                        //     //       width: 1,
                        //     //     ),
                        //     //   ),
                        //     //   buttonIcon: Icon(
                        //     //     Icons.arrow_drop_down,
                        //     //     color: Colors.black,
                        //     //   ),
                        //     //   buttonText: Text(
                        //     //     "Pilih Genre",
                        //     //     style: TextStyle(
                        //     //       color: Colors.black,
                        //     //     ),
                        //     //   ),
                        //     //   onConfirm: (values) {
                        //     //     controller.selectedItems = values.cast<String>();
                        //     //   },
                        //     // );
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0)),
                          onPressed: () async {},
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
        ));
  }
}
