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
    this.selectedColor,
    this.backgroundColor = Colors.transparent,
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
  final Color? selectedColor;
  final Color backgroundColor;
  final ShapeBorder avatarBorder;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return InputChip(
      padding: padding ?? context.insets.a12,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.sizes.p8),
        side: side ??
            BorderSide(
                color: selected
                    ? context.colorScheme.primary
                    : context.colors.neuTralVariant10),
      ),
      elevation: selected ? 2 : 0,
      showCheckmark: showCheckmark,
      avatar: avatar,
      avatarBorder: avatarBorder,
      backgroundColor: backgroundColor,
      selectedColor: context.colors.primary100,
      disabledColor: context.colors.neuTral90,
      shadowColor: context.colors.primary10,
      selectedShadowColor: context.colors.primary10,
      checkmarkColor: selectedColor ?? context.colorScheme.primary,
      labelStyle: context.typo.labelLarge.copyWith(
          fontWeight: FontWeight.w600,
          color: selected
              ? selectedColor ?? context.colorScheme.primary
              : context.colors.neuTralVariant30),
      deleteIcon: deleteIcon ??
          AppIcon(AppIcons.icCloseCircle,
              color: selected
                  ? selectedColor ?? context.colorScheme.primary
                  : context.colors.neuTral10),
      // required
      label: label,
      selected: selected,
      onSelected: onSelected,
      onPressed: onPressed,
      onDeleted: onDeleted,
    );
  }
}
