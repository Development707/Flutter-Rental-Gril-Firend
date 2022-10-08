import 'package:flutter/material.dart';

import '../../common/common.dart';

class StatusTag extends StatelessWidget {
  const StatusTag(
    this.text,
    this.color, {
    super.key,
    this.style,
    this.expanded = false,
  });

  final String text;
  final TextStyle? style;
  final Color color;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: context.sizes.p12,
          width: context.sizes.p12,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        context.gaps.w16,
        Flexible(child: Text(text, style: style ?? context.typo.bodyMedium)),
      ],
    );
  }
}
