import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController>  {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
          child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Lottie.asset('assets/splash/splash_screen.json',controller: controller.animationController,
                  fit: BoxFit.cover, onLoaded: (composition) {
                Future.delayed(composition.duration, () async {
                  controller.animationController.duration = composition.duration;
                  controller.animationController.forward().then((_) async {
                    await controller.checkInternetConnection();
                    await controller.initPlatformState();
                    controller.checkStatus();
                  });
                });
              }))),
    );
  }
}
