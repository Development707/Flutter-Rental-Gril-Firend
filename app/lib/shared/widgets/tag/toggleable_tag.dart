import 'package:flutter/material.dart';

import '../../common/common.dart';

class ToggleableTag<T> extends StatelessWidget {
  const ToggleableTag({
    super.key,
    this.text,
    this.enable = false,
    this.disabled = false,
    this.onTap,
    this.enableColor,
    this.textColor,
    this.normalColor,
    this.border,
    this.isDense = false,
    this.fontSize,
    this.descriptionTag,
  });

  /// The center text of the tag
  final String? text;

  /// Toggle the color of the tag
  ///
  /// By default: turn background to primary color, [TextStyle.textColor] to white
  final bool enable;

  /// Disable the tag, cannot interact with the tag, change tag color to grey
  final bool disabled;

  /// Handle callback when tapping
  final void Function()? onTap;

  /// Customize enable color. Default is [primary40]
  final Color? enableColor;

  /// Customize text color.
  final Color? textColor;

  /// Customize normal color. Default is [ColorPalettes.table]
  final Color? normalColor;

  final Border? border;

  /// Control the padding size of the tag. Default is true
  final bool isDense;

  /// [TextStyle.fontSize] of the [text]
  final double? fontSize;

  /// A small rounded tag, shown at the top right of the [ToggleableTag]
  final String? descriptionTag;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Material(
            borderRadius: BorderRadius.circular(context.sizes.p12),
            shadowColor: _backgroundColor(context),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(context.sizes.p12),
                border: border ??
                    Border.all(
                        color: enable
                            ? context.colorScheme.primary
                            : context.colorScheme.outline),
                color: _backgroundColor(context),
                boxShadow: enable
                    ? <BoxShadow>[
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 14,
                          color: context.colorScheme.onPrimaryContainer
                              .withOpacity(.08),
                        )
                      ]
                    : null,
              ),
              padding: isDense
                  ? context.insets.zero
                  : context.insets.h12.add(context.insets.v8),
              child: Stack(
                children: <Widget>[
                  Text(
                    text!,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: enable
                          ? textColor ?? context.colorScheme.primary
                          : context.colorScheme.onSurfaceVariant
                              .withOpacity(disabled ? .35 : 1),
                      fontSize: fontSize ?? 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (descriptionTag != null)
          Transform.translate(
            offset: const Offset(4, -4),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: context.insets.a4,
                  child: Text(
                    descriptionTag!,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: context.colorScheme.background,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Color _backgroundColor(BuildContext context) => enable
      ? enableColor ?? context.colorScheme.background
      : disabled
          ? context.colorScheme.onSurfaceVariant
          : normalColor ?? context.colorScheme.background;
}
