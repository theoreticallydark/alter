import 'package:flutter/material.dart';
import '../../styles/swatches.dart';
import '../../styles/tokens.dart';

/// Style variants for [ButtonIcon].
enum ButtonIconType {
  /// Gray subtle background variant.
  gray,

  /// White surface background variant.
  white,

  /// High-contrast primary dark variant.
  primary,

  /// Destructive red variant.
  red,
}

/// A square, rounded icon button following Alter Design System tokens.
class ButtonIcon extends StatelessWidget {
  /// Component version for reference.
  /// v1.3.0: Added `ButtonIconType.red` variant matching Figma Design System.
  /// v1.2.0: Added customizable `size` (e.g. 64x64) and `iconSize` properties.
  static const String version = '1.3.0';

  /// The icon displayed inside the button.
  final IconData icon;

  /// The visual style type of the button.
  final ButtonIconType type;

  /// Whether the button is rendered in an active selected state.
  final bool isSelected;

  /// Width and height of the button container (defaults to 48.0).
  final double size;

  /// Size of the icon glyph inside the button.
  final double? iconSize;

  /// Callback triggered when the button is tapped.
  final VoidCallback? onTap;

  /// Creates a [ButtonIcon] instance.
  const ButtonIcon({
    super.key,
    this.icon = Icons.favorite_border,
    this.type = ButtonIconType.gray,
    this.isSelected = false,
    this.size = 48.0,
    this.iconSize,
    this.onTap,
  });

  Color get _backgroundColor {
    switch (type) {
      case ButtonIconType.gray:
        return AlterSemanticTokens.baseGray;
      case ButtonIconType.white:
        return AlterSemanticTokens.baseWhite;
      case ButtonIconType.primary:
        return AlterSemanticTokens.baseBlack;
      case ButtonIconType.red:
        return AlterSemanticTokens.statusDanger;
    }
  }

  Color get _borderColor {
    if (isSelected && type != ButtonIconType.primary && type != ButtonIconType.red) {
      return AlterSemanticTokens.stroke1000;
    }
    switch (type) {
      case ButtonIconType.gray:
      case ButtonIconType.white:
        return AlterSemanticTokens.stroke100;
      case ButtonIconType.primary:
        return AlterSemanticTokens.stroke1000;
      case ButtonIconType.red:
        return AlterColors.colorsRed800;
    }
  }

  Color get _iconColor {
    switch (type) {
      case ButtonIconType.gray:
      case ButtonIconType.white:
        return AlterSemanticTokens.textPrimary;
      case ButtonIconType.primary:
      case ButtonIconType.red:
        return AlterSemanticTokens.textInverse;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: _iconColor,
            size: iconSize ?? 28.0,
          ),
        ),
      ),
    );
  }
}
