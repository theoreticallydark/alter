# BottomNavigationBarAction

> Current Version: `v1.0.2`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbaraction)

## Overview
`BottomNavigationBarAction` pairs an `AlterBottomNavigationBar` with a circular action button or arranges a trio of action buttons depending on the configured `BottomNavigationBarActionType`.

## Usage
```dart
BottomNavigationBarAction(
  type: BottomNavigationBarActionType.defaultAction,
  selectedIndex: 0,
  onPrimaryActionTap: () => print('Primary Action'),
  onItemTapped: (index) => print('Tab: $index'),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `type` | `BottomNavigationBarActionType` | `.defaultAction` | Layout variant (`defaultAction` with bar + button, or `save` with 3 buttons). |
| `selectedIndex` | `int` | `0` | Active index when using `defaultAction`. |
| `items` | `List<BottomNavigationItemData>` | 3 default items | List of navigation items for the bar. |
| `onItemTapped` | `ValueChanged<int>?` | `null` | Item tap listener. |
| `onPrimaryActionTap` | `VoidCallback?` | `null` | Callback for the primary action button. |
| `primaryActionIcon` | `IconData` | `Icons.add` | Icon for the primary button. |
| `primaryActionType` | `BottomNavigationButtonType` | `.primary` | Visual variant of the primary button. |
| `onSecondaryActionOneTap` | `VoidCallback?` | `null` | Callback for secondary button 1 in save mode. |
| `onSecondaryActionTwoTap` | `VoidCallback?` | `null` | Callback for secondary button 2 in save mode. |

---

## Component Changelog
* **`v1.0.2`**: Updated button row alignment and gaps to 10px.
* **`v1.0.1`**: Bound color tokens to `AlterSemanticTokens`.
* **`v1.0.0`**: Initial release.
