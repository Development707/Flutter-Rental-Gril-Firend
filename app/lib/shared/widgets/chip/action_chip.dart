import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppActionChip extends StatelessWidget {
  const AppActionChip({
    super.key,
    required this.label,
    required this.onPressed,
    this.padding,
    this.avatar,
    this.primary,
    this.side,
  });

  final Widget label;
  final VoidCallback onPressed;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final Color? primary;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      padding: padding ?? context.insets.h8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.sizes.p40),
        side: side ?? BorderSide(color: primary ?? context.colorScheme.primary),
      ),
      elevation: 0,
      avatar: avatar,
      shadowColor: primary ?? context.colorScheme.primary,
      labelStyle: context.typo.labelLarge.copyWith(
          fontWeight: FontWeight.w600, color: context.colorScheme.primary),

      /// required
      label: label,
      onPressed: onPressed,
    );
  }
}
