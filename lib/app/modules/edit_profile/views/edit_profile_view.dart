import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: Center(child: CircleAvatar())),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: Obx(() {
                        return TextFormField(
                          controller: controller.nameController,
                          focusNode: controller.nameFocusNode,
                          decoration: InputDecoration(
                            labelText: "Nama Lengkap",
                            labelStyle: TextStyle(
                                color: controller.nameIsFocused.value
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
                                color: controller.nameIsFocused.value
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Nama Lengkap tidak boleh kosong!';
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
                          controller: controller.usernameController,
                          focusNode: controller.usernameFocusNode,
                          decoration: InputDecoration(
                            labelText: "Username",
                            labelStyle: TextStyle(
                                color: controller.usernameIsFocused.value
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
                                color: controller.usernameIsFocused.value
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Username tidak boleh kosong!';
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
                          controller: controller.bioController,
                          focusNode: controller.bioFocusNode,
                          decoration: InputDecoration(
                            labelText: "Bio",
                            labelStyle: TextStyle(
                                color: controller.bioIsFocused.value
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
                                color: controller.bioIsFocused.value
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Bio tidak boleh kosong!';
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
                          controller: controller.alamatController,
                          focusNode: controller.alamatFocusNode,
                          decoration: InputDecoration(
                            labelText: "Alamat",
                            labelStyle: TextStyle(
                                color: controller.alamatIsFocused.value
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
                                color: controller.alamatIsFocused.value
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Alamat tidak boleh kosong!';
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
                          controller: controller.jenisKelaminController,
                          focusNode: controller.jenisKelaminFocusNode,
                          decoration: InputDecoration(
                            labelText: "Jenis Kelamin",
                            labelStyle: TextStyle(
                                color: controller.jenisKelaminIsFocused.value
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
                                color: controller.jenisKelaminIsFocused.value
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey),
                          ),
                        );
                      })),
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
                        onPressed: () async {
                          controller.editProfile();
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
        ));
  }
}
