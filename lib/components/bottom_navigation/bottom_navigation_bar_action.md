# BottomNavigationBarAction

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbaraction)

## Overview
`BottomNavigationBarAction` is a composite navigation bar component. Depending on the selected `BottomNavigationBarActionType`, it either pairs an `AlterBottomNavigationBar` with a dedicated circular action button or arranges a trio of action buttons with standardized 10px spacing.

## Design Specifications
* **Layout**: Horizontal row (`Row` with `mainAxisSize: MainAxisSize.min`, `crossAxisAlignment: CrossAxisAlignment.center`).
* **Item Spacing**: `10px` gap between all adjacent elements (`SizedBox(width: 10)`).
* **Child Component Composition**:
  * Composes `AlterBottomNavigationBar` (encapsulating `BottomNavigationItem` tabs).
  * Composes `BottomNavigationButton` instances (`72x72px` circular action triggers).

### Variant Specifications
| Variant (`type`) | Structure / Composition | Default Action Style |
| :--- | :--- | :--- |
| **`defaultAction`** | `AlterBottomNavigationBar` (tabs) + `10px` gap + 1 `BottomNavigationButton` | `BottomNavigationButtonType.secondary` (Gray, `add_circle_outline` icon) |
| **`buttons`** | 3 `BottomNavigationButton` items (`Primary [check]` + `Secondary [favorite_border]` + `Secondary [search]`) separated by `10px` gaps | 1 Primary action + 2 Secondary actions |

---

## Usage
```dart
// 1. Default Mode (Navigation Bar + Action Button)
BottomNavigationBarAction(
  type: BottomNavigationBarActionType.defaultAction,
  selectedIndex: 0,
  onPrimaryActionTap: () => print('Add Tapped'),
  onItemTapped: (index) => print('Tab: $index'),
)

// 2. Buttons Mode (3 Circular Action Buttons)
BottomNavigationBarAction(
  type: BottomNavigationBarActionType.buttons,
  onPrimaryActionTap: () => print('Primary Action'),
  onSecondaryActionOneTap: () => print('Favorite Action'),
  onSecondaryActionTwoTap: () => print('Search Action'),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `type` | `BottomNavigationBarActionType` | `.defaultAction` | Layout variant (`defaultAction` or `buttons`). |
| `selectedIndex` | `int` | `0` | Active index when using `defaultAction`. |
| `items` | `List<BottomNavigationItemData>` | 3 default items | List of navigation items for the bar. |
| `onItemTapped` | `ValueChanged<int>?` | `null` | Item tap listener. |
| `primaryActionIcon` | `IconData` | `Icons.add_circle_outline` | Icon for primary action button (`72x72`). |
| `primaryActionType` | `BottomNavigationButtonType` | `.secondary` | Visual style for primary button (`secondary` / `primary`). |
| `onPrimaryActionTap` | `VoidCallback?` | `null` | Callback for primary button. |
| `secondaryActionOneIcon` | `IconData` | `Icons.favorite_border` | Icon for 2nd button in buttons mode. |
| `onSecondaryActionOneTap` | `VoidCallback?` | `null` | Callback for 2nd button in buttons mode. |
| `secondaryActionTwoIcon` | `IconData` | `Icons.search` | Icon for 3rd button in buttons mode. |
| `onSecondaryActionTwoTap` | `VoidCallback?` | `null` | Callback for 3rd button in buttons mode. |

---

## Component Changelog

### `v1.1.0`
* **Variants**: Renamed variant to `buttons` matching Figma Node 60:2061 and updated default action button to `secondary` (gray) with `add_circle_outline` icon.

### `v1.0.2`
* **Layout**: Standardized 10px horizontal gap between child elements.

### `v1.0.1`
* **Tokens**: Bound color tokens to `AlterSemanticTokens`.

### `v1.0.0`
* Initial release of `BottomNavigationBarAction`.
