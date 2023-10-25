import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbars {
  void showSuccessSnack({title, message}) {
    Get.snackbar(title.toString(), message.toString(),
        snackPosition: SnackPosition.TOP, backgroundColor: Colors.green);
  }

  void showErrorSnack({title, message}) {
    Get.snackbar(
      title.toString(),
      message.toString(),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.redAccent,
      colorText: colorWhite,
    );
  }

  void showInfoSnack({title, message}) {
    Get.snackbar(
      title.toString(),
      message.toString(),
      snackPosition: SnackPosition.TOP,
      backgroundColor: primary,
      colorText: colorWhite,
    );
  }
}
