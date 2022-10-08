import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.child,
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
    this.width,
  });

  final Widget child;

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

  final double? width;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding ?? context.insets.h16,
        side: BorderSide(
            color: primary ?? context.colorScheme.primary,
            width: width ?? context.sizes.p4 / 4),
        shape: RoundedRectangleBorder(
            borderRadius:
                borderRadius ?? BorderRadius.circular(context.sizes.p8)),
        textStyle: context.typo.titleMedium.weight500,
        foregroundColor: primary ?? context.colorScheme.primary,
        surfaceTintColor: primary ?? context.colorScheme.primary,
        minimumSize: Size(
          expandedWith ? double.infinity : 0,
          height != null
              ? height!
              : dense
                  ? context.sizes.p40
                  : context.sizes.p48,
        ),
        alignment: alignment,
      ),
      onPressed: isLoading ? () {} : onPressed,
      onLongPress: isLoading ? () {} : onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 100),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) =>
              ScaleTransition(scale: animation, child: child),
          switchInCurve: Curves.fastOutSlowIn,
          child: isLoading
              ? SizedBox.square(
                  dimension: context.sizes.p24,
                  child: CircularProgressIndicator(color: primary))
              : child,
        ),
      ),
    );
  }
}
