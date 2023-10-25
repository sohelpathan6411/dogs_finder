import 'package:dogs_finder/core/consts/color_consts.dart';
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
        children: [
          AssetImageView(
            width: Get.size.width / 1.6,
            image: loadingImage,
          ),
          Text(
            "Hi, Welcome!",
            textAlign: TextAlign.center,
            style: TextStyles.kTSNFS26W600.copyWith(color: primary),
          )
        ],
      )),
    );
  }
}
