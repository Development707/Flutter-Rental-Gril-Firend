import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'color_palette_data.dart';

part 'custom_color_scheme.freezed.dart';

@freezed
class CustomColorScheme with _$CustomColorScheme {
  const factory CustomColorScheme({
    required Color warning,
    required Color onWarning,
    required Color warningContainer,
    required Color onWarningContainer,
  }) = _CustomColorScheme;

  static CustomColorScheme lightColorScheme(ColorPaletteData colors) {
    return CustomColorScheme(
      warning: colors.warning40,
      onWarning: colors.warning100,
      warningContainer: colors.warning90,
      onWarningContainer: colors.warning10,
    );
  }

  static CustomColorScheme darkColorScheme(ColorPaletteData colors) {
    return CustomColorScheme(
      warning: colors.warning80,
      onWarning: colors.warning20,
      warningContainer: colors.warning30,
      onWarningContainer: colors.warning90,
    );
  }
}
