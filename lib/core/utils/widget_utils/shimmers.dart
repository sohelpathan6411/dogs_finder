import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/color_consts.dart';

class Shimmers {
  getListShimmer({count = 10}) {
    return Shimmer.fromColors(
        baseColor: primary.withOpacity(0.2),
        highlightColor: primary.withOpacity(0.4),
        child: SizedBox(
          height: Get.size.height / 4.4,
          width: Get.size.width / 2,
          child: ListView.builder(
            itemCount: count,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: primary.withOpacity(0.4),
                height: Get.size.height / 4.4,
                width: Get.size.width / 2,
              ),
            ),
          ),
        ));
  }

  getGridShimmer({count = 10}) {
    return Shimmer.fromColors(
        baseColor: primary.withOpacity(0.2),
        highlightColor: primary.withOpacity(0.4),
        child: SizedBox(
          width: double.infinity,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: Get.size.aspectRatio * 2.2,
              crossAxisCount: 2,
            ),
            itemCount: count,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: primary.withOpacity(0.4),
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        ));
  }

  getShimmerItem({child}) {
    return Shimmer.fromColors(
        child: child ??
            Container(
              height: Get.size.height / 2.2,
              width: Get.size.width,
              color: primary.withOpacity(0.4),
            ),
        baseColor: primary.withOpacity(0.2),
        highlightColor: primary.withOpacity(0.4));
  }
}
