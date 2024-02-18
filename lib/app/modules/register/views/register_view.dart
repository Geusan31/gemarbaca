import 'package:flutter/material.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset('assets/img/logo/logo_utama.png',
                        height: 100),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25, bottom: 20),
                    child: Center(
                        child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 15.0),
                          child: const Text("Create an Account",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w900)),
                        ),
                        Container(
                            margin: const EdgeInsets.only(bottom: 12.0),
                            child: const Text(
                              "Please fill this detail to create an account",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey),
                            ))
                      ],
                    )),
                  ),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  prefixIcon: Icon(Icons.person_outline,
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
                                controller: controller.emailController,
                                focusNode: controller.emailFocusNode,
                                decoration: InputDecoration(
                                  labelText: "Email",
                                  labelStyle: TextStyle(
                                      color: controller.emailIsFocused.value
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
                                          color:
                                              Theme.of(context).primaryColor)),
                                  prefixIcon: Icon(Icons.email_outlined,
                                      color: controller.emailIsFocused.value
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email tidak boleh kosong!';
                                  } else if (!RegExp(
                                          r'^[a-zA-Z0-9.a-zA-Z0-9-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                                      .hasMatch(value)) {
                                    return 'Masukkan email yang valid';
                                  }
                                  return null;
                                },
                              );
                            })
                        ),const SizedBox(height: 13.0),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  prefixIcon: Icon(Icons.location_on_outlined,
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
                            })
                        ),
                        const SizedBox(height: 13.0),
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: Obx(() {
                              return TextFormField(
                                controller: controller.passwordController,
                                focusNode: controller.passwordFocusNode,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color: controller.passwordIsFocused.value
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: controller.passwordIsFocused.value
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        controller.isObscure.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color:
                                            controller.passwordIsFocused.value
                                                ? Theme.of(context).primaryColor
                                                : Colors.grey),
                                    onPressed: controller.toggleObscure,
                                  ),
                                ),
                                obscureText: controller.isObscure.value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password tidak boleh kosong!';
                                  }
                                  return null;
                                },
                              );
                            })),
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
                                    const EdgeInsets.symmetric(vertical: 10.0)),
                            onPressed: () async {
                              controller.register();
                            },
                            child: const Text("Register"),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.white,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Apakah anda sudah memiliki akun? "),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              child: Text(
                "Login",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
