import 'package:flutter/material.dart' hide Badge;
import '../../styles/swatches.dart';
import '../../styles/typography.dart';

/// Color variants for [Badge] component matching Alter Design System.
enum BadgeColor {
  gray,
  white,
  red,
  orange,
  yellow,
  green,
  teal,
  indigo,
  purple,
  pink,
  amber,
  lime,
  emerald,
  cyan,
  sky,
  brand,
  slate,
  zinc,
}

/// Reusable Badge component for the Alter Design System.
///
/// Figma Specifications (Node `124:4003`):
/// - Variants: 18 color variants (gray, white, red, orange, yellow, green, teal, indigo, purple, pink, amber, lime, emerald, cyan, sky, brand, slate, zinc)
/// - Typography: Body/caption (Geist 12px, Regular 400, line-height 16px)
/// - Padding: 6px vertical, 8px horizontal
/// - Border Radius: 12px
/// - Gap: 4px
/// - Content container: row with 0px vertical, 2px horizontal padding, 2px gap
/// - Left & Right Icons: 16x16px
/// - Action Button: 16x16px container with 6px border radius, containing 12x12px clear icon
class Badge extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Removed body tap interaction and isInteractive property; Badge now exclusively uses hasAction and onActionTap for action button interactions.
  /// v1.0.2: Decoupled main badge onTap from action button onActionTap with independent hit regions.
  /// v1.0.1: Fixed `hasAction`, `hasLeftIcon`, and `hasRightIcon` to strictly respect their boolean visibility flags.
  /// v1.0.0: Initial release matching Figma Node 124:4003.
  static const String version = '1.1.0';

  final String label;
  final BadgeColor color;
  final bool hasLeftIcon;
  final IconData? leftIcon;
  final bool hasRightIcon;
  final IconData? rightIcon;
  final bool hasAction;
  final IconData? actionIcon;
  final VoidCallback? onActionTap;

  const Badge({
    super.key,
    this.label = 'Label',
    this.color = BadgeColor.gray,
    this.hasLeftIcon = false,
    this.leftIcon,
    this.hasRightIcon = false,
    this.rightIcon,
    this.hasAction = false,
    this.actionIcon,
    this.onActionTap,
  });

  Color get _backgroundColor {
    switch (color) {
      case BadgeColor.gray:
        return AlterColors.colorsGray100;
      case BadgeColor.white:
        return AlterColors.white;
      case BadgeColor.red:
        return AlterColors.colorsRed100;
      case BadgeColor.orange:
        return AlterColors.colorsOrange100;
      case BadgeColor.yellow:
        return AlterColors.colorsYellow100;
      case BadgeColor.green:
        return AlterColors.colorsGreen100;
      case BadgeColor.teal:
        return AlterColors.colorsTeal100;
      case BadgeColor.indigo:
        return AlterColors.colorsIndigo100;
      case BadgeColor.purple:
        return AlterColors.colorsPurple100;
      case BadgeColor.pink:
        return AlterColors.colorsPink100;
      case BadgeColor.amber:
        return AlterColors.colorsAmber100;
      case BadgeColor.lime:
        return AlterColors.colorsLime100;
      case BadgeColor.emerald:
        return AlterColors.colorsEmerald100;
      case BadgeColor.cyan:
        return AlterColors.colorsCyan100;
      case BadgeColor.sky:
        return AlterColors.colorsSky100;
      case BadgeColor.brand:
        return AlterColors.colorsBrand100;
      case BadgeColor.slate:
        return AlterColors.colorsSlate100;
      case BadgeColor.zinc:
        return AlterColors.colorsZinc100;
    }
  }

  Color get _foregroundColor {
    switch (color) {
      case BadgeColor.gray:
        return AlterColors.colorsGray800;
      case BadgeColor.white:
        return AlterColors.colorsGray800;
      case BadgeColor.red:
        return AlterColors.colorsRed800;
      case BadgeColor.orange:
        return AlterColors.colorsOrange800;
      case BadgeColor.yellow:
        return AlterColors.colorsYellow800;
      case BadgeColor.green:
        return AlterColors.colorsGreen800;
      case BadgeColor.teal:
        return AlterColors.colorsTeal800;
      case BadgeColor.indigo:
        return AlterColors.colorsIndigo800;
      case BadgeColor.purple:
        return AlterColors.colorsPurple800;
      case BadgeColor.pink:
        return AlterColors.colorsPink800;
      case BadgeColor.amber:
        return AlterColors.colorsAmber800;
      case BadgeColor.lime:
        return AlterColors.colorsLime800;
      case BadgeColor.emerald:
        return AlterColors.colorsEmerald800;
      case BadgeColor.cyan:
        return AlterColors.colorsCyan800;
      case BadgeColor.sky:
        return AlterColors.colorsSky800;
      case BadgeColor.brand:
        return AlterColors.colorsBrand800;
      case BadgeColor.slate:
        return AlterColors.colorsSlate800;
      case BadgeColor.zinc:
        return AlterColors.colorsZinc800;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fgColor = _foregroundColor;

    final contentWidget = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasLeftIcon) ...[
            Icon(
              leftIcon ?? Icons.grid_view,
              size: 16,
              color: fgColor,
            ),
            const SizedBox(width: 2),
          ],
          Text(
            label,
            style: AlterTypography.caption.copyWith(
              color: fgColor,
            ),
          ),
          if (hasRightIcon) ...[
            const SizedBox(width: 2),
            Icon(
              rightIcon ?? Icons.grid_view,
              size: 16,
              color: fgColor,
            ),
          ],
        ],
      ),
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          contentWidget,
          if (hasAction) ...[
            const SizedBox(width: 4),
            InkWell(
              onTap: onActionTap,
              borderRadius: BorderRadius.circular(6),
              child: SizedBox(
                width: 16,
                height: 16,
                child: Center(
                  child: Icon(
                    actionIcon ?? Icons.close,
                    size: 12,
                    color: fgColor,
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
