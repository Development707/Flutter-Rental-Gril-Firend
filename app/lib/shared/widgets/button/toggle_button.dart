import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppToggleButtons extends StatelessWidget {
  const AppToggleButtons({
    super.key,
    required this.children,
    required this.isSelected,
    required this.onPressed,
    this.padding,
    this.color,
    this.primary,
    this.expandedWith = true,
    this.alignment,
  });

  final List<Widget> children;
  final List<bool> isSelected;
  final Color? color;
  final Color? primary;
  final EdgeInsetsGeometry? padding;
  final void Function(int index)? onPressed;
  final bool expandedWith;
  final AlignmentGeometry? alignment;

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      color: color ?? context.colors.neuTralVariant30,
      selectedColor: primary ?? context.colorScheme.primary,
      selectedBorderColor: primary ?? context.colorScheme.primary,
      fillColor: primary?.withOpacity(0.1) ?? context.colors.primary95,
      splashColor: primary?.withOpacity(0.2) ?? context.colors.primary80,
      hoverColor: primary?.withOpacity(0.1) ?? context.colors.primary95,
      borderRadius: BorderRadius.circular(context.sizes.p8),
      borderColor: color ?? context.colors.neuTralVariant30,
      borderWidth: 1,
      textStyle: context.typo.titleMedium.copyWith(
          fontWeight: FontWeight.w500, color: context.colors.secondary10),
      // required
      isSelected: isSelected,
      onPressed: onPressed,
      children: children,
    );
  }
}
