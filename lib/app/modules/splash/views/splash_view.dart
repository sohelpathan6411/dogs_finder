import 'package:dogs_finder/core/consts/img_const.dart';
import 'package:dogs_finder/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/utils/widget_utils/asset_image_view.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AssetImageView(
            height: Get.size.width / 2,
            image: loadingImage,
          ),
          const Text(
            "Hi, I'm Loopy\n. . .",
            textAlign: TextAlign.center,
            style: TextStyles.kTSNFS26W600,
          )
        ],
      )),
    );
  }
}
