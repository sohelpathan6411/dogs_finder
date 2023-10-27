import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/themes/text_styles.dart';
import '../controllers/dashboard_controller.dart';
import 'breed/breed_list_view.dart';
import 'images_list_view.dart';
import 'random_image_view.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
      color: primary,
      onRefresh: () => controller.onPullToRefresh(),
      child: Container(
        height: Get.size.height,
        padding: EdgeInsets.only(bottom: Get.mediaQuery.padding.bottom),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 15, top: Get.mediaQuery.padding.top + 15),
                child: Text("pull_to_refresh".tr,
                    textAlign: TextAlign.start,
                    style: TextStyles.kTSNFS12
                        .copyWith(color: textColor.withOpacity(0.3))),
              ),
            ),
            const BreedListView(),
            Expanded(
              child: SingleChildScrollView(
                controller: controller.scrollController,
                physics: const AlwaysScrollableScrollPhysics(),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RandomImageView(),
                    ImagesListView(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
