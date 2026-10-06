import 'package:flutter/material.dart';
import 'tab_item.dart';

/// Style variants for [Tabs].
enum TabsType {
  /// Gray subtle background variant.
  gray,

  /// White surface background variant.
  white,
}

/// Reusable Tabs navigation component in the Alter Design System.
///
/// Figma Specifications (Node `336:10524`):
/// - Variants:
///   - `type=Gray` (`336:10519`): Hosts `TabItem` with `type=Gray`
///   - `type=White` (`336:10525`): Hosts `TabItem` with `type=White`
/// - Gap: 12px between tab items
/// - Layout: Row (hug contents)
/// - Child Component: [TabItem] (`Node 336:10501`)
class Tabs extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Added hasIcon (default false), hasLabel (default true), icon, icons, and iconWidgets to propagate TabItem v1.1.0 capabilities through Tabs.
  /// v1.0.0: Initial release matching Figma Node 336:10524.
  static const String version = '1.1.0';

  /// List of tab label strings.
  final List<String> tabs;

  /// Whether tab items display leading icons.
  final bool hasIcon;

  /// Whether tab items display text labels.
  final bool hasLabel;

  /// Default leading icon for all tabs when [hasIcon] is true.
  final IconData? icon;

  /// Optional per-tab icon data list.
  final List<IconData?>? icons;

  /// Optional per-tab custom icon widget list.
  final List<Widget?>? iconWidgets;

  /// Index of the currently active tab.
  final int selectedIndex;

  /// Visual theme style type.
  final TabsType type;

  /// Callback executed when a tab is selected.
  final ValueChanged<int>? onTabSelected;

  /// Creates a [Tabs] navigation instance.
  const Tabs({
    super.key,
    this.tabs = const ['Tab 1', 'Tab 2', 'Tab 3'],
    this.hasIcon = false,
    this.hasLabel = true,
    this.icon = Icons.face_5_outlined,
    this.icons,
    this.iconWidgets,
    this.selectedIndex = 0,
    this.type = TabsType.gray,
    this.onTabSelected,
  });

  TabItemType get _tabItemType {
    switch (type) {
      case TabsType.gray:
        return TabItemType.gray;
      case TabsType.white:
        return TabItemType.white;
    }
  }

  IconData? _getIconForIndex(int index) {
    if (icons != null && index < icons!.length && icons![index] != null) {
      return icons![index];
    }
    return icon;
  }

  Widget? _getIconWidgetForIndex(int index) {
    if (iconWidgets != null && index < iconWidgets!.length) {
      return iconWidgets![index];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (int index = 0; index < tabs.length; index++) ...[
          if (index > 0) const SizedBox(width: 12),
          TabItem(
            label: tabs[index],
            hasLabel: hasLabel,
            hasIcon: hasIcon,
            icon: _getIconForIndex(index),
            iconWidget: _getIconWidgetForIndex(index),
            isSelected: index == selectedIndex,
            type: _tabItemType,
            onTap: () => onTabSelected?.call(index),
          ),
        ],
      ],
    );
  }
}
