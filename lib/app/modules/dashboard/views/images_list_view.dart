import 'package:dogs_finder/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/consts/app_consts.dart';
import '../../../../core/consts/color_consts.dart';
import '../../../../core/themes/text_styles.dart';
import '../../../../core/utils/widget_utils/cache_image_view.dart';
import '../../../../core/utils/widget_utils/shimmers.dart';

class ImagesListView extends GetView<DashboardController> {
  const ImagesListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => controller.imagesListStatus.value == ApiStatus.FAIL
        ? const SizedBox()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (controller.selectedBreed.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 25, bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        controller.selectedBreed.toString(),
                        textAlign: TextAlign.start,
                        style: TextStyles.kTSNFS14W700,
                      ),
                      if (controller.selectedSubBreed.isNotEmpty)
                        Text(" / ${controller.selectedSubBreed}",
                            textAlign: TextAlign.start,
                            style: TextStyles.kTSNFS14W700
                                .copyWith(color: textColor)),
                      if (controller.imagesList.value.message != null &&
                          controller.imagesList.value.message!.isNotEmpty)
                        Text(
                          " (${controller.imagesList.value.message!.length})",
                          textAlign: TextAlign.start,
                          style: TextStyles.kTSNFS14W300,
                        ),
                    ],
                  ),
                ),
              controller.imagesListStatus.value == ApiStatus.LOADING
                  ? Shimmers().getGridShimmer()
                  : controller.imagesList.value.message == null
                      ? const SizedBox()
                      : controller.imagesList.value.message!.isEmpty
                          ? const SizedBox()
                          : Column(
                              children: [
                                SizedBox(
                                  child: GridView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio:
                                          Get.size.aspectRatio * 2.2,
                                      crossAxisCount: 2,
                                    ),
                                    itemCount: controller
                                        .imagesList.value.message!
                                        .take((pageSize *
                                            controller.pageNumber.value))
                                        .length,
                                    scrollDirection: Axis.vertical,
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context, index) {
                                      var item = controller
                                          .imagesList.value.message![index];
                                      return Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: Hero(
                                          tag: item.toString(),
                                          child: CacheImageView(
                                            height: double.infinity,
                                            width: double.infinity,
                                            imageUrl: item,
                                            fitBox: BoxFit.cover,
                                            tag: item.toString(),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                if (controller
                                        .imagesList.value.message!.length >
                                    (pageSize * controller.pageNumber.value))
                                  const Center(
                                      child: Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: CupertinoActivityIndicator(
                                        color: primary),
                                  )),
                                if (controller
                                        .imagesList.value.message!.length <=
                                    (pageSize * controller.pageNumber.value))
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, bottom: 60, top: 25),
                                      child: Text("reached_end".tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyles.kTSNFS12.copyWith(
                                              color:
                                                  textColor.withOpacity(0.3))),
                                    ),
                                  )
                              ],
                            ),
            ],
          ));
  }
}
