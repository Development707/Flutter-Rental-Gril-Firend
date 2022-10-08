import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../common/common.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
    this.icon, {
    this.size,
    this.color,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    super.key,
  });

  final String icon;

  final double? size;

  final BoxFit fit;

  final Color? color;

  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      width: size ?? context.sizes.p40,
      height: size ?? context.sizes.p40,
      alignment: alignment,
      fit: fit,
      color: color,
    );
  }
}
