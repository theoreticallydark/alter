import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
import 'bottom_navigation_button.dart';

enum BottomNavigationBarActionType {
  defaultAction,
  buttons;

  /// Backward-compatible alias for [buttons].
  @Deprecated('Use buttons instead')
  static const BottomNavigationBarActionType save = BottomNavigationBarActionType.buttons;
}

class BottomNavigationBarAction extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Renamed variant to buttons and updated default action button to secondary (gray) with add_circle icon as per Figma Node 60:2061.
  static const String version = '1.1.0';

  final BottomNavigationBarActionType type;
  final int selectedIndex;
  final List<BottomNavigationItemData> items;
  final ValueChanged<int>? onItemTapped;

  // Action Button (Default Type: add_circle Secondary, Buttons Type: Check Primary)
  final VoidCallback? onPrimaryActionTap;
  final IconData primaryActionIcon;
  final BottomNavigationButtonType primaryActionType;

  // Additional Action Buttons (Buttons Type)
  final VoidCallback? onSecondaryActionOneTap;
  final IconData secondaryActionOneIcon;
  final VoidCallback? onSecondaryActionTwoTap;
  final IconData secondaryActionTwoIcon;

  const BottomNavigationBarAction({
    super.key,
    this.type = BottomNavigationBarActionType.defaultAction,
    this.selectedIndex = 0,
    this.items = const [
      BottomNavigationItemData(label: 'Home', icon: Icons.home_outlined),
      BottomNavigationItemData(label: 'Search', icon: Icons.search),
      BottomNavigationItemData(label: 'Profile', icon: Icons.person_outline),
    ],
    this.onItemTapped,
    this.onPrimaryActionTap,
    this.primaryActionIcon = Icons.add_circle_outline,
    this.primaryActionType = BottomNavigationButtonType.secondary,
    this.onSecondaryActionOneTap,
    this.secondaryActionOneIcon = Icons.favorite_border,
    this.onSecondaryActionTwoTap,
    this.secondaryActionTwoIcon = Icons.search,
  });

  @override
  Widget build(BuildContext context) {
    if (type == BottomNavigationBarActionType.defaultAction) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AlterBottomNavigationBar(
            selectedIndex: selectedIndex,
            items: items,
            onItemTapped: onItemTapped,
          ),
          const SizedBox(width: 10),
          BottomNavigationButton(
            icon: primaryActionIcon,
            type: primaryActionType,
            onTap: onPrimaryActionTap,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BottomNavigationButton(
            icon: primaryActionIcon == Icons.add_circle_outline ? Icons.check : primaryActionIcon,
            type: primaryActionType == BottomNavigationButtonType.secondary ? BottomNavigationButtonType.primary : primaryActionType,
            onTap: onPrimaryActionTap,
          ),
          const SizedBox(width: 10),
          BottomNavigationButton(
            icon: secondaryActionOneIcon,
            type: BottomNavigationButtonType.secondary,
            onTap: onSecondaryActionOneTap,
          ),
          const SizedBox(width: 10),
          BottomNavigationButton(
            icon: secondaryActionTwoIcon,
            type: BottomNavigationButtonType.secondary,
            onTap: onSecondaryActionTwoTap,
          ),
        ],
      );
    }
  }
}
