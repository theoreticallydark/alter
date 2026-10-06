import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Style variants for [TabItem].
enum TabItemType {
  /// Gray subtle background variant when selected.
  gray,

  /// White surface background variant when selected.
  white,
}

/// A single tab item component in the Alter Design System.
///
/// Note: [TabItem] is intended to be used as a sub-component within `Tabs`
/// and can also be used individually.
///
/// Figma Specifications (Node `336:10501` - `.TabItem`):
/// - Variants:
///   - `state=Active, type=Gray` (`336:10500`): Fill `baseNeutral`/`baseGray` (`#F9FAFB`), Text/Icon `textPrimary` (`#000000`)
///   - `state=Active, type=White` (`336:10504`): Fill `baseWhite` (`#FFFFFF`), Text/Icon `textPrimary` (`#000000`)
///   - `state=Default, type=Gray` (`336:10502`): Fill `transparent`, Text/Icon `textDisabled` (`#99A1AF`)
///   - `state=Default, type=White` (`336:10506`): Fill `transparent`, Text/Icon `textDisabled` (`#99A1AF`)
/// - Typography: `Body/body-lg` -> [AlterTypography.bodyLg] (Geist 16px, Regular 400, line-height 20px)
/// - Padding: 12px vertical, 16px horizontal
/// - Gap: 8px between icon and label
/// - Border Radius: 24px
class TabItem extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Aligned with live Figma Node 336:10501 (.TabItem): Added hasIcon (default false), icon (default Icons.face_5_outlined), iconWidget, and hasLabel (default true) supporting icon-only, label-only, and icon+label composite tabs.
  /// v1.0.2: Removed Center widget inside AnimatedContainer so TabItem strictly hugs intrinsic height (44px) rather than expanding vertically.
  /// v1.0.1: Fixed color lerp flash artifact when transitioning from transparent by preserving RGB channels and removed jarring InkWell highlight overlay.
  /// v1.0.0: Initial release matching Figma Node 336:10501 (.TabItem).
  static const String version = '1.1.0';

  /// Text label displayed in the tab.
  final String label;

  /// Whether the text label should be visible.
  final bool hasLabel;

  /// Whether the tab item displays a leading icon.
  final bool hasIcon;

  /// Icon data for the leading icon when [hasIcon] is true.
  final IconData? icon;

  /// Custom icon widget override.
  final Widget? iconWidget;

  /// Whether this tab is currently active/selected.
  final bool isSelected;

  /// Visual theme style type.
  final TabItemType type;

  /// Callback executed when the tab item is tapped.
  final VoidCallback? onTap;

  /// Creates a [TabItem] instance.
  const TabItem({
    super.key,
    this.label = 'Label',
    this.hasLabel = true,
    this.hasIcon = false,
    this.icon = Icons.face_5_outlined,
    this.iconWidget,
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

  Widget _buildIcon() {
    if (iconWidget != null) {
      return IconTheme(
        data: IconThemeData(
          color: _textColor,
          size: 24,
        ),
        child: iconWidget!,
      );
    }
    if (icon != null) {
      return Icon(
        icon,
        size: 24,
        color: _textColor,
      );
    }
    return const SizedBox.shrink();
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
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasIcon) _buildIcon(),
            if (hasIcon && hasLabel) const SizedBox(width: 8),
            if (hasLabel)
              Text(
                label,
                textAlign: TextAlign.center,
                style: AlterTypography.bodyLg.copyWith(
                  color: _textColor,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
