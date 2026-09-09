import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_icon_ghost.dart';

/// Style variants for [AdvancedPill].
enum AdvancedPillType {
  gray,
  white,
}

/// Reusable AdvancedPill component for the Alter Design System.
///
/// Figma Specifications (Node `349:15869`):
/// - Variants:
///   - `type=Gray` (`130:8539`): Fill `baseGray` (`#F9FAFB`), Border 1px `stroke200` (`#E5E7EB`)
///   - `type=White` (`349:15870`): Fill `baseWhite` (`#FFFFFF`), Border 1px `stroke100` (`#F3F4F6`)
/// - Border Radius: 24px
/// - Padding: 12px vertical, 16px horizontal
/// - Gap: 8px
/// - Left Slot: `ButtonIconGhost` (24x24, `ButtonIconGhostType.secondary`), visible when `hasLeftSlot` (default: true)
/// - Right Slot: `ButtonIconGhost` (24x24, `ButtonIconGhostType.secondary`), visible when `hasRightSlot` (default: false)
/// - Title: Geist 12px SemiBold 600 (`AlterTypography.captionBold`), Text `textPrimary` (`#000000`)
/// - Subtitle: Geist 12px Regular 400 (`AlterTypography.caption`), Text `textDisabled` (`#99A1AF`)
class AdvancedPill extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Removed onTap, onLeftTap, onRightTap. Slots now directly receive child widgets (such as ButtonIconGhost) that manage their own interactions. Set generic default strings for title and subtitle.
  /// v1.0.0: Initial release matching Figma Node 349:15869.
  static const String version = '1.1.0';

  final String title;
  final String? subtitle;
  final AdvancedPillType type;
  final bool hasLeftSlot;
  final IconData? leftIcon;
  final Widget? leftSlot;
  final bool hasRightSlot;
  final IconData? rightIcon;
  final Widget? rightSlot;

  const AdvancedPill({
    super.key,
    this.title = 'Title',
    this.subtitle = 'Subtitle',
    this.type = AdvancedPillType.gray,
    this.hasLeftSlot = true,
    this.leftIcon,
    this.leftSlot,
    this.hasRightSlot = false,
    this.rightIcon,
    this.rightSlot,
  });

  Color get _backgroundColor {
    switch (type) {
      case AdvancedPillType.gray:
        return AlterSemanticTokens.baseGray;
      case AdvancedPillType.white:
        return AlterSemanticTokens.baseWhite;
    }
  }

  Color get _borderColor {
    switch (type) {
      case AdvancedPillType.gray:
        return AlterSemanticTokens.stroke200;
      case AdvancedPillType.white:
        return AlterSemanticTokens.stroke100;
    }
  }

  Widget _buildLeftSlot() {
    if (leftSlot != null) return leftSlot!;
    return ButtonIconGhost(
      icon: leftIcon ?? Icons.add_circle_outline,
      type: ButtonIconGhostType.secondary,
      size: 24,
    );
  }

  Widget _buildRightSlot() {
    if (rightSlot != null) return rightSlot!;
    return ButtonIconGhost(
      icon: rightIcon ?? Icons.add_circle_outline,
      type: ButtonIconGhostType.secondary,
      size: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: _borderColor,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasLeftSlot) ...[
            _buildLeftSlot(),
            const SizedBox(width: 8),
          ],
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AlterTypography.captionBold.copyWith(
                  color: AlterSemanticTokens.textPrimary,
                ),
              ),
              if (subtitle != null && subtitle!.isNotEmpty) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: AlterTypography.caption.copyWith(
                    color: AlterSemanticTokens.textDisabled,
                  ),
                ),
              ],
            ],
          ),
          if (hasRightSlot) ...[
            const SizedBox(width: 8),
            _buildRightSlot(),
          ],
        ],
      ),
    );
  }
}
