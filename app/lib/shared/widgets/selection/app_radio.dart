import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppRadio<T> extends StatelessWidget {
  const AppRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0,
      child: Radio<T>(
        focusColor: context.colorScheme.primary,
        activeColor: context.colorScheme.primary,
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}
