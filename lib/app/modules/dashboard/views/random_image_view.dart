import 'package:dogs_finder/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/consts/color_consts.dart';
import '../../../../core/consts/img_const.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/widget_utils/asset_image_view.dart';
import '../../../../core/utils/widget_utils/cache_image_view.dart';
import '../../../../core/utils/widget_utils/shimmers.dart';

class RandomImageView extends GetView<DashboardController> {
  const RandomImageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "picked_for_you".tr,
                textAlign: TextAlign.start,
                style: TextStyles.kTSNFS14W700,
              ),
            ),
            controller.randomImageStatus.value == ApiStatus.LOADING
                ? Shimmers().getShimmerItem()
                : controller.randomImage.value.message == null
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AssetImageView(
                              height: Get.size.height / 4,
                              image: loadingImage,
                              colorImg: textColor,
                            ),
                            Text('failed_or_check_internet'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyles.kTSNFS14W300
                                    .copyWith(color: textColor)),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      )
                    : Hero(
                        tag: "${controller.randomImage.value.message} rondom",
                        child: CacheImageView(
                          height: Get.size.height / 2.2,
                          width: Get.size.width,
                          imageUrl: controller.randomImage.value.message!,
                          fitBox: BoxFit.cover,
                          tag: "${controller.randomImage.value.message} rondom",
                        ),
                      ),
          ],
        ));
  }
}
