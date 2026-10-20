# BottomNavigationBarAction

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbaraction)

## Overview
`BottomNavigationBarAction` is a combined navigation bar and action button component in the Alter Design System. It features two variants:
- **`defaultAction`**: A standard `AlterBottomNavigationBar` paired with a 72x72px `BottomNavigationButton` (secondary style with `add_circle` icon).
- **`buttons`**: A triple button action group combining a primary 72x72px action button and two secondary 72x72px action buttons.

## Usage
```dart
// Default Action Bar
BottomNavigationBarAction(
  type: BottomNavigationBarActionType.defaultAction,
  selectedIndex: 0,
  onPrimaryActionTap: () {},
  onItemTapped: (index) {},
)

// Buttons Bar
BottomNavigationBarAction(
  type: BottomNavigationBarActionType.buttons,
  primaryActionIcon: Icons.check,
  onPrimaryActionTap: () {},
  onSecondaryActionOneTap: () {},
  onSecondaryActionTwoTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `type` | `BottomNavigationBarActionType` | `defaultAction` | Component variant (`defaultAction` or `buttons`). |
| `selectedIndex` | `int` | `0` | Active tab index for `defaultAction`. |
| `items` | `List<BottomNavigationItemData>` | 3 default items | Navigation tab items. |
| `onItemTapped` | `ValueChanged<int>?` | `null` | Tab tap callback. |
| `onPrimaryActionTap` | `VoidCallback?` | `null` | Primary action button tap callback. |
| `primaryActionIcon` | `IconData` | `Icons.add_circle_outline` | Icon for primary action button. |
| `primaryActionType` | `BottomNavigationButtonType` | `secondary` | Color/style type for primary action button. |
| `onSecondaryActionOneTap` | `VoidCallback?` | `null` | Secondary action 1 callback (`buttons` type). |
| `secondaryActionOneIcon` | `IconData` | `Icons.favorite_border` | Secondary action 1 icon (`buttons` type). |
| `onSecondaryActionTwoTap` | `VoidCallback?` | `null` | Secondary action 2 callback (`buttons` type). |
| `secondaryActionTwoIcon` | `IconData` | `Icons.search` | Secondary action 2 icon (`buttons` type). |

---

## Component Changelog
* **`v1.1.0`**: Renamed variant to `buttons` and updated default action button to secondary (gray) with `add_circle` icon as per Figma Node 60:2061.
* **`v1.0.0`**: Initial release.
