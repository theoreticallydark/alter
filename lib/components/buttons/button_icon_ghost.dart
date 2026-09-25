import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/swatches.dart';

/// Color style variants for [ButtonIconGhost].
enum ButtonIconGhostType {
  /// Primary high-contrast text color.
  primary,

  /// Secondary muted text color.
  secondary,

  /// Destructive red accent color.
  red,
}

/// A borderless, background-free icon button supporting gestures.
class ButtonIconGhost extends StatelessWidget {
  /// Component version for reference.
  static const String version = '1.1.0'; // Added onLongPress and gesture hooks for tap-and-hold continuous interaction

  /// The icon displayed inside the button.
  final IconData icon;

  /// The visual style type of the ghost button.
  final ButtonIconGhostType type;

  /// The bounding size and icon size of the button (defaults to 24.0).
  final double size;

  /// Callback executed when tapped.
  final VoidCallback? onTap;

  /// Callback executed when long-pressed.
  final VoidCallback? onLongPress;

  /// Callback executed on pointer down.
  final GestureTapDownCallback? onTapDown;

  /// Callback executed on pointer release.
  final GestureTapUpCallback? onTapUp;

  /// Callback executed if tap is cancelled.
  final GestureTapCancelCallback? onTapCancel;

  /// Creates a [ButtonIconGhost] instance.
  const ButtonIconGhost({
    super.key,
    required this.icon,
    this.type = ButtonIconGhostType.primary,
    this.size = 24.0,
    this.onTap,
    this.onLongPress,
    this.onTapDown,
    this.onTapUp,
    this.onTapCancel,
  });

  Color get _iconColor {
    switch (type) {
      case ButtonIconGhostType.primary:
        return AlterSemanticTokens.textPrimary; // VariableID:103:9007 (black)
      case ButtonIconGhostType.secondary:
        return AlterSemanticTokens.textSecondary; // VariableID:103:9014 (gray600)
      case ButtonIconGhostType.red:
        return AlterColors.colorsRed600; // VariableID:103:9010 (red600)
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        borderRadius: BorderRadius.circular(size / 2),
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Icon(
              icon,
              size: size,
              color: _iconColor,
            ),
          ),
        ),
      ),
    );
  }
}
