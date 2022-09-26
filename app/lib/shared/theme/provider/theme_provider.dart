import 'package:flutter/material.dart';
import '../data/theme_data_container.dart';

class ThemeProvider extends InheritedTheme {
  const ThemeProvider({super.key, required super.child, required this.data});

  final ThemeDataContainer data;

  static ThemeDataContainer of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!.data;
  }

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return data != oldWidget.data;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return ThemeProvider(
      data: data,
      child: child,
    );
  }
}
