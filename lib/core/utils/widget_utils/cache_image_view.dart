import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../consts/img_const.dart';

class CacheImageView extends StatelessWidget {
  final String? imageUrl;
  final BoxFit? fitBox;

  const CacheImageView({super.key, this.imageUrl, this.fitBox});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (imageUrl ?? ""),
      fit: fitBox,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
      errorWidget: (context, error, stacktrace) {
        return Image.asset(
          loadingImage,
          fit: fitBox,
        );
      },
    );
  }
}
