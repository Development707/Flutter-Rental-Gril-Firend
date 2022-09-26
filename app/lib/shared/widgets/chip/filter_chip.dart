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
                    : context.colors.neuTralVariant10),
      ),
      elevation: selected ? 2 : 0,
      showCheckmark: showCheckmark,
      avatar: avatar,
      avatarBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.sizes.p4)),
      backgroundColor: backgroundColor,
      selectedColor: context.colors.primary100,
      disabledColor: context.colors.neuTral90,
      shadowColor: context.colors.primary10,
      selectedShadowColor: context.colors.primary10,
      checkmarkColor: selectedColor ?? context.colorScheme.primary,
      labelStyle: context.typo.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
          color: selected
              ? context.colorScheme.primary
              : context.colors.neuTralVariant30),
      // required
      label: label,
      selected: selected,
      onSelected: onSelected,
    );
  }
}
