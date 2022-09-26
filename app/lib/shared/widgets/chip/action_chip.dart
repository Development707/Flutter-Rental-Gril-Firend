import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppActionChip extends StatelessWidget {
  const AppActionChip({
    super.key,
    required this.label,
    required this.onPressed,
    this.padding,
    this.avatar,
    this.selectedColor,
    this.backgroundColor,
    this.side,
  });

  final Widget label;
  final VoidCallback onPressed;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final Color? selectedColor;
  final Color? backgroundColor;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: padding ?? context.insets.a12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.sizes.p8),
        side: side ??
            BorderSide(color: selectedColor ?? context.colors.neuTralVariant10),
      ),
      elevation: 0,
      avatar: avatar,
      backgroundColor: backgroundColor ?? context.colors.transparent,
      shadowColor: context.colors.primary10,
      labelStyle: context.typo.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
          color: selectedColor ?? context.colors.neuTralVariant30),
      // required
      label: label,
      onPressed: onPressed,
    );
  }
}
