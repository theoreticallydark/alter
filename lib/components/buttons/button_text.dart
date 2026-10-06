import 'package:flutter/material.dart';
import '../../styles/swatches.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Visual style variants for [ButtonText].
enum ButtonType {
  /// Gray subtle background variant.
  gray,

  /// White surface background variant.
  white,

  /// High-contrast primary dark variant.
  primary,

  /// Destructive red variant.
  red,
}

/// Size variants for [ButtonText].
enum ButtonSize {
  /// Standard button height with compact padding.
  normal,

  /// Taller button height with extended vertical padding.
  large,
}

/// A text-based button adhering to Alter Design System tokens.
class ButtonText extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.1: Replaced baseBlack token reference with AlterColors.colorsGray800 swatch.
  /// v1.1.0: Added ButtonType.red destructive variant using AlterSemanticTokens.statusDanger.
  static const String version = '1.1.1';

  /// The text displayed inside the button.
  final String label;

  /// The visual style type of the button.
  final ButtonType type;

  /// The size variation determining the button's padding.
  final ButtonSize size;

  /// Callback executed when the button is tapped.
  final VoidCallback? onTap;

  /// Creates a [ButtonText] instance.
  const ButtonText({
    super.key,
    required this.label,
    this.type = ButtonType.gray,
    this.size = ButtonSize.normal,
    this.onTap,
  });

  Color get _backgroundColor {
    switch (type) {
      case ButtonType.gray:
        return AlterSemanticTokens.baseGray;
      case ButtonType.white:
        return AlterSemanticTokens.baseWhite;
      case ButtonType.primary:
        return AlterColors.colorsGray800;
      case ButtonType.red:
        return AlterSemanticTokens.statusDanger;
    }
  }

  Color get _borderColor {
    switch (type) {
      case ButtonType.gray:
      case ButtonType.white:
        return AlterSemanticTokens.stroke100;
      case ButtonType.primary:
        return AlterSemanticTokens.stroke1000;
      case ButtonType.red:
        return AlterColors.colorsRed800; // Variable: colors/red/800 (#9F0712)
    }
  }

  Color get _textColor {
    switch (type) {
      case ButtonType.gray:
      case ButtonType.white:
        return AlterSemanticTokens.textPrimary;
      case ButtonType.primary:
        return AlterSemanticTokens.textInverse;
      case ButtonType.red:
        return AlterSemanticTokens.statusDangerContrast;
    }
  }

  EdgeInsets get _padding {
    switch (size) {
      case ButtonSize.normal:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 14);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 12, vertical: 22);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        constraints: const BoxConstraints(minWidth: 64),
        padding: _padding,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _borderColor,
            width: 1,
          ),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AlterTypography.bodyLgBold.copyWith(
            color: _textColor,
          ),
        ),
      ),
    );
  }
}
