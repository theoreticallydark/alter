# AlterBottomNavigationBar

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbar)

## Overview
`AlterBottomNavigationBar` is a rounded navigation container encapsulating a list of `BottomNavigationItem` tabs over a `baseGray` surface.

## Usage
```dart
AlterBottomNavigationBar(
  selectedIndex: _currentIndex,
  items: const [
    BottomNavigationItemData(label: 'Home', icon: Icons.home_outlined),
    BottomNavigationItemData(label: 'Search', icon: Icons.search),
    BottomNavigationItemData(label: 'Profile', icon: Icons.person_outline),
  ],
  onItemTapped: (index) => setState(() => _currentIndex = index),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `selectedIndex` | `int` | `0` | Currently active tab index. |
| `items` | `List<BottomNavigationItemData>` | 3 items | List of navigation tab descriptors (`label`, `icon`). |
| `onItemTapped` | `ValueChanged<int>?` | `null` | Callback invoked when a tab is selected. |

---

## Component Changelog
* **`v1.0.1`**: Enhanced item spacing and selection state token binding (`AlterSemanticTokens.ui1`).
* **`v1.0.0`**: Initial release.
