import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../status/feedback_text.dart';
import 'text_input.dart';

/// Reusable layout and decoration container for input fields in the Alter Design System.
///
/// Encapsulates Figma Specifications (Node `441:9205` & `.rightSlot` Node `454:482`):
/// - `labelBarContainer`: Top row with label on the left and dynamic character limit counter on the right (`gap: 16px`)
/// - Input Box: 64px height, 20px vertical / 24px horizontal padding, 20px border radius
/// - States:
///   - `Default`: Subtle border (`stroke200` for gray, `stroke100` for white)
///   - `Focused / Typing`: 1px `stroke1000` (`#000000`)
///   - `ReadOnly`: 1px `textDisabled` (`#99A1AF`)
///   - `Disabled`: 48% opacity (`Opacity(opacity: 0.48)`), forbidden cursor
///   - `Error`: 1px `textDanger` (`#E7000B`) border + bottom [FeedbackText]
/// - Child layout: Row with optional leading widget, core input [child], and trailing right slot.
class InputContainer extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.3: Render required asterisk in the same color as the label (AlterSemanticTokens.textSecondary).
  /// v1.0.2: Added isRequired support rendering an asterisk on label.
  /// v1.0.1: Updated readOnly border token reference to AlterSemanticTokens.textDisabled (#99A1AF).
  /// v1.0.0: Initial release of shared InputContainer.
  static const String version = '1.0.3';

  // Top Label Bar (labelBarContainer)
  final String? label;
  final bool hasLabelBar;
  final bool isRequired;
  final bool hasCharacterLimit;
  final int? characterLimit;
  final bool showCharacterLimit;
  final int currentLength;

  // Surface & State
  final TextInputVariant type;
  final bool isError;
  final bool hasFeedback;
  final String? errorText;
  final bool enabled;
  final bool readOnly;
  final bool hasFocus;

  // Tap-to-focus
  final VoidCallback? onTap;

  // Inner Slots
  final Widget? leading;
  final Widget child;
  final Widget? trailing;

  const InputContainer({
    super.key,
    this.label,
    this.hasLabelBar = true,
    this.isRequired = false,
    this.hasCharacterLimit = false,
    this.characterLimit,
    this.showCharacterLimit = true,
    this.currentLength = 0,
    this.type = TextInputVariant.gray,
    this.isError = false,
    this.hasFeedback = true,
    this.errorText,
    this.enabled = true,
    this.readOnly = false,
    this.hasFocus = false,
    this.onTap,
    this.leading,
    required this.child,
    this.trailing,
  });

  Color get _backgroundColor {
    switch (type) {
      case TextInputVariant.gray:
        return AlterSemanticTokens.baseGray;
      case TextInputVariant.white:
        return AlterSemanticTokens.baseWhite;
    }
  }

  Color get _borderColor {
    if (isError) {
      return AlterSemanticTokens.textDanger;
    }
    if (hasFocus && !readOnly && enabled) {
      return AlterSemanticTokens.stroke1000;
    }
    if (readOnly) {
      return AlterSemanticTokens.textDisabled;
    }
    switch (type) {
      case TextInputVariant.gray:
        return AlterSemanticTokens.stroke200;
      case TextInputVariant.white:
        return AlterSemanticTokens.stroke100;
    }
  }

  /// Builds the top label bar containing the label on the left and character limit counter on the right (`labelBarContainer`).
  Widget? _buildLabelBar() {
    if (!hasLabelBar) {
      return null;
    }

    final hasLabelText = label != null && label!.isNotEmpty;
    final hasLimitCounter =
        hasCharacterLimit && characterLimit != null && showCharacterLimit;

    if (!hasLabelText && !hasLimitCounter) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Label (left)
          if (hasLabelText)
            Expanded(
              child: Text(
                isRequired ? '$label *' : label!,
                style: AlterTypography.body.copyWith(
                  color: AlterSemanticTokens.textSecondary,
                ),
              ),
            )
          else
            const Spacer(),

          // Character Limit Counter (right, showCharacterLimit)
          if (hasLimitCounter) ...[
            const SizedBox(width: 16),
            Text(
              '$currentLength/$characterLimit',
              style: AlterTypography.body.copyWith(
                color: AlterSemanticTokens.textSecondary,
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final labelBar = _buildLabelBar();

    Widget inputField = GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (enabled && !readOnly) {
          onTap?.call();
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 64,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _borderColor,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (leading != null) ...[
              leading!,
              const SizedBox(width: 8),
            ],
            Expanded(
              child: child,
            ),
            ?trailing,
          ],
        ),
      ),
    );

    // Mouse cursor styling for desktop / web
    if (!enabled) {
      inputField = MouseRegion(
        cursor: SystemMouseCursors.forbidden,
        child: inputField,
      );
    } else if (readOnly) {
      inputField = MouseRegion(
        cursor: SystemMouseCursors.basic,
        child: inputField,
      );
    }

    // Disabled State: 48% opacity as per Figma
    if (!enabled) {
      inputField = Opacity(
        opacity: 0.48,
        child: inputField,
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top Label Bar (Label & Character Limit Counter)
        ?labelBar,

        // Input Field Box
        inputField,

        // Feedback Text on Error State
        if (isError &&
            hasFeedback &&
            errorText != null &&
            errorText!.isNotEmpty) ...[
          const SizedBox(height: 4),
          FeedbackText(
            text: errorText!,
            status: FeedbackTextStatus.danger,
          ),
        ],
      ],
    );
  }
}
