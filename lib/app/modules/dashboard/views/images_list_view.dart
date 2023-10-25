import 'package:dogs_finder/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/widget_utils/cache_image_view.dart';
import '../../../../core/utils/widget_utils/shimmers.dart';

class ImagesListView extends GetView<DashboardController> {
  const ImagesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (controller.selectedBreed.isEmpty)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'images_list'.tr,
                  textAlign: TextAlign.start,
                  style: TextStyles.kTSNFS22W600,
                ),
              ),
            if (controller.selectedBreed.isNotEmpty)
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      controller.selectedBreed.toString(),
                      textAlign: TextAlign.start,
                      style: TextStyles.kTSNFS22W600,
                    ),
                  ),
                  if (controller.selectedSubBreed.isNotEmpty)
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("/${controller.selectedSubBreed}",
                              textAlign: TextAlign.start,
                              style: TextStyles.kTSNFS22W400),
                        ),
                      ],
                    ),
                ],
              ),
            controller.imagesListStatus.value == ApiStatus.LOADING
                ? Shimmers().getGridShimmer()
                : controller.imagesList.value.message == null
                    ? const SizedBox()
                    : controller.imagesList.value.message!.isEmpty
                        ? const SizedBox()
                        : SizedBox(
                            child: GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: Get.size.aspectRatio * 2.2,
                                crossAxisCount: 2,
                              ),
                              itemCount:
                                  controller.imagesList.value.message!.length,
                              scrollDirection: Axis.vertical,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                var item =
                                    controller.imagesList.value.message![index];
                                return Padding(
                                  padding: const EdgeInsets.all(1),
                                  child: CacheImageView(
                                    height: double.infinity,
                                    width: double.infinity,
                                    imageUrl: item,
                                    fitBox: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          )
          ],
        ));
  }
}
