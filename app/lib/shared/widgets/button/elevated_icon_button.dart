import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/constants.dart';
import '../../common/common.dart';

class AppElevatedButtonIcon extends StatelessWidget {
  const AppElevatedButtonIcon({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding,
    this.primary,
    this.expandedWith = true,
    this.alignment,
    this.isLoading = false,
    this.dense = true,
    this.height,
    this.borderRadius,
  });

  final Widget label;

  final Widget icon;

  final Color? primary;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final ValueChanged<bool>? onHover;

  final ValueChanged<bool>? onFocusChange;

  final bool expandedWith;

  final AlignmentGeometry? alignment;

  final bool isLoading;

  final bool dense;

  final double? height;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        surfaceTintColor: context.colors.primary10,
        shadowColor: context.colors.primary10,
        padding: padding ?? context.insets.h16,
        shape: RoundedRectangleBorder(
            borderRadius:
                borderRadius ?? BorderRadius.circular(context.sizes.p8)),
        textStyle: context.typo.titleMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: onPressed != null
                ? context.colors.primary100
                : context.colors.neuTralVariant10),
        backgroundColor: primary ?? context.colorScheme.primary,
        minimumSize: Size(
          expandedWith ? double.infinity : 0,
          height != null
              ? height!
              : dense
                  ? context.sizes.p4 * 12
                  : context.sizes.p4 * 15,
        ),
        alignment: alignment,
      ),
      onPressed: isLoading ? () {} : onPressed,
      onLongPress: isLoading ? () {} : onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      icon: AnimatedSize(
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: isLoading
            ? SizedBox.square(
                dimension: context.sizes.p4 * 12,
                child: Lottie.asset(AppJson.customLoading),
              )
            : icon,
      ),
      label: label,
    );
  }
}
