import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppFilterChip extends StatelessWidget {
  const AppFilterChip({
    super.key,
    this.selected = false,
    required this.label,
    required this.onSelected,
    this.padding,
    this.avatar,
    this.avatarBorder,
    this.showCheckmark = false,
    this.selectedColor,
    this.backgroundColor = Colors.transparent,
    this.side,
  });

  final bool selected;
  final Widget label;
  final ValueChanged<bool>? onSelected;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final bool showCheckmark;
  final Color? selectedColor;
  final Color backgroundColor;
  final ShapeBorder? avatarBorder;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: padding ?? context.insets.a12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.sizes.p8),
        side: side ??
            BorderSide(
                color: selected
                    ? selectedColor ?? context.colorScheme.primary
                    : context.colorScheme.surface),
      ),
      elevation: selected ? 2 : 0,
      showCheckmark: showCheckmark,
      avatar: avatar,
      avatarBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.sizes.p4)),
      backgroundColor: backgroundColor,
      selectedColor: context.colorScheme.onPrimary,
      disabledColor: context.colorScheme.surface,
      shadowColor: context.colorScheme.onPrimaryContainer,
      selectedShadowColor: context.colorScheme.onPrimaryContainer,
      checkmarkColor: selectedColor ?? context.colorScheme.primary,
      labelStyle: context.typo.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
          color: selected
              ? context.colorScheme.primary
              : context.colorScheme.surface),
      // required
      label: label,
      selected: selected,
      onSelected: onSelected,
    );
  }
}
