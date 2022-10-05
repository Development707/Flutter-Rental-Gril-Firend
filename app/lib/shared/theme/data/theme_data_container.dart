import 'package:flutter/material.dart';

import 'color_palette_data.dart';
import 'size_data.dart';
import 'typography_data.dart';

class ThemeDataContainer {
  const ThemeDataContainer({
    this.colors = const ColorPaletteData(),
    this.sizes = const SizeData(),
    this.typographys = const TypographyData(),
  });

  final ColorPaletteData colors;
  final SizeData sizes;
  final TypographyData typographys;

  ThemeData lightTheme() {
    final ColorScheme colorScheme = ColorPaletteData.lightColorScheme(colors);
    final TextTheme textTheme = TypographyData.textTheme(typographys);

    return ThemeData.from(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }

  ThemeData darkTheme() {
    final ColorScheme colorScheme = ColorPaletteData.darkColorScheme(colors);
    final TextTheme textTheme = TypographyData.textTheme(typographys);

    return ThemeData.from(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }
}
