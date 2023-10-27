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
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Hi, I'm Loopy",
              textAlign: TextAlign.start,
              style: TextStyles.kTSNFS24W600.copyWith(color: titleColor),
            ),
            AssetImageView(
              image: loadingImage,
              width: Get.size.width / 2,
              colorImg: primary,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Let's find a dog For You . . .",
              textAlign: TextAlign.center,
              style: TextStyles.kTSNFS18W400.copyWith(color: textColor),
            )
          ],
        ),
      )),
    );
  }
}
