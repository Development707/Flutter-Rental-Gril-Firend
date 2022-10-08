import 'package:flutter/widgets.dart';

import '../utils/string_utils.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get weight500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get weight600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get weight700 => copyWith(fontWeight: FontWeight.w700);
  TextStyle get weight800 => copyWith(fontWeight: FontWeight.w800);
  TextStyle get weight900 => copyWith(fontWeight: FontWeight.w900);

  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}

extension NullableStringExtension on String? {
  String get covertToString => this ?? '';

  String get capitalizeFirst => covertToString.capitalizeFirst;

  /// Uppercase all letter in side string
  String get allCapitalize => covertToString.allCapitalize;

  /// Capitalize each word inside string
  /// Example: your name => Your Name, your name => Your name
  String get capitalize => covertToString.capitalize;

  /// Remove all whitespace inside string
  /// Example: your name => yourname
  String get removeAllWhitespace => covertToString.removeAllWhitespace;
}

extension StringExtension on String {
  /// Uppercase first letter inside string and let the others lowercase
  /// Example: your name => Your name
  String get capitalizeFirst => StringUtils.capitalizeFirst(this);

  /// Uppercase all letter in side string
  String get allCapitalize => toUpperCase();

  /// Capitalize each word inside string
  /// Example: your name => Your Name, your name => Your name
  String get capitalize => StringUtils.capitalize(this);

  /// Remove all whitespace inside string
  /// Example: your name => yourname
  String get removeAllWhitespace => StringUtils.removeAllWhitespace(this);

  /// Discover if the String is numeric only
  bool get isNumericOnly => StringUtils.isNumericOnly(this);

  String numericOnly({bool firstWordOnly = false}) =>
      StringUtils.numericOnly(this, firstWordOnly: firstWordOnly);

  /// Discover if the String is alphanumeric only
  bool get isAlphabetOnly => StringUtils.isAlphabetOnly(this);

  /// Discover if the String is a vector
  bool get isVectorFileName => StringUtils.isVector(this);

  /// Discover if the String is a ImageFileName
  bool get isImageFileName => StringUtils.isImage(this);

  /// Discover if the String is a AudioFileName
  bool get isAudioFileName => StringUtils.isAudio(this);

  /// Discover if the String is a VideoFileName
  bool get isVideoFileName => StringUtils.isVideo(this);

  /// Discover if the String is a TxtFileName
  bool get isTxtFileName => StringUtils.isTxt(this);

  /// Discover if the String is a Document Word
  bool get isDocumentFileName => StringUtils.isWord(this);

  /// Discover if the String is a Document Excel
  bool get isExcelFileName => StringUtils.isExcel(this);

  /// Discover if the String is a Document Powerpoint
  bool get isPPTFileName => StringUtils.isPPT(this);

  /// Discover if the String is a PDF file
  bool get isPDFFileName => StringUtils.isPDF(this);

  /// Discover if the String is a HTML file
  bool get isHTMLFileName => StringUtils.isHTML(this);

  /// Discover if the String is a URL file
  bool get isURL => StringUtils.isURL(this);

  /// Discover if the String is a Email
  bool get isEmail => StringUtils.isEmail(this);

  /// Discover if the String is a Phone Number
  bool get isPhoneNumber => StringUtils.isPhoneNumber(this);

  /// Discover if the String is a DateTime
  bool get isDateTime => StringUtils.isDateTime(this);
}
