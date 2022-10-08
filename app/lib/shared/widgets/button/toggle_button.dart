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
    final Color mainPrimary = primary ?? context.colorScheme.primary;

    return ToggleButtons(
      color: color ?? context.colorScheme.surface,
      selectedColor: mainPrimary,
      selectedBorderColor: mainPrimary,
      fillColor: mainPrimary.withOpacity(0.1),
      splashColor: mainPrimary.withOpacity(0.2),
      hoverColor: mainPrimary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(context.sizes.p8),
      borderColor: color ?? context.colorScheme.surface,
      borderWidth: 1,
      textStyle: context.typo.titleMedium.copyWith(
          fontWeight: FontWeight.w500, color: context.colorScheme.secondary),
      // required
      isSelected: isSelected,
      onPressed: onPressed,
      children: children,
    );
  }
}
