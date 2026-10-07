import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// A 48px height text badge / button for application headers.
///
/// Figma Specifications (Node `760:3612` - `.ApplicationHeaderButtonText`):
/// - Layout: 48px height, 12px horizontal padding, centered text.
/// - Typography: `Body/body-bold` -> [AlterTypography.bodyBold] (Geist 14px, SemiBold 600, 16px line-height).
/// - States:
///   - `state=Default`: Background `transparent`, text `textPrimary` (`#000000`).
///   - `state=Hover`: Background `baseActive` (`#E5E7EB`), text `textPrimary` (`#000000`).
///   - `state=Selected`: Background `baseActive` (`#E5E7EB`), text `textPrimary` (`#000000`).
class ApplicationHeaderButtonText extends StatefulWidget {
  /// Component version for reference.
  /// v1.0.1: Removed default 12px corner radius (default to sharp/zero radius) strictly matching Figma Node 760:3612.
  /// v1.0.0: Initial release matching Figma Node 760:3612 (.ApplicationHeaderButtonText).
  static const String version = '1.0.1';

  /// Text label string.
  final String label;

  /// Explicit hover state override.
  final bool? isHovered;

  /// Whether the button is in the selected active state.
  final bool isSelected;

  /// Height of the button container (Figma default: 48px).
  final double height;

  /// Corner radius of the button background.
  final BorderRadius? borderRadius;

  /// Callback executed when the button is tapped.
  final VoidCallback? onTap;

  /// Creates an [ApplicationHeaderButtonText] instance.
  const ApplicationHeaderButtonText({
    super.key,
    this.label = 'Label',
    this.isHovered,
    this.isSelected = false,
    this.height = 48.0,
    this.borderRadius,
    this.onTap,
  });

  @override
  State<ApplicationHeaderButtonText> createState() =>
      _ApplicationHeaderButtonTextState();
}

class _ApplicationHeaderButtonTextState
    extends State<ApplicationHeaderButtonText> {
  bool _internalHover = false;

  bool get _isActiveHover => widget.isHovered ?? _internalHover;

  bool get _isActive => widget.isSelected || _isActiveHover;

  BorderRadius get _effectiveBorderRadius =>
      widget.borderRadius ?? BorderRadius.zero;

  Color get _effectiveBackgroundColor {
    if (_isActive) {
      return AlterSemanticTokens.baseActive;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (mounted) setState(() => _internalHover = true);
      },
      onExit: (_) {
        if (mounted) setState(() => _internalHover = false);
      },
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: _effectiveBorderRadius,
        splashColor: Colors.transparent,
        highlightColor: AlterSemanticTokens.baseActive.withValues(alpha: 0.3),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          height: widget.height,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: _effectiveBackgroundColor,
            borderRadius: _effectiveBorderRadius,
          ),
          alignment: Alignment.center,
          child: Text(
            widget.label,
            style: AlterTypography.bodyBold.copyWith(
              color: AlterSemanticTokens.textPrimary,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
