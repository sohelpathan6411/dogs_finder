import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:get/get.dart';

class CustomSnackbars {
  void showErrorSnack({title, message}) {
    Get.snackbar(
      title.toString(),
      message.toString(),
      snackPosition: SnackPosition.TOP,
      backgroundColor: colorRed,
      colorText: snackBarTexColor,
    );
  }
}
