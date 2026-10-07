import 'package:flutter/material.dart' hide Divider;
import '../../styles/tokens.dart';

/// A 1px separator line for separating content in the Alter Design System.
///
/// Figma Specifications (Node `559:916` - `Divider`):
/// - Dimensions: 1px height (`thickness: 1.0`), `#E5E7EB` stroke/fill ([AlterSemanticTokens.stroke200]).
/// - Orientation: Supports horizontal (default) and vertical orientations.
class Divider extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.1: Default color mapped directly to stroke200 (AlterSemanticTokens.stroke200 / #E5E7EB).
  /// v1.0.0: Initial release matching Figma Node 559:916 (Divider).
  static const String version = '1.0.1';

  /// The axis of the divider (horizontal or vertical).
  final Axis axis;

  /// Thickness of the divider line (default 1.0px matching Figma).
  final double thickness;

  /// Total height space occupied by a horizontal divider.
  final double? height;

  /// Total width space occupied by a vertical divider.
  final double? width;

  /// Color of the divider line (defaults to [AlterSemanticTokens.stroke200] `#E5E7EB`).
  final Color? color;

  /// Leading indentation empty space before the divider line.
  final double? indent;

  /// Trailing indentation empty space after the divider line.
  final double? endIndent;

  /// Optional fixed length along the primary axis (width for horizontal, height for vertical).
  final double? length;

  /// Creates a horizontal [Divider] instance.
  const Divider({
    super.key,
    this.axis = Axis.horizontal,
    this.thickness = 1.0,
    this.height,
    this.color,
    this.indent,
    this.endIndent,
    this.length,
  }) : width = null;

  /// Creates a vertical [Divider] instance.
  const Divider.vertical({
    super.key,
    this.thickness = 1.0,
    this.width,
    this.color,
    this.indent,
    this.endIndent,
    this.length,
  })  : axis = Axis.vertical,
        height = null;

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AlterSemanticTokens.stroke200;

    if (axis == Axis.vertical) {
      Widget line = Container(
        width: thickness,
        height: length,
        color: effectiveColor,
      );

      if (indent != null || endIndent != null) {
        line = Padding(
          padding: EdgeInsets.only(
            top: indent ?? 0.0,
            bottom: endIndent ?? 0.0,
          ),
          child: line,
        );
      }

      if (width != null) {
        line = SizedBox(
          width: width,
          child: Center(child: line),
        );
      }

      return line;
    }

    Widget line = Container(
      height: thickness,
      width: length,
      color: effectiveColor,
    );

    if (indent != null || endIndent != null) {
      line = Padding(
        padding: EdgeInsets.only(
          left: indent ?? 0.0,
          right: endIndent ?? 0.0,
        ),
        child: line,
      );
    }

    if (height != null) {
      line = SizedBox(
        height: height,
        child: Center(child: line),
      );
    }

    return line;
  }
}

/// Convenience alias for [Divider] to prevent naming collisions with Flutter's Material Divider.
typedef AlterDivider = Divider;
