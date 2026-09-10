import 'package:flutter/material.dart' hide Radio;
import '../../styles/tokens.dart';

/// Reusable Radio component for the Alter Design System.
///
/// Figma Specifications (Node `130:4532`):
/// - Variants:
///   - `isSelected=False` (`130:4533`): MUI `radio_button_unchecked` ([Icons.radio_button_unchecked])
///   - `isSelected=True` (`130:4535`): MUI `radio_button_checked` ([Icons.radio_button_checked])
/// - Default Dimensions: 24x24px (scalable via [size] parameter)
/// - Colors: [AlterSemanticTokens.textPrimary] (`#000000`)
class Radio<T> extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Aligned unselected color strictly to `AlterSemanticTokens.textDisabled` (#99A1AF) and allowed custom activeColor defaulting to `AlterSemanticTokens.textPrimary`.
  /// v1.0.0: Initial release matching Figma Node 130:4532.
  static const String version = '1.1.0';

  final bool isSelected;
  final T? value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<bool>? onSelectedChanged;
  final Color? activeColor;
  final double size;

  const Radio({
    super.key,
    this.isSelected = false,
    this.value,
    this.groupValue,
    this.onChanged,
    this.onSelectedChanged,
    this.activeColor,
    this.size = 24.0,
  });

  bool get _selected {
    if (value != null && groupValue != null) {
      return value == groupValue;
    }
    return isSelected;
  }

  Color get _iconColor {
    if (_selected) {
      return activeColor ?? AlterSemanticTokens.textPrimary;
    }
    return AlterSemanticTokens.textDisabled;
  }

  IconData get _iconData {
    return _selected
        ? Icons.radio_button_checked
        : Icons.radio_button_unchecked;
  }

  void _handleTap() {
    if (onChanged != null && value != null) {
      onChanged!(value);
    }
    onSelectedChanged?.call(!_selected);
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive = onChanged != null || onSelectedChanged != null;

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
