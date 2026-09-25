import 'package:flutter/material.dart' hide Checkbox;
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_icon_ghost.dart';
import '../selects/checkbox.dart';
import '../selects/toggle_icon.dart';

/// A standard list tile item supporting leading/trailing slots and primary/secondary text.
class ListItem extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.1: Aligned subtitle color to `AlterSemanticTokens.textDisabled` (#99A1AF) and default right slot 2 to favorite heart toggle matching Figma node 130:4639.
  static const String version = '1.0.1';

  /// Primary headline text of the list item.
  final String title;

  /// Optional subtitle text.
  final String? subtitle;

  /// Whether the subtitle should be rendered if present.
  final bool hasSubtitle;

  /// Whether the leading slot should be rendered.
  final bool hasLeftSlot;

  /// Whether the first trailing slot should be rendered.
  final bool hasRightSlotOne;

  /// Whether the second trailing slot should be rendered.
  final bool hasRightSlotTwo;

  /// Custom widget for the leading left slot.
  final Widget? leftSlot;

  /// Custom widget for the first trailing right slot.
  final Widget? rightSlotOne;

  /// Custom widget for the second trailing right slot.
  final Widget? rightSlotTwo;

  /// Callback executed when the item is tapped.
  final VoidCallback? onTap;

  /// Creates a [ListItem] instance.
  const ListItem({
    super.key,
    this.title = 'Title of the list item',
    this.subtitle = 'Subtitle of the list item',
    this.hasSubtitle = true,
    this.hasLeftSlot = true,
    this.hasRightSlotOne = true,
    this.hasRightSlotTwo = true,
    this.leftSlot,
    this.rightSlotOne,
    this.rightSlotTwo,
    this.onTap,
  });

  Widget _buildLeftSlot() {
    return leftSlot ??
        const ButtonIconGhost(
          icon: Icons.remove_circle_outline,
          type: ButtonIconGhostType.secondary,
        );
  }

  Widget _buildRightSlotOne() {
    return rightSlotOne ??
        const Checkbox(
          state: CheckboxState.unchecked,
        );
  }

  Widget _buildRightSlotTwo() {
    return rightSlotTwo ??
        const ToggleIcon(
          icon: Icons.favorite_border,
          selectedIcon: Icons.favorite,
          state: ToggleIconState.unchecked,
        );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left Container (Left slot + Title/Subtitle)
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (hasLeftSlot) ...[
                    _buildLeftSlot(),
                    const SizedBox(width: 8),
                  ],
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AlterTypography.h2.copyWith(
                            color: AlterSemanticTokens.textPrimary,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        if (hasSubtitle && subtitle != null && subtitle!.isNotEmpty) ...[
                          const SizedBox(height: 2),
                          Text(
                            subtitle!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: AlterTypography.caption.copyWith(
                              color: AlterSemanticTokens.textDisabled,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Right slots
            if (hasRightSlotTwo || hasRightSlotOne) ...[
              const SizedBox(width: 16),
              if (hasRightSlotTwo) _buildRightSlotTwo(),
              if (hasRightSlotTwo && hasRightSlotOne) const SizedBox(width: 16),
              if (hasRightSlotOne) _buildRightSlotOne(),
            ],
          ],
        ),
      ),
    );
  }
}
