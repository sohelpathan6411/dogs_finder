import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:get/get.dart';

class CustomSnackbars {
  void showSuccessSnack({title, message}) {
    Get.snackbar(title.toString(), message.toString(),
        snackPosition: SnackPosition.TOP, backgroundColor: colorGreen);
  }

  void showErrorSnack({title, message}) {
    Get.snackbar(
      title.toString(),
      message.toString(),
      snackPosition: SnackPosition.TOP,
      backgroundColor: colorRed,
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
