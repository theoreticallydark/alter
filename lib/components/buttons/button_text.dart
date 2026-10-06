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
class ButtonText extends StatefulWidget {
  /// Component version for reference.
  /// v1.3.2: Refined hasIcon visibility logic to honor explicit false overrides and dynamically infer icon rendering per Figma Node 130:8382.
  /// v1.3.1: Enhanced hover state tracking using explicit MouseRegion and resilient boolean override check.
  /// v1.3.0: Added interactive and explicit Hover state handling along with Selected state, ensuring baseWhite default background for ButtonType.white.
  /// v1.2.0: Aligned padding (Normal: 16x12, Large: 16x20), border tokens (baseBorder, interactivePrimaryBorder), added isSelected state and leading icon slot per Figma Node 130:8382.
  /// v1.1.1: Replaced baseBlack token reference with AlterColors.colorsGray800 swatch.
  /// v1.1.0: Added ButtonType.red destructive variant using AlterSemanticTokens.statusDanger.
  static const String version = '1.3.2';

  /// The text displayed inside the button.
  final String label;

  /// The visual style type of the button.
  final ButtonType type;

  /// The size variation determining the button's padding.
  final ButtonSize size;

  /// Whether the button is rendered in an active selected state.
  final bool isSelected;

  /// Optional manual override for the hovered state.
  final bool? isHovered;

  /// Whether the leading icon should be rendered.
  /// If `null`, icon visibility is automatically inferred from `icon` or `iconWidget`.
  final bool? hasIcon;

  /// Optional icon data for the leading icon (24x24px).
  final IconData? icon;

  /// Optional custom widget for the icon slot.
  final Widget? iconWidget;

  /// Callback executed when the button is tapped.
  final VoidCallback? onTap;

  /// Creates a [ButtonText] instance.
  const ButtonText({
    super.key,
    required this.label,
    this.type = ButtonType.gray,
    this.size = ButtonSize.normal,
    this.isSelected = false,
    this.isHovered,
    this.hasIcon,
    this.icon,
    this.iconWidget,
    this.onTap,
  });

  @override
  State<ButtonText> createState() => _ButtonTextState();
}

class _ButtonTextState extends State<ButtonText> {
  bool _internalHovered = false;

  bool get _isActiveState =>
      widget.isSelected || (widget.isHovered == true) || _internalHovered;

  Color get _backgroundColor {
    if (_isActiveState) {
      switch (widget.type) {
        case ButtonType.gray:
        case ButtonType.white:
          return AlterSemanticTokens.baseActive; // #E5E7EB
        case ButtonType.primary:
          return AlterSemanticTokens.interactivePrimaryActive; // #101828
        case ButtonType.red:
          return AlterColors.colorsRed800; // #9F0712
      }
    }
    switch (widget.type) {
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
    if (_isActiveState) {
      switch (widget.type) {
        case ButtonType.gray:
        case ButtonType.white:
          return AlterSemanticTokens.baseActive;
        case ButtonType.primary:
          return AlterSemanticTokens.interactivePrimaryBorder;
        case ButtonType.red:
          return AlterColors.colorsRed800;
      }
    }
    switch (widget.type) {
      case ButtonType.gray:
      case ButtonType.white:
        return AlterSemanticTokens.baseBorder;
      case ButtonType.primary:
        return AlterSemanticTokens.interactivePrimaryBorder;
      case ButtonType.red:
        return AlterColors.colorsRed800;
    }
  }

  Color get _textColor {
    switch (widget.type) {
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
    switch (widget.size) {
      case ButtonSize.normal:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
      case ButtonSize.large:
        return const EdgeInsets.symmetric(horizontal: 16, vertical: 20);
    }
  }

  Widget? get _renderedIcon {
    final bool showIcon =
        widget.hasIcon ?? (widget.icon != null || widget.iconWidget != null);
    if (!showIcon) {
      return null;
    }
    if (widget.iconWidget != null) {
      return widget.iconWidget;
    }
    return Icon(
      widget.icon ?? Icons.face_5_outlined,
      size: 24,
      color: _textColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    final leadingIcon = _renderedIcon;

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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (leadingIcon != null) ...[
                leadingIcon,
                const SizedBox(width: 4),
              ],
              Text(
                widget.label,
                textAlign: TextAlign.center,
                style: AlterTypography.bodyLgBold.copyWith(
                  color: _textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


