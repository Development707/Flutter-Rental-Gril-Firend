import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppRadioListTile<T> extends StatelessWidget {
  const AppRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
    this.subtitle,
    this.secondary,
  });
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final Widget? secondary;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<T>(
      dense: true,
      enableFeedback: true,
      controlAffinity: ListTileControlAffinity.trailing,
      visualDensity: VisualDensity.compact,
      contentPadding: context.insets.zero,
      selectedTileColor: context.colorScheme.primary,
      activeColor: context.colorScheme.primary,
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: title,
      subtitle: subtitle,
      secondary: secondary,
    );
  }
}
