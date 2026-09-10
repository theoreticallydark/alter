import 'package:flutter/material.dart';
import '../../styles/swatches.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Status variants for [Toast].
enum ToastStatus {
  neutral,
  gray,
  white,
  danger,
  warning,
  caution,
  success,
}

/// Reusable Toast alert / notification banner component for the Alter Design System.
///
/// Figma Specifications (Node `342:12219`):
/// - Variants:
///   - `status=Neutral` (`342:12218`): Fill `baseBlack` (`#1E2939`), Text & Icon `textInverse` (`#FFFFFF`)
///   - `status=Gray` (`342:12220`): Fill `baseGray` (`#F9FAFB`), Border 1px `stroke200` (`#E5E7EB`), Text & Icon `textPrimary` (`#000000`)
///   - `status=White` (`342:12224`): Fill `baseWhite` (`#FFFFFF`), Border 1px `stroke100` (`#F3F4F6`), Text & Icon `textPrimary` (`#000000`)
///   - `status=Danger` (`342:12228`): Fill `colorsRed800` (`#9F0712`), Text & Icon `textInverse` (`#FFFFFF`)
///   - `status=Warning` (`342:12232`): Fill `statusWarning` / `colorsOrange800` (`#8A2C0D`), Text & Icon `textInverse` (`#FFFFFF`)
///   - `status=Caution` (`342:12236`): Fill `statusCaution` / `colorsYellow400` (`#FDC700`), Text & Icon `textPrimary` (`#000000`)
///   - `status=Success` (`342:12240`): Fill `colorsGreen800` (`#016630`), Text & Icon `textInverse` (`#FFFFFF`)
/// - Dimensions: Width 320px, Padding 10px vertical, 12px horizontal
/// - Border Radius: 16px
/// - Gap: 4px between icon and feedback text
/// - Icon: 16x16px (default `Icons.error_outline`)
/// - Typography: `Body/caption` -> [AlterTypography.caption] (Geist 12px, Regular 400, line-height 16px)
class Toast extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 342:12219.
  static const String version = '1.0.0';

  final String label;
  final ToastStatus status;
  final bool hasIcon;
  final IconData icon;
  final double? width;

  const Toast({
    super.key,
    this.label = 'Feedback Text',
    this.status = ToastStatus.neutral,
    this.hasIcon = true,
    this.icon = Icons.error_outline,
    this.width = 320.0,
  });

  Color get _backgroundColor {
    switch (status) {
      case ToastStatus.neutral:
        return AlterSemanticTokens.baseBlack; // #1E2939
      case ToastStatus.gray:
        return AlterSemanticTokens.baseGray; // #F9FAFB
      case ToastStatus.white:
        return AlterSemanticTokens.baseWhite; // #FFFFFF
      case ToastStatus.danger:
        return AlterColors.colorsRed800; // #9F0712
      case ToastStatus.warning:
        return AlterSemanticTokens.statusWarning; // #8A2C0D
      case ToastStatus.caution:
        return AlterSemanticTokens.statusCaution; // #FDC700
      case ToastStatus.success:
        return AlterColors.colorsGreen800; // #016630
    }
  }

  Color? get _borderColor {
    switch (status) {
      case ToastStatus.gray:
        return AlterSemanticTokens.stroke200; // #E5E7EB
      case ToastStatus.white:
        return AlterSemanticTokens.stroke100; // #F3F4F6
      case ToastStatus.neutral:
      case ToastStatus.danger:
      case ToastStatus.warning:
      case ToastStatus.caution:
      case ToastStatus.success:
        return null;
    }
  }

  Color get _foregroundColor {
    switch (status) {
      case ToastStatus.neutral:
      case ToastStatus.danger:
      case ToastStatus.warning:
      case ToastStatus.success:
        return AlterSemanticTokens.textInverse; // #FFFFFF
      case ToastStatus.gray:
      case ToastStatus.white:
      case ToastStatus.caution:
        return AlterSemanticTokens.textPrimary; // #000000
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: _backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: _borderColor != null
            ? Border.all(
                color: _borderColor!,
                width: 1,
              )
            : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (hasIcon) ...[
            Icon(
              icon,
              size: 16,
              color: _foregroundColor,
            ),
            const SizedBox(width: 4),
          ],
          Expanded(
            child: Text(
              label,
              style: AlterTypography.caption.copyWith(
                color: _foregroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
