import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs_finder/core/utils/widget_utils/shimmers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/routes/app_pages.dart';
import '../../consts/color_consts.dart';
import '../../consts/img_const.dart';

class CacheImageView extends StatelessWidget {
  final String imageUrl;
  final BoxFit? fitBox;
  final double? height;
  final double? width;
  final String tag;

  const CacheImageView(
      {super.key,
      required this.imageUrl,
      this.fitBox,
      this.height,
      this.width,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: Material(
          child: InkWell(
            onTap: () {
              Get.toNamed(Routes.FULLIMAGE,
                  arguments: {'imageUrl': imageUrl, 'tag': tag});
            },
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: fitBox,
              placeholder: (context, url) =>
                  Center(child: Shimmers().getShimmerItem()),
              errorWidget: (context, error, stacktrace) {
                return Image.asset(
                  loadingImage,
                  fit: fitBox,
                  color: primary,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
