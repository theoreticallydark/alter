import 'package:flutter/material.dart' hide Switch;
import '../../styles/tokens.dart';

/// Reusable Switch toggle component for the Alter Design System.
///
/// Figma Specifications (Node `167:9665`):
/// - Variants:
///   - `isSelected=False` (`167:9666`): MUI `toggle_off` ([Icons.toggle_off])
///   - `isSelected=True` (`167:9668`): MUI `toggle_on` ([Icons.toggle_on])
/// - Default Dimensions: 24x24px (scalable via [size] parameter)
/// - Colors: [AlterSemanticTokens.textPrimary] (`#000000`)
class Switch extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Aligned unselected color strictly to `AlterSemanticTokens.textDisabled` (#99A1AF) and allowed custom activeColor defaulting to `AlterSemanticTokens.textPrimary`.
  /// v1.0.0: Initial release matching Figma Node 167:9665.
  static const String version = '1.1.0';

  final bool isSelected;
  final ValueChanged<bool>? onChanged;
  final Color? activeColor;
  final double size;

  const Switch({
    super.key,
    this.isSelected = false,
    this.onChanged,
    this.activeColor,
    this.size = 24.0,
  });

  Color get _iconColor {
    if (isSelected) {
      return activeColor ?? AlterSemanticTokens.textPrimary;
    }
    return AlterSemanticTokens.textDisabled;
  }

  IconData get _iconData {
    return isSelected
        ? Icons.toggle_on
        : Icons.toggle_off;
  }

  void _handleTap() {
    onChanged?.call(!isSelected);
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive = onChanged != null;

    return InkWell(
      onTap: isInteractive ? _handleTap : null,
      borderRadius: BorderRadius.circular(size / 2),
      child: SizedBox(
        width: size,
        height: size,
        child: Icon(
          _iconData,
          size: size,
          color: _iconColor,
        ),
      ),
    );
  }
}
