# BottomNavigationItem

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationitem)

## Overview
`BottomNavigationItem` represents a single interactive tab item inside an `AlterBottomNavigationBar`.

## Usage
```dart
BottomNavigationItem(
  label: 'Home',
  icon: Icons.home_outlined,
  isSelected: true,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | *required* | Caption text displayed below the icon. |
| `icon` | `IconData` | *required* | Icon displayed for the tab. |
| `isSelected` | `bool` | `false` | Highlight/selection state. |
| `onTap` | `VoidCallback?` | `null` | Tap callback. |

---

## Component Changelog
* **`v1.0.1`**: Bound selection background to `AlterSemanticTokens.ui1` with 24px border radius.
* **`v1.0.0`**: Initial release.
