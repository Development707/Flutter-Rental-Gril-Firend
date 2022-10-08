import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import 'error_image.dart';

class RoundedRectImage extends StatelessWidget {
  const RoundedRectImage({
    super.key,
    this.imageURL,
    this.width,
    this.height,
    this.borderRadius,
  });

  final String? imageURL;
  final double? width, height;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(context.sizes.p8),
      child: CachedNetworkImage(
        imageUrl: imageURL ?? '',
        width: width,
        height: height,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (_, String url, DownloadProgress progress) =>
            Center(child: CircularProgressIndicator(value: progress.progress)),
        errorWidget: (BuildContext context, String url, dynamic error) =>
            ErrorImage(size: width),
      ),
    );
  }
}
