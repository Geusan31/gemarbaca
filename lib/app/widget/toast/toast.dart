import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showToastError(String text) => showTopSnackBar(
  Overlay.of(Get.overlayContext!),
  CustomSnackBar.error(
    message: text,
  ),
);

void showToastSuccess(String text) => showTopSnackBar(
  Overlay.of(Get.overlayContext!),
  CustomSnackBar.success(
    message: text,
  ),
);

void showToastInfo(String text) => showTopSnackBar(
  Overlay.of(Get.overlayContext!),
  CustomSnackBar.info(
    message: text,
  ),
);