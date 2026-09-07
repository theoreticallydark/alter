# BottomNavigationItem

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationitem)

## Overview
`BottomNavigationItem` represents a single interactive tab item inside `AlterBottomNavigationBar`. It organizes an icon and caption label vertically within a 24px rounded pill container.

## Design Specifications
* **Layout**: Auto Layout Column (centered, hugging content, `minWidth: 64px`).
* **Padding**: `horizontal: 12px`, `vertical: 8px`.
* **Corner Radius**: `24px`.
* **Icon Size**: `24x24px`.
* **Typography**: Geist 12px Regular (`AlterTypography.caption`), line-height: 16px.

### State & Token Mapping
| State | Container Fill | Icon Color | Text Color |
| :--- | :--- | :--- | :--- |
| **Selected (`true`)** | `AlterSemanticTokens.ui1` (`#F3F4F6`) | `AlterSemanticTokens.textPrimary` (`#000000`) | `AlterSemanticTokens.textPrimary` (`#000000`) |
| **Unselected (`false`)** | `Colors.transparent` | `AlterSemanticTokens.ui6` (`#4A5565`) | `AlterSemanticTokens.textSecondary` (`#4A5565`) |

---

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
| `icon` | `IconData` | *required* | Icon displayed for the tab (24px). |
| `isSelected` | `bool` | `false` | Highlight/selection state. |
| `onTap` | `VoidCallback?` | `null` | Tap callback handler. |

---

## Component Changelog

### `v1.0.1`
* **Tokens**: Bound selection background to `AlterSemanticTokens.ui1` with 24px border radius and `AlterSemanticTokens.ui6` for inactive icon.

### `v1.0.0`
* Initial release of `BottomNavigationItem`.
