import 'package:flutter/material.dart';

/// Data for the sizes of the theme.
class SizeData {
  /// {@macro sizes}
  const SizeData([double mainSize = 4.0])
      : zero = mainSize * 0,
        p4 = mainSize * 1,
        p8 = mainSize * 2,
        p12 = mainSize * 3,
        p16 = mainSize * 4,
        p24 = mainSize * 5,
        p32 = mainSize * 6,
        p40 = mainSize * 8,
        p48 = mainSize * 12,
        p56 = mainSize * 14,
        p64 = mainSize * 16,
        p72 = mainSize * 18,
        p80 = mainSize * 20,
        p96 = mainSize * 24;

  final double zero;
  final double p4;
  final double p8;
  final double p12;
  final double p16;
  final double p24;
  final double p32;
  final double p40;
  final double p48;
  final double p56;
  final double p64;
  final double p72;
  final double p80;
  final double p96;

  /// Get corresponding insets
  ThemeEdgeInsetsSizeData get insets => ThemeEdgeInsetsSizeData(this);

  /// Get corresponding gap
  ThemeGapSizeData get gaps => ThemeGapSizeData(this);
}

/// {@macro sizes}
class ThemeEdgeInsetsSizeData {
  /// {@macro sizes}
  const ThemeEdgeInsetsSizeData(this._spacing);

  final SizeData _spacing;

  /// All insets
  EdgeInsets get zero => EdgeInsets.zero;
  EdgeInsets get a4 => EdgeInsets.all(_spacing.p4);
  EdgeInsets get a8 => EdgeInsets.all(_spacing.p8);
  EdgeInsets get a12 => EdgeInsets.all(_spacing.p12);
  EdgeInsets get a16 => EdgeInsets.all(_spacing.p16);
  EdgeInsets get a24 => EdgeInsets.all(_spacing.p24);
  EdgeInsets get a32 => EdgeInsets.all(_spacing.p32);
  EdgeInsets get a40 => EdgeInsets.all(_spacing.p40);
  EdgeInsets get a48 => EdgeInsets.all(_spacing.p48);
  EdgeInsets get a56 => EdgeInsets.all(_spacing.p56);
  EdgeInsets get a64 => EdgeInsets.all(_spacing.p64);
  EdgeInsets get a72 => EdgeInsets.all(_spacing.p72);
  EdgeInsets get a80 => EdgeInsets.all(_spacing.p80);
  EdgeInsets get a96 => EdgeInsets.all(_spacing.p96);

  /// Horizontal insets
  EdgeInsets get h4 => EdgeInsets.symmetric(horizontal: _spacing.p4);
  EdgeInsets get h8 => EdgeInsets.symmetric(horizontal: _spacing.p8);
  EdgeInsets get h12 => EdgeInsets.symmetric(horizontal: _spacing.p12);
  EdgeInsets get h16 => EdgeInsets.symmetric(horizontal: _spacing.p16);
  EdgeInsets get h24 => EdgeInsets.symmetric(horizontal: _spacing.p24);
  EdgeInsets get h32 => EdgeInsets.symmetric(horizontal: _spacing.p32);
  EdgeInsets get h40 => EdgeInsets.symmetric(horizontal: _spacing.p40);
  EdgeInsets get h48 => EdgeInsets.symmetric(horizontal: _spacing.p48);
  EdgeInsets get h56 => EdgeInsets.symmetric(horizontal: _spacing.p56);
  EdgeInsets get h64 => EdgeInsets.symmetric(horizontal: _spacing.p64);
  EdgeInsets get h72 => EdgeInsets.symmetric(horizontal: _spacing.p72);
  EdgeInsets get h80 => EdgeInsets.symmetric(horizontal: _spacing.p80);
  EdgeInsets get h96 => EdgeInsets.symmetric(horizontal: _spacing.p96);

  /// Vertical insets
  EdgeInsets get v4 => EdgeInsets.symmetric(vertical: _spacing.p4);
  EdgeInsets get v8 => EdgeInsets.symmetric(vertical: _spacing.p8);
  EdgeInsets get v12 => EdgeInsets.symmetric(vertical: _spacing.p12);
  EdgeInsets get v16 => EdgeInsets.symmetric(vertical: _spacing.p16);
  EdgeInsets get v24 => EdgeInsets.symmetric(vertical: _spacing.p24);
  EdgeInsets get v32 => EdgeInsets.symmetric(vertical: _spacing.p32);
  EdgeInsets get v40 => EdgeInsets.symmetric(vertical: _spacing.p40);
  EdgeInsets get v48 => EdgeInsets.symmetric(vertical: _spacing.p48);
  EdgeInsets get v56 => EdgeInsets.symmetric(vertical: _spacing.p56);
  EdgeInsets get v64 => EdgeInsets.symmetric(vertical: _spacing.p64);
  EdgeInsets get v72 => EdgeInsets.symmetric(vertical: _spacing.p72);
  EdgeInsets get v80 => EdgeInsets.symmetric(vertical: _spacing.p80);
  EdgeInsets get v96 => EdgeInsets.symmetric(vertical: _spacing.p96);
}

/// {@macro gap}
class ThemeGapSizeData {
  /// {@macro sizes}
  const ThemeGapSizeData(this._spacing);

  final SizeData _spacing;

  /// Constant gap widths
  SizedBox get w4 => SizedBox(width: _spacing.p4);
  SizedBox get w8 => SizedBox(width: _spacing.p8);
  SizedBox get w12 => SizedBox(width: _spacing.p12);
  SizedBox get w16 => SizedBox(width: _spacing.p16);
  SizedBox get w24 => SizedBox(width: _spacing.p24);
  SizedBox get w32 => SizedBox(width: _spacing.p32);
  SizedBox get w40 => SizedBox(width: _spacing.p40);
  SizedBox get w48 => SizedBox(width: _spacing.p48);
  SizedBox get w64 => SizedBox(width: _spacing.p64);
  SizedBox get w56 => SizedBox(width: _spacing.p56);
  SizedBox get w72 => SizedBox(width: _spacing.p72);
  SizedBox get w80 => SizedBox(width: _spacing.p80);
  SizedBox get w96 => SizedBox(width: _spacing.p96);

  /// Constant wheights
  SizedBox get h4 => SizedBox(height: _spacing.p4);
  SizedBox get h8 => SizedBox(height: _spacing.p8);
  SizedBox get h12 => SizedBox(height: _spacing.p12);
  SizedBox get h16 => SizedBox(height: _spacing.p16);
  SizedBox get h24 => SizedBox(height: _spacing.p24);
  SizedBox get h32 => SizedBox(height: _spacing.p32);
  SizedBox get h40 => SizedBox(height: _spacing.p40);
  SizedBox get h48 => SizedBox(height: _spacing.p48);
  SizedBox get h56 => SizedBox(height: _spacing.p56);
  SizedBox get h64 => SizedBox(height: _spacing.p64);
  SizedBox get h72 => SizedBox(height: _spacing.p72);
  SizedBox get h80 => SizedBox(height: _spacing.p80);
  SizedBox get h96 => SizedBox(height: _spacing.p96);
}
