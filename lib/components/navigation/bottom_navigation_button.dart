import 'package:flutter/material.dart';
import '../../styles/tokens.dart';

/// Style variants for [BottomNavigationButton].
enum BottomNavigationButtonType {
  /// Prominent dark primary button.
  primary,

  /// Neutral gray secondary button.
  secondary,
}

/// A circular action button designed to accompany bottom navigation bars.
class BottomNavigationButton extends StatelessWidget {
  /// Component version for reference.
  static const String version = '1.0.1';

  /// Icon rendered inside the button.
  final IconData icon;

  /// Visual style variant of the button.
  final BottomNavigationButtonType type;

  /// Callback executed when the button is tapped.
  final VoidCallback? onTap;

  /// Creates a [BottomNavigationButton] instance.
  const BottomNavigationButton({
    super.key,
    this.icon = Icons.add,
    this.type = BottomNavigationButtonType.secondary,
    this.onTap,
  });

  Color get _backgroundColor {
    switch (type) {
      case BottomNavigationButtonType.primary:
        return AlterSemanticTokens.baseBlack;
      case BottomNavigationButtonType.secondary:
        return AlterSemanticTokens.baseGray;
    }
  }

  Color get _borderColor {
    switch (type) {
      case BottomNavigationButtonType.primary:
        return AlterSemanticTokens.stroke1000;
      case BottomNavigationButtonType.secondary:
        return AlterSemanticTokens.stroke100;
    }
  }

  Color get _iconColor {
    switch (type) {
      case BottomNavigationButtonType.primary:
        return AlterSemanticTokens.textInverse;
      case BottomNavigationButtonType.secondary:
        return AlterSemanticTokens.textPrimary;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 72,
        height: 72,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: _borderColor,
            width: 1,
          ),
        ),
        child: Center(
          child: Icon(
            icon,
            color: _iconColor,
            size: 28,
          ),
        ),
      ),
    );
  }
}
