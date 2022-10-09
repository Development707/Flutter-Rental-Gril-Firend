import 'package:flutter/material.dart';

import '../../common/common.dart';
import '../selection/app_checkbox.dart';

class BaseCard extends StatelessWidget {
  const BaseCard({
    super.key,
    required this.content,
    this.leading,
    this.leadingGap = 16,
    this.trailing,
    this.trailingGap = 16,
    this.bottomGap = 0,
    this.bottom,
    this.height,
    this.padding,
    this.borderRadius,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.decoration,
  });

  final Widget? leading;
  final double leadingGap;
  final Widget content;
  final double trailingGap;
  final Widget? trailing;
  final double bottomGap;
  final Widget? bottom;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final CrossAxisAlignment crossAxisAlignment;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: padding ?? context.insets.a12,
      decoration: decoration ??
          BoxDecoration(
            color: context.colorScheme.secondaryContainer,
            borderRadius:
                borderRadius ?? BorderRadius.circular(context.sizes.p12),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 10,
                  color: context.colorScheme.outline.withOpacity(0.12)),
              BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 130,
                  color: context.colorScheme.outline.withOpacity(0.03)),
            ],
          ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (leading != null) ...<Widget>[
                leading!,
                SizedBox(width: leadingGap),
              ],
              Expanded(child: content),
              if (trailing != null) ...<Widget>[
                SizedBox(width: trailingGap),
                trailing!,
              ],
            ],
          ),
          if (bottom != null) ...<Widget>[
            SizedBox(width: bottomGap),
            bottom!,
          ],
        ],
      ),
    );
  }
}
