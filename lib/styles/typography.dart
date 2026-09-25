import 'package:flutter/material.dart';

/// Alter Design System Typography Tokens
abstract class AlterTypography {
  /// Package name used for asset resolution.
  static const String package = 'alter';

  /// Primary font family name for Geist.
  static const String geistFont = 'Geist';

  /// Accent serif font family name for Instrument Serif.
  static const String instrumentSerifFont = 'InstrumentSerif';

  // Display Styles
  /// Display XL (56px Regular, line-height 1.25).
  static const TextStyle displayXl = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 56,
    fontWeight: FontWeight.w400,
    height: 1.25,
  );

  /// Display LG (48px Regular, line-height 1.375).
  static const TextStyle displayLg = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 48,
    fontWeight: FontWeight.w400,
    height: 1.375,
  );

  /// Display (40px Regular, line-height 1.3).
  static const TextStyle display = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 40,
    fontWeight: FontWeight.w400,
    height: 1.300,
  );

  /// Display Bold (40px Bold, line-height 1.3).
  static const TextStyle displayBold = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    height: 1.300,
  );

  // Serif Accent Style
  /// Heading 1 Serif Italic (24px Regular Italic, line-height 32px).
  static const TextStyle h1Serif = TextStyle(
    fontFamily: instrumentSerifFont,
    package: package,
    fontSize: 24,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.italic,
    height: 32 / 24,
  );

  /// Exact Figma token alias for [h1Serif].
  static const TextStyle hStyle = h1Serif;

  // Heading Styles
  /// Heading 1 Bold (30px Bold, line-height 36px).
  static const TextStyle h1Bold = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 30,
    fontWeight: FontWeight.w700,
    height: 36 / 30,
  );

  /// Heading 1 (30px Regular, line-height 36px).
  static const TextStyle h1 = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 30,
    fontWeight: FontWeight.w400,
    height: 36 / 30,
  );

  /// Heading 2 (20px SemiBold, line-height 24px).
  static const TextStyle h2 = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 24 / 20,
  );

  /// Heading 3 (18px SemiBold, line-height 24px).
  static const TextStyle h3 = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 24 / 18,
  );

  /// Heading 4 (16px SemiBold, line-height 20px).
  static const TextStyle h4 = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 20 / 16,
  );

  /// Heading 4 Bold (16px Bold, line-height 20px).
  static const TextStyle h4Bold = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    height: 20 / 16,
  );

  /// Heading 5 (14px SemiBold, line-height 16px).
  static const TextStyle h5 = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 16 / 14,
  );

  /// Heading 5 Bold (14px Bold, line-height 16px).
  static const TextStyle h5Bold = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 14,
    fontWeight: FontWeight.w700,
    height: 16 / 14,
  );

  // Body Styles
  /// Body Large (16px Regular, line-height 20px).
  static const TextStyle bodyLg = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 20 / 16,
  );

  /// Body Large Bold (16px SemiBold, line-height 20px).
  static const TextStyle bodyLgBold = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 20 / 16,
  );

  /// Body (14px Regular, line-height 16px).
  static const TextStyle body = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 16 / 14,
  );

  /// Body Bold (14px SemiBold, line-height 16px).
  static const TextStyle bodyBold = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    height: 16 / 14,
  );

  /// Caption (12px Regular, line-height 16px).
  static const TextStyle caption = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
  );

  /// Caption Bold (12px SemiBold, line-height 16px).
  static const TextStyle captionBold = TextStyle(
    fontFamily: geistFont,
    package: package,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
  );
}
