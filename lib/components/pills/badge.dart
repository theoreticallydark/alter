import 'package:flutter/material.dart' hide Badge;
import '../../styles/swatches.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Color variants for [Badge] component matching Alter Design System.
enum BadgeColor {
  /// Base subtle gray variant with 1px border.
  baseGray,

  /// Base elevated white variant with 1px border.
  baseWhite,

  /// Base high-contrast primary variant with 1px border.
  basePrimary,

  /// Gray color variant.
  gray,

  /// White surface color variant.
  white,

  /// Red color variant.
  red,

  /// Orange color variant.
  orange,

  /// Yellow color variant.
  yellow,

  /// Green color variant.
  green,

  /// Teal color variant.
  teal,

  /// Indigo color variant.
  indigo,

  /// Purple color variant.
  purple,

  /// Pink color variant.
  pink,

  /// Amber color variant.
  amber,

  /// Lime color variant.
  lime,

  /// Emerald color variant.
  emerald,

  /// Cyan color variant.
  cyan,

  /// Sky blue color variant.
  sky,

  /// Brand blue color variant.
  brand,

  /// Slate color variant.
  slate,

  /// Zinc color variant.
  zinc,
}

/// Reusable Badge component for the Alter Design System.
///
/// Figma Specifications (Node `124:4003`):
/// - Variants: 21 color variants (baseGray, baseWhite, basePrimary, gray, white, red, orange, yellow, green, teal, indigo, purple, pink, amber, lime, emerald, cyan, sky, brand, slate, zinc)
/// - Typography: Body/caption (Geist 12px, Regular 400, line-height 16px)
/// - Padding: 6px vertical, 8px horizontal
/// - Border Radius: 12px
/// - Gap: 4px
/// - Content container: row with 0px vertical, 2px horizontal padding, 2px gap
/// - Left & Right Icons: 16x16px
/// - Action Button: 16x16px container with 6px border radius, containing 12x12px clear icon
class Badge extends StatelessWidget {
  /// Component version for reference.
  /// v1.2.0: Added baseGray, baseWhite, and basePrimary color variants with 1px border strokes, and wrapped dismiss action button in MouseRegion pointer handler per Figma Node 124:4003.
  /// v1.1.0: Removed body tap interaction and isInteractive property; Badge now exclusively uses hasAction and onActionTap for action button interactions.
  /// v1.0.2: Decoupled main badge onTap from action button onActionTap with independent hit regions.
  /// v1.0.1: Fixed `hasAction`, `hasLeftIcon`, and `hasRightIcon` to strictly respect their boolean visibility flags.
  /// v1.0.0: Initial release matching Figma Node 124:4003.
  static const String version = '1.2.0';

  /// Text string displayed inside the badge.
  final String label;

  /// The color swatch variant applied to background, text, and border.
  final BadgeColor color;

  /// Whether the leading left icon should be rendered.
  final bool hasLeftIcon;

  /// The icon data for the leading icon.
  final IconData? leftIcon;

  /// Whether the trailing right icon should be rendered.
  final bool hasRightIcon;

  /// The icon data for the trailing icon.
  final IconData? rightIcon;

  /// Whether the trailing action button should be rendered.
  final bool hasAction;

  /// Custom icon data for the action button (defaults to clear/close).
  final IconData? actionIcon;

  /// Callback executed when the trailing action button is pressed.
  final VoidCallback? onActionTap;

  /// Creates a [Badge] instance.
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
      case BadgeColor.baseGray:
        return AlterSemanticTokens.baseGray;
      case BadgeColor.baseWhite:
        return AlterSemanticTokens.baseWhite;
      case BadgeColor.basePrimary:
        return AlterColors.colorsGray800;
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

  Color? get _borderColor {
    switch (color) {
      case BadgeColor.baseGray:
      case BadgeColor.baseWhite:
        return AlterSemanticTokens.baseBorder;
      case BadgeColor.basePrimary:
        return AlterSemanticTokens.interactivePrimaryBorder;
      default:
        return null;
    }
  }

  Color get _foregroundColor {
    switch (color) {
      case BadgeColor.baseGray:
      case BadgeColor.baseWhite:
        return AlterColors.colorsGray800;
      case BadgeColor.basePrimary:
        return AlterSemanticTokens.textInverse;
      case BadgeColor.gray:
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
    final borderColor = _borderColor;

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
        border: borderColor != null
            ? Border.all(
                color: borderColor,
                width: 1,
              )
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          contentWidget,
          if (hasAction) ...[
            const SizedBox(width: 4),
            MouseRegion(
              cursor: onActionTap != null
                  ? SystemMouseCursors.click
                  : MouseCursor.defer,
              child: InkWell(
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
            ),
          ],
        ],
      ),
    );
  }
}
