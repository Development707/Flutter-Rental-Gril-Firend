import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0,
      child: Switch.adaptive(
        focusColor: context.colorScheme.primary,
        activeColor: context.colorScheme.primary,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
