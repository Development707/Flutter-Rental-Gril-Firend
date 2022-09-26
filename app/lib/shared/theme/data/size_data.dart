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
        p48 = mainSize * 12,
        p64 = mainSize * 16,
        p72 = mainSize * 18,
        p80 = mainSize * 20,
        p96 = mainSize * 24,
        p128 = mainSize * 32;

  final double zero;
  final double p4;
  final double p8;
  final double p12;
  final double p16;
  final double p24;
  final double p32;
  final double p48;
  final double p64;
  final double p72;
  final double p80;
  final double p96;
  final double p128;

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
  EdgeInsets get a48 => EdgeInsets.all(_spacing.p48);
  EdgeInsets get a64 => EdgeInsets.all(_spacing.p64);
  EdgeInsets get a72 => EdgeInsets.all(_spacing.p72);
  EdgeInsets get a80 => EdgeInsets.all(_spacing.p80);
  EdgeInsets get a96 => EdgeInsets.all(_spacing.p96);
  EdgeInsets get a128 => EdgeInsets.all(_spacing.p128);

  /// Horizontal insets
  EdgeInsets get h4 => EdgeInsets.symmetric(horizontal: _spacing.p4);
  EdgeInsets get h8 => EdgeInsets.symmetric(horizontal: _spacing.p8);
  EdgeInsets get h12 => EdgeInsets.symmetric(horizontal: _spacing.p12);
  EdgeInsets get h16 => EdgeInsets.symmetric(horizontal: _spacing.p16);
  EdgeInsets get h24 => EdgeInsets.symmetric(horizontal: _spacing.p24);
  EdgeInsets get h32 => EdgeInsets.symmetric(horizontal: _spacing.p32);
  EdgeInsets get h48 => EdgeInsets.symmetric(horizontal: _spacing.p48);
  EdgeInsets get h64 => EdgeInsets.symmetric(horizontal: _spacing.p64);
  EdgeInsets get h72 => EdgeInsets.symmetric(horizontal: _spacing.p72);
  EdgeInsets get h80 => EdgeInsets.symmetric(horizontal: _spacing.p80);
  EdgeInsets get h96 => EdgeInsets.symmetric(horizontal: _spacing.p96);
  EdgeInsets get h128 => EdgeInsets.symmetric(horizontal: _spacing.p128);

  /// Vertical insets
  EdgeInsets get v4 => EdgeInsets.symmetric(vertical: _spacing.p4);
  EdgeInsets get v8 => EdgeInsets.symmetric(vertical: _spacing.p8);
  EdgeInsets get v12 => EdgeInsets.symmetric(vertical: _spacing.p12);
  EdgeInsets get v16 => EdgeInsets.symmetric(vertical: _spacing.p16);
  EdgeInsets get v24 => EdgeInsets.symmetric(vertical: _spacing.p24);
  EdgeInsets get v32 => EdgeInsets.symmetric(vertical: _spacing.p32);
  EdgeInsets get v48 => EdgeInsets.symmetric(vertical: _spacing.p48);
  EdgeInsets get v64 => EdgeInsets.symmetric(vertical: _spacing.p64);
  EdgeInsets get v72 => EdgeInsets.symmetric(vertical: _spacing.p72);
  EdgeInsets get v80 => EdgeInsets.symmetric(vertical: _spacing.p80);
  EdgeInsets get v96 => EdgeInsets.symmetric(vertical: _spacing.p96);
  EdgeInsets get v128 => EdgeInsets.symmetric(vertical: _spacing.p128);

  EdgeInsets only({
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  }) =>
      EdgeInsets.only(
        left: left,
        top: top,
        right: right,
        bottom: bottom,
      );

  EdgeInsets fromLTRB([
    double left = 0.0,
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
  ]) =>
      EdgeInsets.fromLTRB(left, top, right, bottom);
}

/// {@macro gap}
class ThemeGapSizeData {
  /// {@macro sizes}
  const ThemeGapSizeData(this._spacing);

  final SizeData _spacing;

  /// Constant gap widths
  SizedBox get gapW4 => SizedBox(width: _spacing.p4);
  SizedBox get gapW8 => SizedBox(width: _spacing.p8);
  SizedBox get gapW12 => SizedBox(width: _spacing.p12);
  SizedBox get gapW16 => SizedBox(width: _spacing.p16);
  SizedBox get gapW24 => SizedBox(width: _spacing.p24);
  SizedBox get gapW32 => SizedBox(width: _spacing.p32);
  SizedBox get gapW48 => SizedBox(width: _spacing.p48);
  SizedBox get gapW64 => SizedBox(width: _spacing.p64);
  SizedBox get gapW72 => SizedBox(width: _spacing.p72);
  SizedBox get gapW80 => SizedBox(width: _spacing.p80);
  SizedBox get gapW96 => SizedBox(width: _spacing.p96);
  SizedBox get gapW128 => SizedBox(width: _spacing.p128);

  /// Constant gap heights
  SizedBox get gapH4 => SizedBox(height: _spacing.p4);
  SizedBox get gapH8 => SizedBox(height: _spacing.p8);
  SizedBox get gapH12 => SizedBox(height: _spacing.p12);
  SizedBox get gapH16 => SizedBox(height: _spacing.p16);
  SizedBox get gapH24 => SizedBox(height: _spacing.p24);
  SizedBox get gapH32 => SizedBox(height: _spacing.p32);
  SizedBox get gapH48 => SizedBox(height: _spacing.p48);
  SizedBox get gapH64 => SizedBox(height: _spacing.p64);
  SizedBox get gapH72 => SizedBox(height: _spacing.p72);
  SizedBox get gapH80 => SizedBox(height: _spacing.p80);
  SizedBox get gapH96 => SizedBox(height: _spacing.p96);
  SizedBox get gapH128 => SizedBox(height: _spacing.p128);
}
