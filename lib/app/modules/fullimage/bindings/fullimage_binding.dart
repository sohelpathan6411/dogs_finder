import 'package:get/get.dart';

import '../controllers/fullimage_controller.dart';

class FullimageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FullimageController>(
      FullimageController(),
    );
  }
}
