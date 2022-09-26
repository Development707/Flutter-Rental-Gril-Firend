import 'package:flutter/material.dart';

import 'color_data.dart';
import 'size_data.dart';
import 'typography_data.dart';

class ThemeDataContainer {
  const ThemeDataContainer({
    this.colors = const ColorData(),
    this.sizes = const SizeData(),
    this.typographyData = const TypographyData(),
  });

  final ColorData colors;
  final SizeData sizes;
  final TypographyData typographyData;

  ThemeData lightTheme() {
    final ColorScheme colorScheme = ColorData.getLightColorScheme(colors);
    final TextTheme textTheme = TypographyData.getTextTheme(typographyData);

    return ThemeData.from(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }

  ThemeData darkTheme() {
    final ColorScheme colorScheme = ColorData.getDarkColorScheme(colors);
    final TextTheme textTheme = TypographyData.getTextTheme(typographyData);

    return ThemeData.from(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: textTheme,
    );
  }
}
