import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../../common/common.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key, this.size, this.isRounded = false});

  final double? size;
  final bool isRounded;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: context.insets.a8,
      decoration: BoxDecoration(
        color: context.colorScheme.background,
        shape: isRounded ? BoxShape.circle : BoxShape.rectangle,
      ),
      child: Image.asset(AppImages.avatar, height: size),
    );
  }
}
