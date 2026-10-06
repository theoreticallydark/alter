import 'package:flutter/material.dart';
import '../../styles/swatches.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// An individual clickable item within the [AlterBottomNavigationBar].
class BottomNavigationItem extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.4: Wrapped in MouseRegion and upgraded container to AnimatedContainer for smooth selection transitions across Web and Mobile.
  /// v1.0.3: Updated selected background fill to AlterSemanticTokens.baseActive (#E5E7EB) per Figma Node 1:392.
  /// v1.0.2: Replaced ui1 and ui6 tokens with AlterColors.colorsGray100 and AlterColors.colorsGray600 swatches.
  static const String version = '1.0.4';

  /// Text label displayed under the icon.
  final String label;

  /// Icon rendered in the item.
  final IconData icon;

  /// Whether this item is currently selected.
  final bool isSelected;

  /// Callback executed when the item is tapped.
  final VoidCallback? onTap;

  /// Creates a [BottomNavigationItem] instance.
  const BottomNavigationItem({
    super.key,
    required this.label,
    required this.icon,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isSelected
        ? AlterSemanticTokens.textPrimary
        : AlterSemanticTokens.textSecondary;

    final iconColor = isSelected
        ? AlterSemanticTokens.textPrimary
        : AlterColors.colorsGray600;

    final backgroundColor = isSelected
        ? AlterSemanticTokens.baseActive
        : Colors.transparent;

    return MouseRegion(
      cursor: onTap != null ? SystemMouseCursors.click : MouseCursor.defer,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          constraints: const BoxConstraints(minWidth: 64),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 24,
                color: iconColor,
              ),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AlterTypography.caption.copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
