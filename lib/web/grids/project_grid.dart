import 'package:flutter/material.dart';
import '../../foundations/device_scope.dart';
import '../markers/project_marker.dart';

/// Target device / viewport modes for [ProjectGrid].
enum ProjectGridDevice {
  /// Automatically responds to layout constraints (< 500px triggers mobile 1-column layout) or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout (2 columns for multiple items, 1 column for single item).
  pc,

  /// Forces Mobile layout (1 column stacked vertically).
  mobile,
}

/// A responsive project and portfolio grid layout consuming [ProjectMarker] cards.
///
/// Figma Specifications (Node `795:3693` - `ProjectGrid`):
/// - Variants:
///   - `device=PC, count=Single` (`795:4012`): 1 full-width ProjectMarker.
///   - `device=PC, count=Double` (`795:3694`): 2-column ProjectMarker grid with 48px horizontal gap.
///   - `device=Mobile, count=Single` (`795:4015`): 1 ProjectMarker.
///   - `device=Mobile, count=Double` (`795:3702`): 1-column vertically stacked ProjectMarkers with 48px gap.
/// - Layout & Sizing:
///   - PC: 2 columns with 48px horizontal & vertical spacing (or single full-width column when count = 1).
///   - Mobile: 1 column with 48px vertical spacing.
///   - Device Synchronization: Propagates ambient [AlterDeviceScope] to child [ProjectMarker] cards so they inherit PC/Mobile mode from grid width.
class ProjectGrid extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.1: Added ambient AlterDeviceScope propagation so child ProjectMarkers derive device mode directly from ProjectGrid width and never collapse into mobile mode independently.
  /// v1.0.0: Initial release matching Figma Node 795:3693.
  static const String version = '1.0.1';

  /// Optional fixed width for the overall grid (defaults to fill available parent width).
  final double? width;

  /// Viewport mode (`auto` responsive, `pc`, or `mobile`).
  final ProjectGridDevice device;

  /// Number of columns in PC mode (defaults to 2 per Figma specification).
  final int pcColumns;

  /// Horizontal spacing gap between columns (defaults to 48px per Figma).
  final double crossAxisSpacing;

  /// Vertical spacing gap between rows (defaults to 48px per Figma).
  final double mainAxisSpacing;

  /// List of project items to display.
  final List<Widget>? projects;

  /// Number of project items when using [itemBuilder].
  final int? itemCount;

  /// Builder for project items at a given index.
  final IndexedWidgetBuilder? itemBuilder;

  /// Viewport width breakpoint below which mobile layout is activated (defaults to 500.0).
  final double breakpoint;

  /// Creates a [ProjectGrid] instance with a list of project widgets.
  const ProjectGrid({
    super.key,
    this.width,
    this.device = ProjectGridDevice.auto,
    this.pcColumns = 2,
    this.crossAxisSpacing = 48.0,
    this.mainAxisSpacing = 48.0,
    this.projects,
    this.itemCount,
    this.itemBuilder,
    this.breakpoint = 500.0,
  }) : assert(
          projects != null || (itemCount != null && itemBuilder != null),
          'Either projects list or both itemCount and itemBuilder must be provided.',
        );

  /// Convenience constructor for building a grid from a count and item builder.
  const ProjectGrid.builder({
    super.key,
    this.width,
    this.device = ProjectGridDevice.auto,
    this.pcColumns = 2,
    this.crossAxisSpacing = 48.0,
    this.mainAxisSpacing = 48.0,
    required int count,
    required IndexedWidgetBuilder builder,
    this.breakpoint = 500.0,
  })  : projects = null,
        itemCount = count,
        itemBuilder = builder;

  int get _effectiveItemCount => projects?.length ?? itemCount ?? 0;

  Widget _buildItem(BuildContext context, int index, bool isPc) {
    if (projects != null && index < projects!.length) {
      return projects![index];
    }
    if (itemBuilder != null && itemCount != null && index < itemCount!) {
      return itemBuilder!(context, index);
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double parentWidth = constraints.maxWidth;
        final double targetWidth = width ?? parentWidth;

        final bool isPc = switch (device) {
          ProjectGridDevice.auto => targetWidth >= breakpoint,
          ProjectGridDevice.pc => true,
          ProjectGridDevice.mobile => false,
        };

        final totalCount = _effectiveItemCount;
        if (totalCount == 0) {
          return const SizedBox.shrink();
        }

        Widget content;

        if (isPc && totalCount > 1 && pcColumns > 1) {
          // PC Multi-column layout (2 columns per Figma)
          final columns = pcColumns;
          final rowChildren = <Widget>[];

          for (int i = 0; i < totalCount; i += columns) {
            if (i > 0) {
              rowChildren.add(SizedBox(height: mainAxisSpacing));
            }

            final rowItems = <Widget>[];
            for (int col = 0; col < columns; col++) {
              final itemIndex = i + col;
              if (col > 0) {
                rowItems.add(SizedBox(width: crossAxisSpacing));
              }

              if (itemIndex < totalCount) {
                rowItems.add(
                  Expanded(
                    child: _buildItem(context, itemIndex, true),
                  ),
                );
              } else {
                rowItems.add(const Expanded(child: SizedBox.shrink()));
              }
            }

            rowChildren.add(
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: rowItems,
              ),
            );
          }

          content = Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rowChildren,
          );
        } else {
          // Single column (PC single item or Mobile 1-column layout)
          final columnChildren = <Widget>[];
          for (int i = 0; i < totalCount; i++) {
            if (i > 0) {
              columnChildren.add(SizedBox(height: mainAxisSpacing));
            }
            columnChildren.add(_buildItem(context, i, isPc));
          }

          content = Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: columnChildren,
          );
        }

        Widget wrappedContent = AlterDeviceScope(
          device: isPc ? AlterDevice.pc : AlterDevice.mobile,
          child: content,
        );

        if (width != null) {
          return SizedBox(
            width: width,
            child: wrappedContent,
          );
        }

        return wrappedContent;
      },
    );
  }
}
