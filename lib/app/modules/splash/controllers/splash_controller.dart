import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gemarbaca/app/data/constant/endpoint.dart';
import 'package:gemarbaca/app/data/provider/api_provider.dart';
import 'package:gemarbaca/app/data/provider/storage_provider.dart';
import 'package:gemarbaca/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashController extends GetxController with SingleGetTickerProviderMixin {
  //TODO: Implement SplashController
  late final AnimationController animationController;

  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(vsync: this);
    log("onInit Splash");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    animationController.dispose();
  }

  void increment() => count.value++;
  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};

    try {
      if (kIsWeb) {
        deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if(Platform.isAndroid) {
          deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
          _deviceData = deviceData;
          await checkAndroidPermission();
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic> {'Error': 'Failed to get platform version.'};
    }

  }

  Future<void> checkAndroidPermission() async {
    if(int.parse(_deviceData['version.release']) <= 13) {
      if(await Permission.mediaLibrary.isDenied) {
        await permissionHandler(Permission.mediaLibrary, "Media Library is denied");
      } else if(await Permission.camera.isDenied) {
        await permissionHandler(Permission.camera, "Camera is denied");
      }

    } else {
      if(await Permission.storage.isDenied) {
        await permissionHandler(Permission.storage, "Storage is denied");
      } else if(await Permission.camera.isDenied) {
        await permissionHandler(Permission.camera, "Camera is denied");
      }
    }
  }

  Future<void> permissionHandler(Permission permission, String message) async {
    if(await permission.request().isGranted) {

    } else {
      log(message);
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'systemFeatures': build.systemFeatures,
      'displaySizeInches':
      ((build.displayMetrics.sizeInches * 10).roundToDouble() / 10),
      'displayWidthPixels': build.displayMetrics.widthPx,
      'displayWidthInches': build.displayMetrics.widthInches,
      'displayHeightPixels': build.displayMetrics.heightPx,
      'displayHeightInches': build.displayMetrics.heightInches,
      'displayXDpi': build.displayMetrics.xDpi,
      'displayYDpi': build.displayMetrics.yDpi,
      'serialNumber': build.serialNumber,
    };
  }

  Map<String, dynamic> _readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  Future<void> checkInternetConnection() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      log("Connect Mobile Data");
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      log("Connect Wifi");
    } else if (connectivityResult == ConnectivityResult.ethernet) {
      // I am connected to a ethernet network.
      log("Connect Ethernet");
    } else if (connectivityResult == ConnectivityResult.none) {
      // I am not connected to any network.
      log("No Connection");
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  void checkStatus() async {
    StorageProvider.initialize();
    String onboarding = StorageProvider.read(StorageKey.onboarding);
    String status = StorageProvider.read(StorageKey.status);
    String token = StorageProvider.read(StorageKey.token);

    if(onboarding == 'onboarding') {
      log("Seen to Onbarding: $onboarding");
      await StorageProvider.write(StorageKey.onboarding, 'true');
      log("Sudah Onboarding $onboarding");
      return Get.offAllNamed(Routes.ONBOARDING);
    } else if(onboarding == 'true') {
      if(status == 'logged') {
        try {
          final response = await ApiProvider.instance().get(EndPoint.validate, options:
            Options(headers: {'Authorization': 'Bearer $token'})
          );
          if(response.statusCode == 200) {
            return Get.offAllNamed(Routes.HOME);
          } else {
            return Get.offAllNamed(Routes.LOGIN);
          }
        } catch(e) {
          log(e.toString());
          if (e is DioError) {
            log("DioError occurred: ${e.message}");
            log("DioError request info: ${e.requestOptions.path}");
            log("DioError response info: ${e.response?.statusCode} ${e.response?.statusMessage}");
          }
          return Get.offAllNamed(Routes.LOGIN);
        }
      } else {
        return Get.offAllNamed(Routes.LOGIN);
      }
    } else {
      log("Seen to Login: $onboarding");
      return Get.offAllNamed(Routes.LOGIN);
    }
  }
}
