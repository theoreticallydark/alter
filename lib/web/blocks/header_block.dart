import 'package:flutter/material.dart' hide Divider;
import '../../components/utilities/divider.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Target device / viewport modes for [HeaderBlock].
enum HeaderBlockDevice {
  /// Automatically adapts based on parent width (< 500px triggers mobile layout) or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout (max width 896px).
  pc,

  /// Forces Mobile layout (max width 316px).
  mobile,
}

/// A responsive section header block with an expandable divider line and bold title for landing pages.
///
/// Figma Specifications (Node `761:6852` - `HeaderBlock`):
/// - Variants:
///   - `device=PC` (`761:6853`): Width 896px, Column container, 24px gap.
///     - `blockHeader`: Row, alignItems: center, gap: 48px.
///       - [Divider]: Horizontal 1px fill.
///       - Text (`header`): 30px Geist Bold ([AlterTypography.h1Bold]), lineHeight 36px, textPrimary (`#000000`).
///   - `device=Mobile` (`761:6861`): Width 316px, Column container, 24px gap.
///     - `blockHeader`: Row, alignItems: center, gap: 48px.
///       - [Divider]: Horizontal 1px fill.
///       - Text (`header`): 30px Geist Bold ([AlterTypography.h1Bold]), lineHeight 36px, textPrimary (`#000000`).
class HeaderBlock extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 761:6852 (HeaderBlock: device=PC/Mobile).
  static const String version = '1.0.0';

  /// Optional fixed width constraint for the block.
  final double? width;

  /// Viewport mode (`auto`, `pc`, or `mobile`).
  final HeaderBlockDevice device;

  /// Width threshold below which mobile layout is activated (defaults to 500.0).
  final double breakpoint;

  /// Header title label (defaults to 'Experiences').
  final String header;

  /// Custom widget override for the header title.
  final Widget? headerWidget;

  /// Whether the divider line is displayed (defaults to true).
  final bool hasDivider;

  /// Custom divider widget override.
  final Widget? divider;

  /// Gap between the divider line and the header text (defaults to 48.0 per Figma specs).
  final double gap;

  /// Optional child content placed below the header block.
  final Widget? child;

  /// Creates a [HeaderBlock] instance.
  const HeaderBlock({
    super.key,
    this.width,
    this.device = HeaderBlockDevice.auto,
    this.breakpoint = 500.0,
    this.header = 'Experiences',
    this.headerWidget,
    this.hasDivider = true,
    this.divider,
    this.gap = 48.0,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double parentWidth = constraints.maxWidth;
        final double targetWidth = width ?? parentWidth;
        final ambient = AlterDeviceScope.maybeOf(context);

        final bool isPc = switch (device) {
          HeaderBlockDevice.auto => ambient != null
              ? ambient == AlterDevice.pc
              : targetWidth >= breakpoint,
          HeaderBlockDevice.pc => true,
          HeaderBlockDevice.mobile => false,
        };

        final effectiveTitle = headerWidget ??
            Text(
              header,
              textAlign: TextAlign.end,
              style: AlterTypography.h1Bold.copyWith(
                color: AlterSemanticTokens.textPrimary,
              ),
            );

        final blockHeader = Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (hasDivider) ...[
              Expanded(
                child: divider ?? const Divider(),
              ),
              SizedBox(width: gap),
            ],
            effectiveTitle,
          ],
        );

        final blockContent = AlterDeviceScope(
          device: isPc ? AlterDevice.pc : AlterDevice.mobile,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              blockHeader,
              if (child != null) ...[
                const SizedBox(height: 24.0),
                child!,
              ],
            ],
          ),
        );

        if (width != null) {
          return SizedBox(
            width: width,
            child: blockContent,
          );
        }

        return blockContent;
      },
    );
  }
}
