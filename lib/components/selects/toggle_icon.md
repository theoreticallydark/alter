# ToggleIcon

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/selects/toggleicon)

## Overview
`ToggleIcon` is a binary toggle button (e.g. favorite heart, star rating) supporting border icon (unchecked) and filled icon (checked) following Material / MUI convention, with graceful fallback to color state when a filled variant is omitted.

## Usage
```dart
ToggleIcon(
  isSelected: isFavorite,
  icon: Icons.star_border,
  selectedIcon: Icons.star,
  activeColor: AlterColors.colorsPink600,
  onSelectedChanged: (val) => setState(() => isFavorite = val),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `isSelected` | `bool` | `false` | Binary toggle state. |
| `onSelectedChanged` | `ValueChanged<bool>?` | `null` | Callback invoked with updated boolean state. |
| `icon` | `IconData` | `Icons.star_border` | Default/unselected icon (border outlined). |
| `selectedIcon` | `IconData?` | `Icons.star` | Selected/active icon (filled). Falls back to `icon` if omitted. |
| `activeColor` | `Color?` | `AlterColors.colorsPink600` | Color when selected. |
| `inactiveColor` | `Color?` | `AlterSemanticTokens.textSecondary` | Color when unselected. |
| `size` | `double` | `24.0` | Outer dimension of the toggle icon. |

---

## Component Changelog
* **`v1.1.0`**: Added `icon` (default border), `selectedIcon` (filled), `isSelected` / `onSelectedChanged`, and `activeColor` following MUI convention with graceful fallback.
* **`v1.0.0`**: Initial release.
