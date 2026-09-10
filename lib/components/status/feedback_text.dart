import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Status variants for [FeedbackText].
enum FeedbackTextStatus {
  danger,
  warning,
  caution,
  success,
}

/// Reusable FeedbackText inline message / helper component in the Alter Design System.
///
/// Figma Specifications (Node `339:11991`):
/// - Variants:
///   - `status=Danger` (`339:11990`): Icon & Text `textDanger` (`#E7000B`)
///   - `status=Warning` (`339:11992`): Icon & Text `textWarning` (`#8A2C0D`)
///   - `status=Caution` (`339:11996`): Icon & Text `textCaution` (`#D08700`)
///   - `status=Success` (`339:12000`): Icon & Text `textSuccess` (`#00A63E`)
/// - Gap: 4px between icon and label
/// - Icon: 16x16px (default [Icons.error])
/// - Typography: `Body/caption` -> [AlterTypography.caption] (Geist 12px, Regular 400, line-height 16px)
/// - Layout: Row (hug content)
class FeedbackText extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 339:11991.
  static const String version = '1.0.0';

  final String text;
  final FeedbackTextStatus status;
  final bool hasIcon;
  final IconData icon;

  const FeedbackText({
    super.key,
    this.text = 'Feedback Text',
    this.status = FeedbackTextStatus.danger,
    this.hasIcon = true,
    this.icon = Icons.error,
  });

  Color get _color {
    switch (status) {
      case FeedbackTextStatus.danger:
        return AlterSemanticTokens.textDanger; // #E7000B
      case FeedbackTextStatus.warning:
        return AlterSemanticTokens.textWarning; // #8A2C0D
      case FeedbackTextStatus.caution:
        return AlterSemanticTokens.textCaution; // #D08700
      case FeedbackTextStatus.success:
        return AlterSemanticTokens.textSuccess; // #00A63E
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasIcon) ...[
          Icon(
            icon,
            size: 16,
            color: _color,
          ),
          const SizedBox(width: 4),
        ],
        Text(
          text,
          style: AlterTypography.caption.copyWith(
            color: _color,
          ),
        ),
      ],
    );
  }
}
