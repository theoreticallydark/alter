import 'package:flutter/material.dart';
import 'tab_item.dart';

/// Style variants for [Tabs].
enum TabsType {
  gray,
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
  /// v1.0.0: Initial release matching Figma Node 336:10524.
  static const String version = '1.0.0';

  final List<String> tabs;
  final int selectedIndex;
  final TabsType type;
  final ValueChanged<int>? onTabSelected;

  const Tabs({
    super.key,
    this.tabs = const ['Tab 1', 'Tab 2', 'Tab 3'],
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
            isSelected: index == selectedIndex,
            type: _tabItemType,
            onTap: () => onTabSelected?.call(index),
          ),
        ],
      ],
    );
  }
}
