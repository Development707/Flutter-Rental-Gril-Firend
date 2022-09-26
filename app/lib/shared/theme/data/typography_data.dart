import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'typography_data.freezed.dart';

@freezed
class TypographyData with _$TypographyData {
  const factory TypographyData({
    @Default(TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
    ))
        TextStyle displayLarge,
    @Default(TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
    ))
        TextStyle displayMedium,
    @Default(TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
    ))
        TextStyle displaySmall,
    @Default(TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
    ))
        TextStyle headlineLarge,
    @Default(TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
    ))
        TextStyle headlineMedium,
    @Default(TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
    ))
        TextStyle headlineSmall,
    @Default(TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
    ))
        TextStyle titleLarge,
    @Default(TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ))
        TextStyle titleMedium,
    @Default(TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ))
        TextStyle titleSmall,
    @Default(TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ))
        TextStyle labelLarge,
    @Default(TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ))
        TextStyle labelMedium,
    @Default(TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
    ))
        TextStyle labelSmall,
    @Default(TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ))
        TextStyle bodyLarge,
    @Default(TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ))
        TextStyle bodyMedium,
    @Default(TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ))
        TextStyle bodySmall,
  }) = _TypographyData;

  static TextTheme getTextTheme(TypographyData typographyData) {
    return TextTheme(
      displayLarge: typographyData.displayLarge,
      displayMedium: typographyData.displayMedium,
      displaySmall: typographyData.displaySmall,
      headlineLarge: typographyData.headlineLarge,
      headlineMedium: typographyData.headlineMedium,
      headlineSmall: typographyData.headlineSmall,
      titleLarge: typographyData.titleLarge,
      titleMedium: typographyData.titleMedium,
      titleSmall: typographyData.titleSmall,
      labelLarge: typographyData.labelLarge,
      labelMedium: typographyData.labelMedium,
      labelSmall: typographyData.labelSmall,
      bodyLarge: typographyData.bodyLarge,
      bodyMedium: typographyData.bodyMedium,
      bodySmall: typographyData.bodySmall,
    );
  }
}
