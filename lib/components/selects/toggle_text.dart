import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Style variants for [ToggleText].
enum ToggleTextType {
  gray,
  white,
}

/// Reusable ToggleText selectable chip / pill component for the Alter Design System.
///
/// Figma Specifications (Node `167:9709`):
/// - Variants:
///   - `state=Default, type=Gray` (`167:9710`): Fill `baseGray` (`#F9FAFB`), Border 1px `stroke200` (`#E5E7EB`), Text & Icon `textSecondary` (`#4A5565`)
///   - `state=Selected, type=Gray` (`167:9712`): Fill `baseGray` (`#F9FAFB`), Border 1px `stroke1000` (`#000000`), Text & Icon `textPrimary` (`#000000`)
///   - `state=Default, type=White` (`339:11896`): Fill `baseWhite` (`#FFFFFF`), Border 1px `stroke100` (`#F3F4F6`), Text & Icon `textSecondary` (`#4A5565`)
///   - `state=Selected, type=White` (`339:11898`): Fill `baseWhite` (`#FFFFFF`), Border 1px `stroke1000` (`#000000`), Text & Icon `textPrimary` (`#000000`)
/// - Dimensions: Fixed height 64px, Padding 18px vertical, 24px horizontal
/// - Border Radius: 20px
/// - Gap: 8px between icon and label
/// - Icon: 24x24px (default `Icons.face_5_outlined`)
/// - Typography: Geist 16px Regular 400 ([AlterTypography.bodyLg])
class ToggleText extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 167:9709.
  static const String version = '1.0.0';

  final String label;
  final bool isSelected;
  final bool hasIcon;
  final IconData icon;
  final ToggleTextType type;
  final ValueChanged<bool>? onChanged;
  final VoidCallback? onTap;

  const ToggleText({
    super.key,
    this.label = 'Option',
    this.isSelected = false,
    this.hasIcon = true,
    this.icon = Icons.face_5_outlined,
    this.type = ToggleTextType.gray,
    this.onChanged,
    this.onTap,
  });

  Color get _backgroundColor {
    switch (type) {
      case ToggleTextType.gray:
        return AlterSemanticTokens.baseGray;
      case ToggleTextType.white:
        return AlterSemanticTokens.baseWhite;
    }
  }

  Color get _borderColor {
    if (isSelected) {
      return AlterSemanticTokens.stroke1000;
    }
    switch (type) {
      case ToggleTextType.gray:
        return AlterSemanticTokens.stroke200;
      case ToggleTextType.white:
        return AlterSemanticTokens.stroke100;
    }
  }

  Color get _foregroundColor {
    return isSelected
        ? AlterSemanticTokens.textPrimary
        : AlterSemanticTokens.textSecondary;
  }

  void _handleTap() {
    onTap?.call();
    onChanged?.call(!isSelected);
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive = onTap != null || onChanged != null;

    return InkWell(
      onTap: isInteractive ? _handleTap : null,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasIcon) ...[
              Icon(
                icon,
                size: 24,
                color: _foregroundColor,
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: AlterTypography.bodyLg.copyWith(
                color: _foregroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
