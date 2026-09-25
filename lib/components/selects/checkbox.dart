import 'package:flutter/material.dart';
import '../../styles/tokens.dart';

/// Selection state for [Checkbox].
enum CheckboxState {
  /// Checkbox is not checked.
  unchecked,

  /// Checkbox is in indeterminate state.
  intermediate,

  /// Checkbox is checked.
  checked,
}

/// A standard multi-state checkbox component.
class Checkbox extends StatelessWidget {
  /// Component version for reference.
  static const String version = '1.0.0';

  /// The current state of the checkbox.
  final CheckboxState state;

  /// Callback executed when checkbox state is toggled.
  final ValueChanged<CheckboxState>? onChanged;

  /// Width and height bounding size of the checkbox icon (defaults to 24.0).
  final double size;

  /// Creates a [Checkbox] instance.
  const Checkbox({
    super.key,
    this.state = CheckboxState.unchecked,
    this.onChanged,
    this.size = 24.0,
  });

  Color get _iconColor {
    switch (state) {
      case CheckboxState.unchecked:
      case CheckboxState.intermediate:
        return AlterSemanticTokens.textPrimary;
      case CheckboxState.checked:
        return AlterSemanticTokens.statusSuccess;
    }
  }

  IconData get _iconData {
    switch (state) {
      case CheckboxState.unchecked:
        return Icons.check_box_outline_blank;
      case CheckboxState.intermediate:
        return Icons.indeterminate_check_box_outlined;
      case CheckboxState.checked:
        return Icons.check_box;
    }
  }

  void _handleTap() {
    if (onChanged == null) return;
    switch (state) {
      case CheckboxState.unchecked:
        onChanged!(CheckboxState.checked);
        break;
      case CheckboxState.checked:
        onChanged!(CheckboxState.unchecked);
        break;
      case CheckboxState.intermediate:
        onChanged!(CheckboxState.checked);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onChanged != null ? _handleTap : null,
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: size,
        height: size,
        child: Center(
          child: Icon(
            _iconData,
            size: size,
            color: _iconColor,
          ),
        ),
      ),
    );
  }
}
