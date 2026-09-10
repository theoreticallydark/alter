import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Style variants for [TabItem].
enum TabItemType {
  gray,
  white,
}

/// A single tab item component in the Alter Design System.
///
/// Note: [TabItem] is intended to be used as a sub-component within `Tabs`
/// and is not typically used on its own.
///
/// Figma Specifications (Node `336:10501` - `.TabItem`):
/// - Variants:
///   - `state=Selected, type=Gray` (`336:10500`): Fill `baseGray` (`#F9FAFB`), Text `textPrimary` (`#000000`)
///   - `state=Selected, type=White` (`336:10504`): Fill `baseWhite` (`#FFFFFF`), Text `textPrimary` (`#000000`)
///   - `state=Default, type=Gray` (`336:10502`): Fill `transparent`, Text `textDisabled` (`#99A1AF`)
///   - `state=Default, type=White` (`336:10506`): Fill `transparent`, Text `textDisabled` (`#99A1AF`)
/// - Typography: `Body/body-lg` -> [AlterTypography.bodyLg] (Geist 16px, Regular 400, line-height 20px)
/// - Padding: 12px vertical, 16px horizontal
/// - Border Radius: 24px
class TabItem extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.2: Removed Center widget inside AnimatedContainer so TabItem strictly hugs intrinsic height (44px) rather than expanding vertically.
  /// v1.0.1: Fixed color lerp flash artifact when transitioning from transparent by preserving RGB channels and removed jarring InkWell highlight overlay.
  /// v1.0.0: Initial release matching Figma Node 336:10501 (.TabItem).
  static const String version = '1.0.2';

  final String label;
  final bool isSelected;
  final TabItemType type;
  final VoidCallback? onTap;

  const TabItem({
    super.key,
    this.label = 'Label',
    this.isSelected = false,
    this.type = TabItemType.gray,
    this.onTap,
  });

  Color get _targetColor {
    switch (type) {
      case TabItemType.gray:
        return AlterSemanticTokens.baseGray;
      case TabItemType.white:
        return AlterSemanticTokens.baseWhite;
    }
  }

  Color get _backgroundColor {
    return isSelected ? _targetColor : _targetColor.withValues(alpha: 0);
  }

  Color get _textColor {
    return isSelected
        ? AlterSemanticTokens.textPrimary
        : AlterSemanticTokens.textDisabled;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(24),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AlterTypography.bodyLg.copyWith(
            color: _textColor,
          ),
        ),
      ),
    );
  }
}
