import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding,
    this.primary,
    this.expandedWith = false,
    this.alignment,
    this.isLoading = false,
    this.dense = true,
    this.height,
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

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shadowColor: context.colors.primary10,
        padding: padding ?? context.insets.h16,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.sizes.p8)),
        textStyle: context.typo.titleMedium.copyWith(
            fontWeight: FontWeight.w500,
            color: onPressed != null
                ? context.colors.primary10
                : context.colors.neuTralVariant10),
        disabledForegroundColor: primary ?? context.colorScheme.primary,
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
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        switchOutCurve: Curves.fastOutSlowIn,
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(scale: animation, child: child),
        child: isLoading
            ? SizedBox.square(
                dimension: context.sizes.p32,
                child: const CircularProgressIndicator(),
              )
            : child,
      ),
    );
  }
}
