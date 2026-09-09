# AlterBottomNavigationBar

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbar)

## Overview
`AlterBottomNavigationBar` is a rounded navigation bar container encapsulating a list of `BottomNavigationItem` tabs (supporting 3, 4, or 5 items) over a `baseGray` surface.

## Design Specifications
* **Layout**: Horizontal Auto Layout (`Row` with `mainAxisSize: MainAxisSize.min`, `horizontal: hug`).
* **Item Spacing**: `8px` gap between each adjacent `BottomNavigationItem` (`SizedBox(width: 8)`).
* **Padding**: `8px` on all sides (`EdgeInsets.all(8)`).
* **Corner Radius**: `30px` (`BorderRadius.circular(30)`).
* **Surface Fill**: `AlterSemanticTokens.baseGray` (`#F9FAFB` / `colors/gray/050`).
* **Variants / Page Count**: Supports 3, 4, or 5 `BottomNavigationItem` instances.

---

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
| `items` | `List<BottomNavigationItemData>` | 3 default items | List of navigation tab descriptors (supports 3–5 items per design spec). |
| `onItemTapped` | `ValueChanged<int>?` | `null` | Callback invoked when a tab is tapped. |

---

## Component Changelog

### `v1.1.0`
* **Layout**: Updated item layout to render explicit 8px gaps between adjacent tabs with hugging width.

### `v1.0.1`
* **Tokens**: Bound container background to `AlterSemanticTokens.baseGray` and standardized 30px corner radius.

### `v1.0.0`
* Initial release of `AlterBottomNavigationBar` composed with `BottomNavigationItem`.
