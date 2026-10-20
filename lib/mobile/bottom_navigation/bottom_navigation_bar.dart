import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import 'bottom_navigation_item.dart';

/// Data model representing an item within [AlterBottomNavigationBar].
class BottomNavigationItemData {
  /// Label text displayed beneath the icon.
  final String label;

  /// Icon displayed in the navigation item.
  final IconData icon;

  /// Creates navigation item data.
  const BottomNavigationItemData({
    required this.label,
    required this.icon,
  });
}

/// A floating pill-shaped bottom navigation bar.
class AlterBottomNavigationBar extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Updated item layout with explicit 8px gap hugging content as per Figma node 117:4152.
  static const String version = '1.1.0';

  /// The index of the currently active navigation item.
  final int selectedIndex;

  /// The list of items displayed in the bar.
  final List<BottomNavigationItemData> items;

  /// Callback triggered when an item at the given index is tapped.
  final ValueChanged<int>? onItemTapped;

  /// Creates an [AlterBottomNavigationBar] instance.
  const AlterBottomNavigationBar({
    super.key,
    this.selectedIndex = 0,
    this.items = const [
      BottomNavigationItemData(label: 'Home', icon: Icons.home_outlined),
      BottomNavigationItemData(label: 'Search', icon: Icons.search),
      BottomNavigationItemData(label: 'Profile', icon: Icons.person_outline),
    ],
    this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AlterSemanticTokens.baseGray,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          for (int index = 0; index < items.length; index++) ...[
            if (index > 0) const SizedBox(width: 8),
            BottomNavigationItem(
              label: items[index].label,
              icon: items[index].icon,
              isSelected: index == selectedIndex,
              onTap: () => onItemTapped?.call(index),
            ),
          ],
        ],
      ),
    );
  }
}
