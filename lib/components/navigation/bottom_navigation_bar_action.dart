import 'package:flutter/material.dart';
import 'bottom_navigation_bar.dart';
import 'bottom_navigation_button.dart';

/// Layout variations for [BottomNavigationBarAction].
enum BottomNavigationBarActionType {
  /// Standard bar paired with a single action button on the right.
  defaultAction,

  /// Action bar displaying three independent circular action buttons.
  buttons;

  /// Backward-compatible alias for [buttons].
  @Deprecated('Use buttons instead')
  static const BottomNavigationBarActionType save = BottomNavigationBarActionType.buttons;
}

/// A bottom navigation component combining navigation items with prominent action button(s).
class BottomNavigationBarAction extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Renamed variant to buttons and updated default action button to secondary (gray) with add_circle icon as per Figma Node 60:2061.
  static const String version = '1.1.0';

  /// The layout style type of the action bar.
  final BottomNavigationBarActionType type;

  /// The index of the currently active navigation item.
  final int selectedIndex;

  /// The list of items displayed in the navigation bar segment.
  final List<BottomNavigationItemData> items;

  /// Callback triggered when a navigation item at the given index is tapped.
  final ValueChanged<int>? onItemTapped;

  // Action Button (Default Type: add_circle Secondary, Buttons Type: Check Primary)
  /// Callback triggered when the primary action button is tapped.
  final VoidCallback? onPrimaryActionTap;

  /// Icon displayed in the primary action button.
  final IconData primaryActionIcon;

  /// Style variant of the primary action button.
  final BottomNavigationButtonType primaryActionType;

  // Additional Action Buttons (Buttons Type)
  /// Callback triggered when the first secondary action button is tapped.
  final VoidCallback? onSecondaryActionOneTap;

  /// Icon displayed in the first secondary action button.
  final IconData secondaryActionOneIcon;

  /// Callback triggered when the second secondary action button is tapped.
  final VoidCallback? onSecondaryActionTwoTap;

  /// Icon displayed in the second secondary action button.
  final IconData secondaryActionTwoIcon;

  /// Creates a [BottomNavigationBarAction] instance.
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
