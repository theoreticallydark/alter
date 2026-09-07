import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import 'bottom_navigation_item.dart';

class BottomNavigationItemData {
  final String label;
  final IconData icon;

  const BottomNavigationItemData({
    required this.label,
    required this.icon,
  });
}

class AlterBottomNavigationBar extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Updated item layout with explicit 8px gap hugging content as per Figma node 117:4152.
  static const String version = '1.1.0';

  final int selectedIndex;
  final List<BottomNavigationItemData> items;
  final ValueChanged<int>? onItemTapped;

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
