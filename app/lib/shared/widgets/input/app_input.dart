import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.onChanged,
    this.errorText,
    this.icon,
    this.keyboardType,
    this.textInputAction,
    this.border = const OutlineInputBorder(),
    this.controller,
    this.style,
  });

  final String? icon;
  final String? errorText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final InputBorder? border;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.sizes.p12)),
      ),
    );
  }
}
