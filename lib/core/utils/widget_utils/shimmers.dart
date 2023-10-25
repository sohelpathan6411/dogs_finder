import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/color_consts.dart';

class Shimmers {
  getListShimmer({count = 10}) {
    return Shimmer.fromColors(
        baseColor: primary.withOpacity(0.6),
        highlightColor: primary.withOpacity(0.3),
        child: ListView.builder(
            itemCount: count,
            shrinkWrap: true,
            itemBuilder: (context, index) => Card(
                  elevation: 12.0,
                  shadowColor: primary,
                  child: Container(
                    height: 100.0,
                    color: colorRed,
                    margin: const EdgeInsets.all(16.0),
                  ),
                )));
  }

  getBannerShimmer() {
    return Shimmer.fromColors(
        baseColor: primary.withOpacity(0.6),
        highlightColor: primary.withOpacity(0.3),
        child: Card(
          elevation: 12.0,
          shadowColor: primary,
          child: Container(
            height: Get.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              color: Colors.white.withOpacity(0.1),
            ),
            margin: const EdgeInsets.all(16.0),
          ),
        ));
  }

  getBottomMenuShimmer() {
    return Shimmer.fromColors(
        baseColor: primary.withOpacity(0.6),
        highlightColor: primary.withOpacity(0.3),
        child: Container(
          height: 75.0,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            color: Colors.white.withOpacity(0.1),
          ),
          margin: const EdgeInsets.all(16.0),
        ));
  }

  getShimmerItem({child}) {
    return Shimmer.fromColors(
        child: child ??
            Card(
              elevation: 12.0,
              shadowColor: primary,
              child: Container(
                height: 100.0,
                color: colorRed,
                margin: const EdgeInsets.all(16.0),
              ),
            ),
        baseColor: primary.withOpacity(0.6),
        highlightColor: primary.withOpacity(0.3));
  }
}
