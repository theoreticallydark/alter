import 'package:flutter/material.dart';
import '../../styles/swatches.dart';
import '../../styles/tokens.dart';

/// Style variants for [ButtonIcon].
enum ButtonIconType {
  /// Gray subtle background variant.
  gray,

  /// White surface background variant.
  white,

  /// Transparent borderless ghost variant.
  ghost,

  /// High-contrast primary dark variant.
  primary,

  /// Destructive red variant.
  red,
}

/// A square, rounded icon button following Alter Design System tokens.
class ButtonIcon extends StatefulWidget {
  /// Component version for reference.
  /// v1.4.0: Added ButtonIconType.ghost variant and implemented dual-interaction pattern with MouseRegion, AnimatedContainer, and resilient hover/selected states per Figma Node 130:8371.
  /// v1.3.1: Replaced baseBlack token reference with AlterColors.colorsGray800 swatch.
  /// v1.3.0: Added `ButtonIconType.red` variant matching Figma Design System.
  /// v1.2.0: Added customizable `size` (e.g. 64x64) and `iconSize` properties.
  static const String version = '1.4.0';

  /// The icon displayed inside the button.
  final IconData icon;

  /// The visual style type of the button.
  final ButtonIconType type;

  /// Whether the button is rendered in an active selected state.
  final bool isSelected;

  /// Optional manual override for the hovered state.
  final bool? isHovered;

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
    this.isHovered,
    this.size = 48.0,
    this.iconSize,
    this.onTap,
  });

  @override
  State<ButtonIcon> createState() => _ButtonIconState();
}

class _ButtonIconState extends State<ButtonIcon> {
  bool _internalHovered = false;

  bool get _isActiveState =>
      widget.isSelected || (widget.isHovered == true) || _internalHovered;

  Color get _backgroundColor {
    if (_isActiveState) {
      switch (widget.type) {
        case ButtonIconType.gray:
        case ButtonIconType.white:
        case ButtonIconType.ghost:
          return AlterSemanticTokens.baseActive; // #E5E7EB
        case ButtonIconType.primary:
          return AlterSemanticTokens.interactivePrimaryActive; // #101828
        case ButtonIconType.red:
          return AlterSemanticTokens.statusDanger; // #E7000B
      }
    }
    switch (widget.type) {
      case ButtonIconType.gray:
        return AlterSemanticTokens.baseGray;
      case ButtonIconType.white:
        return AlterSemanticTokens.baseWhite;
      case ButtonIconType.ghost:
        return Colors.transparent;
      case ButtonIconType.primary:
        return AlterColors.colorsGray800;
      case ButtonIconType.red:
        return AlterSemanticTokens.statusDanger;
    }
  }

  Color get _borderColor {
    if (widget.type == ButtonIconType.ghost) {
      return Colors.transparent;
    }
    if (_isActiveState) {
      switch (widget.type) {
        case ButtonIconType.gray:
        case ButtonIconType.white:
          return AlterSemanticTokens.baseActive;
        case ButtonIconType.ghost:
          return Colors.transparent;
        case ButtonIconType.primary:
          return AlterSemanticTokens.interactivePrimaryBorder;
        case ButtonIconType.red:
          return AlterColors.colorsRed800;
      }
    }
    switch (widget.type) {
      case ButtonIconType.gray:
      case ButtonIconType.white:
        return AlterSemanticTokens.baseBorder;
      case ButtonIconType.ghost:
        return Colors.transparent;
      case ButtonIconType.primary:
        return AlterSemanticTokens.interactivePrimaryBorder;
      case ButtonIconType.red:
        return AlterColors.colorsRed800;
    }
  }

  Color get _iconColor {
    switch (widget.type) {
      case ButtonIconType.gray:
      case ButtonIconType.white:
      case ButtonIconType.ghost:
        return AlterSemanticTokens.textPrimary;
      case ButtonIconType.primary:
        return AlterSemanticTokens.textInverse;
      case ButtonIconType.red:
        return AlterSemanticTokens.statusDangerContrast;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) {
        if (!_internalHovered) {
          setState(() {
            _internalHovered = true;
          });
        }
      },
      onExit: (_) {
        if (_internalHovered) {
          setState(() {
            _internalHovered = false;
          });
        }
      },
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          width: widget.size,
          height: widget.size,
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
              widget.icon,
              color: _iconColor,
              size: widget.iconSize ?? 28.0,
            ),
          ),
        ),
      ),
    );
  }
}
