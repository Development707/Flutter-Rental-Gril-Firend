import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'typography_data.freezed.dart';

@freezed
class TypographyData with _$TypographyData {
  const factory TypographyData({
    @Default(TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle displayLarge,
    @Default(TextStyle(
      fontSize: 45,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle displayMedium,
    @Default(TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle displaySmall,
    @Default(TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle headlineLarge,
    @Default(TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle headlineMedium,
    @Default(TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle headlineSmall,
    @Default(TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle titleLarge,
    @Default(TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      fontFamily: 'Alegreya',
    ))
        TextStyle titleMedium,
    @Default(TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Alegreya',
    ))
        TextStyle titleSmall,
    @Default(TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      fontFamily: 'Alegreya',
    ))
        TextStyle labelLarge,
    @Default(TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      fontFamily: 'Alegreya',
    ))
        TextStyle labelMedium,
    @Default(TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      fontFamily: 'Alegreya',
    ))
        TextStyle labelSmall,
    @Default(TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle bodyLarge,
    @Default(TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle bodyMedium,
    @Default(TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      fontFamily: 'Alegreya',
    ))
        TextStyle bodySmall,
  }) = _TypographyData;

  static TextTheme textTheme(TypographyData typographyData) {
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
