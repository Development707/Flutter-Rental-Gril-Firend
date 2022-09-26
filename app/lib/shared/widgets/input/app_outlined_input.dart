import 'package:flutter/material.dart';

import '../../common/common.dart';

class AppOutlinedInput extends StatelessWidget {
  const AppOutlinedInput({
    super.key,
    this.hintText,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String? hintText;
  final Widget? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.sizes.p12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.sizes.p12),
          borderSide: BorderSide(
              width: context.sizes.p4 / 2, color: context.colorScheme.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(context.sizes.p12),
          borderSide: BorderSide(
              width: context.sizes.p4, color: context.colorScheme.primary),
        ),
        hintText: hintText,
        label: label,
        prefixIcon: prefixIcon,
        prefixIconConstraints: BoxConstraints.expand(
            width: context.sizes.p72, height: context.sizes.p4 * 10),
        suffixIcon: suffixIcon,
        suffixIconConstraints: BoxConstraints.expand(
            width: context.sizes.p64, height: context.sizes.p4 * 7),
      ),
    );
  }
}
