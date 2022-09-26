import 'package:flutter/material.dart';

import '../../../constants/app_images.dart';
import '../../common/common.dart';

class ErrorImage extends StatelessWidget {
  const ErrorImage({super.key, this.size, this.isRounded = false});

  final double? size;
  final bool isRounded;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(isRounded ? 50 : 0),
        child: Container(
          decoration: BoxDecoration(
            color: context.colors.neuTral99,
          ),
          child: Image.asset(AppImages.avatar, height: size),
        ),
      ),
    );
  }
}
