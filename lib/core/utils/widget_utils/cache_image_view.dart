import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dogs_finder/core/consts/color_consts.dart';
import 'package:dogs_finder/core/utils/widget_utils/shimmers.dart';
import 'package:flutter/material.dart';

import '../../consts/img_const.dart';

class CacheImageView extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fitBox;
  final double? height;
  final double? width;

  const CacheImageView(
      {super.key, this.imageUrl, this.fitBox, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: CachedNetworkImage(
          imageUrl: (imageUrl ?? ""),
          fit: fitBox,
          placeholder: (context, url) =>
              Center(child: Shimmers().getShimmerItem()),
          errorWidget: (context, error, stacktrace) {
            return Image.asset(
              loadingImage,
              fit: fitBox,
            );
          },
        ),
      ),
    );
  }
}
