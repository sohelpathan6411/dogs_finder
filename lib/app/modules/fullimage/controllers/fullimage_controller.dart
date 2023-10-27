import 'package:get/get.dart';

class FullimageController extends GetxController {
  Rx<String> imageUrl = ''.obs;
  Rx<String> tag = ''.obs;

  @override
  void onInit() {
    if (Get.arguments != null) {
      imageUrl.value = Get.arguments['imageUrl'];
      tag.value = Get.arguments['tag'];
    }
    super.onInit();
  }
}
