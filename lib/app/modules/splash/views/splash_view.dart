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
    return const Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: AssetImageView(
              image: loadingImage,
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi, I'm Loopy",
                  textAlign: TextAlign.start,
                  style: TextStyles.kTSNFS26W600,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Let's find a dog For You . . .",
                  textAlign: TextAlign.start,
                  style: TextStyles.kTSNFS22W400,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
