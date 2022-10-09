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
    this.primary,
    this.side,
  });

  final bool selected;
  final Widget label;
  final ValueChanged<bool>? onSelected;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final bool showCheckmark;
  final Color? primary;
  final ShapeBorder? avatarBorder;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      padding: padding ?? context.insets.h8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.sizes.p40),
        side: side ?? BorderSide(color: primary ?? context.colorScheme.primary),
      ),
      elevation: 0,
      showCheckmark: showCheckmark,
      avatar: avatar,
      selectedColor: primary ?? context.colorScheme.primary,
      shadowColor: primary ?? context.colorScheme.primary,
      selectedShadowColor: primary ?? context.colorScheme.primary,
      checkmarkColor: context.colorScheme.onPrimary,
      labelStyle: context.typo.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
          color: selected
              ? context.colorScheme.onPrimary
              : context.colorScheme.primary),

      /// required
      label: label,
      selected: selected,
      onSelected: onSelected,
    );
  }
}
