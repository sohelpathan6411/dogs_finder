import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/consts/color_consts.dart';
import '../../../../core/consts/img_const.dart';
import '../../../../core/utils/widget_utils/shimmers.dart';
import '../controllers/fullimage_controller.dart';

class FullimageView extends GetView<FullimageController> {
  const FullimageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Get.mediaQuery.padding.top + 40,
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
            onTap: () => Get.back(),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Icon(
                Icons.close,
                color: primary.withOpacity(0.7),
                size: 22.w,
              ),
            ),
          ),
        ],
      ),
      body: controller.imageUrl.value.isEmpty
          ? const SizedBox()
          : Dismissible(
              direction: DismissDirection.down,
              onResize: () {
                Get.back();
              },
              key: UniqueKey(),
              child: Center(
                child: Hero(
                  tag: controller.tag.value,
                  child: Material(
                    child: CachedNetworkImage(
                      imageUrl: controller.imageUrl.value,
                      fit: BoxFit.contain,
                      width: Get.width,
                      placeholder: (context, url) =>
                          Center(child: Shimmers().getShimmerItem()),
                      errorWidget: (context, error, stacktrace) {
                        return Image.asset(
                          loadingImage,
                          fit: BoxFit.contain,
                          width: Get.width,
                          color: primary,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
