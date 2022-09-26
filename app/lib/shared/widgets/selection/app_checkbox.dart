import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppCheckbox extends StatelessWidget {
  const AppCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    this.shape,
    this.side,
  });

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final OutlinedBorder? shape;
  final BorderSide? side;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      focusColor: context.colorScheme.primary,
      activeColor: context.colorScheme.primary,
      checkColor: context.colors.primary100,
      shape: shape ??
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(context.sizes.p4)),
      value: value,
      side:
          side ?? BorderSide(color: context.colors.neuTralVariant50, width: 2),
      onChanged: onChanged,
    );
  }
}
