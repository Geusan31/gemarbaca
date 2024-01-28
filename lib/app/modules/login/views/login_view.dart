import 'package:flutter/material.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Image.asset('assets/img/logo/logo_utama.png',
                        height: 100),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25, bottom: 20),
                  child: Center(
                      child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 15.0),
                        child: const Text("Welcome Back",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w900)),
                      ),
                      Container(
                          margin: const EdgeInsets.only(bottom: 12.0),
                          child: const Text(
                            "Use Credentials to acees your account",
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
                              controller: controller.usernameController,
                              focusNode: controller.usernameFocusNode,
                              onChanged: (value) {
                                controller.usernameIsFocused.value =
                                    controller.usernameFocusNode.hasFocus;
                              },
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
                          })
                        ),
                        const SizedBox(height: 13.0),
                        Container(
                          margin: const EdgeInsets.only(bottom: 5),
                          child: Obx(() {
                            return TextFormField(
                              controller: controller.passwordController,
                              focusNode: controller.passwordFocusNode,
                              onChanged: (value) {
                                controller.passwordIsFocused.value =
                                    controller.passwordFocusNode.hasFocus;
                              },
                              decoration: InputDecoration(
                                  labelText: "Password",
                                  labelStyle: TextStyle(
                                      color: controller.passwordIsFocused.value
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  border: const OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          color: Theme.of(context).primaryColor)),
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
                                      onPressed: controller.toggleObscure)),
                              obscureText: controller.isObscure.value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password tidak boleh kosong!';
                                }
                                return null;
                              },
                            );
                          })
                        ),
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
                            onPressed: () {
                              controller.login();
                            },
                            child: const Text("Login"),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          alignment: Alignment.center,
                          child: Text(
                            '- Or sign in with -',
                            style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor: Colors.white,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                padding:
                                const EdgeInsets.symmetric(vertical: 8.0)),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                    "http://pngimg.com/uploads/google/google_PNG19635.png",
                                    width: 35),
                                const Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 10),
                                    child: Text("Sign With Google"))
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ],
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
            const Text("Apakah anda belum memiliki akun? "),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(Routes.REGISTER);
              },
              child: Text(
                "Register",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
