# ListItem

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/utilities/listitem)

## Overview
`ListItem` provides a structured, responsive row component featuring left leading slot, title and optional subtitle, and dual configurable right action slots (e.g. checkbox and toggle icon).

## Usage
```dart
ListItem(
  title: 'Notification Settings',
  subtitle: 'Enable push alerts for new updates',
  hasLeftSlot: true,
  hasRightSlotOne: true,
  hasRightSlotTwo: false,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | `String` | `'Title of the list item'` | Main label text using `AlterTypography.h2`. |
| `subtitle` | `String?` | `'Subtitle of the list item'` | Optional secondary caption using `AlterTypography.caption` with `AlterSemanticTokens.textDisabled`. |
| `hasSubtitle` | `bool` | `true` | Visibility flag for subtitle. |
| `hasLeftSlot` | `bool` | `true` | Shows left icon or custom slot widget. |
| `leftSlot` | `Widget?` | `ButtonIconGhost` | Custom widget in the left position. |
| `hasRightSlotOne` | `bool` | `true` | Shows right slot 1 (defaults to `Checkbox`). |
| `rightSlotOne` | `Widget?` | `Checkbox` | Custom widget in right slot 1. |
| `hasRightSlotTwo` | `bool` | `true` | Shows right slot 2 (defaults to `ToggleIcon`). |
| `rightSlotTwo` | `Widget?` | `ToggleIcon` | Custom widget in right slot 2. |
| `onTap` | `VoidCallback?` | `null` | Tap callback for the entire list item row. |

---

## Component Changelog
* **`v1.0.1`**: Aligned subtitle color to `AlterSemanticTokens.textDisabled` (`#99A1AF`) and default right slot 2 to favorite heart toggle.
* **`v1.0.0`**: Initial release of `ListItem` with slot composition.
