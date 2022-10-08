import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/constants.dart';
import '../../common/common.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.padding,
    this.primary,
    this.expandedWith = true,
    this.isLoading = false,
    this.alignment,
    this.dense = true,
    this.height,
    this.borderRadius,
  });

  final Widget? child;

  final Color? primary;

  final EdgeInsetsGeometry? padding;

  final VoidCallback? onPressed;

  final VoidCallback? onLongPress;

  final ValueChanged<bool>? onHover;

  final ValueChanged<bool>? onFocusChange;

  final bool expandedWith;

  final AlignmentGeometry? alignment;

  final double? height;

  final bool isLoading;

  final bool dense;

  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: padding ?? context.insets.h16,
        shape: RoundedRectangleBorder(
            borderRadius:
                borderRadius ?? BorderRadius.circular(context.sizes.p8)),
        textStyle: context.typo.titleMedium.weight500,
        foregroundColor: primary ?? context.colorScheme.onPrimary,
        backgroundColor: primary ?? context.colorScheme.primary,
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
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: isLoading
            ? SizedBox.square(
                dimension: context.sizes.p40,
                child: Lottie.asset(AppJson.customLoading),
              )
            : child,
      ),
    );
  }
}
