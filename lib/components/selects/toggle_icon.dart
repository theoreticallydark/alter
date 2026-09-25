import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/swatches.dart';

/// State of a [ToggleIcon].
enum ToggleIconState {
  /// Unchecked / inactive state.
  unchecked,

  /// Checked / active state.
  checked,
}

/// A toggling icon button (e.g. favorite star or heart).
class ToggleIcon extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Added `icon` (default border), `selectedIcon` (filled), `isSelected` / `onSelectedChanged`, and `activeColor` following MUI convention with graceful fallback.
  static const String version = '1.1.0';

  /// Boolean active selection state.
  final bool isSelected;

  /// Optional enum state representing checked/unchecked.
  final ToggleIconState? state;

  /// Callback executed with boolean state when toggled.
  final ValueChanged<bool>? onSelectedChanged;

  /// Callback executed with [ToggleIconState] when toggled.
  final ValueChanged<ToggleIconState>? onChanged;

  /// Default icon displayed when unselected.
  final IconData icon;

  /// Icon displayed when selected (falls back to [icon] if not provided).
  final IconData? selectedIcon;

  /// Custom active color when toggled on.
  final Color? activeColor;

  /// Custom inactive color when toggled off.
  final Color? inactiveColor;

  /// Dimensions (width & height) of the toggle button container (defaults to 24.0).
  final double size;

  /// Creates a [ToggleIcon] instance.
  const ToggleIcon({
    super.key,
    this.isSelected = false,
    this.state,
    this.onSelectedChanged,
    this.onChanged,
    this.icon = Icons.star_border,
    this.selectedIcon = Icons.star,
    this.activeColor,
    this.inactiveColor,
    this.size = 24.0,
  });

  bool get _selected => state != null ? state == ToggleIconState.checked : isSelected;

  Color get _iconColor {
    if (_selected) {
      return activeColor ?? AlterColors.colorsPink600; // VariableID:1:194 (pink600 #E60076)
    }
    return inactiveColor ?? AlterSemanticTokens.textSecondary; // VariableID:103:9014 (gray600)
  }

  IconData get _iconData {
    if (_selected) {
      // Graceful fallback to `icon` if `selectedIcon` is not provided
      return selectedIcon ?? icon;
    }
    return icon;
  }

  void _handleTap() {
    final next = !_selected;
    onSelectedChanged?.call(next);
    onChanged?.call(next ? ToggleIconState.checked : ToggleIconState.unchecked);
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive = onSelectedChanged != null || onChanged != null;
    return InkWell(
      onTap: isInteractive ? _handleTap : null,
      borderRadius: BorderRadius.circular(size / 2),
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
