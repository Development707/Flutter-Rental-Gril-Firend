import 'package:flutter/material.dart';

import '../../../constants/app_icons.dart';
import '../../common/common.dart';
import '../app_icon.dart';

class AppInputChip extends StatelessWidget {
  const AppInputChip({
    super.key,
    this.selected = false,
    required this.label,
    this.onPressed,
    this.onSelected,
    this.onDeleted,
    this.padding,
    this.avatar,
    this.deleteIcon,
    this.avatarBorder = const RoundedRectangleBorder(),
    this.showCheckmark = false,
    this.primary,
    this.side,
  });

  final bool selected;
  final Widget label;
  final ValueChanged<bool>? onSelected;
  final VoidCallback? onPressed;
  final VoidCallback? onDeleted;

  final EdgeInsetsGeometry? padding;
  final Widget? avatar;
  final Widget? deleteIcon;
  final bool showCheckmark;
  final Color? primary;
  final ShapeBorder avatarBorder;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return InputChip(
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
      deleteIcon: deleteIcon ??
          AppIcon(AppIcons.icCloseCircle,
              color: selected
                  ? context.colorScheme.onPrimary
                  : context.colorScheme.primary),
      // required
      label: label,
      selected: selected,
      onSelected: onSelected,
      onPressed: onPressed,
      onDeleted: onDeleted,
    );
  }
}
