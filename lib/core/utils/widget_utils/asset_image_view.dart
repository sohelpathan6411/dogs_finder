import 'package:flutter/material.dart';

import '../../consts/img_const.dart';

class AssetImageView extends StatelessWidget {
  final String? image;
  final double? width, height;
  final BoxFit? fitBox;
  final Color? colorImg;

  const AssetImageView(
      {super.key,
      this.fitBox,
      this.image,
      this.width,
      this.height,
      this.colorImg});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image!,
      width: width,
      height: height,
      fit: fitBox,
      color: colorImg,
      errorBuilder: (context, error, stacktrace) {
        return Image.asset(
          loadingImage,
          fit: fitBox,
          width: width,
          height: height,
        );
      },
    );
  }
}
