# ButtonIcon

> Current Version: `v1.3.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/buttons/buttonicon)

## Overview
`ButtonIcon` is a rounded icon button supporting multiple surface colors (`gray`, `white`, `primary`, `red`), flexible sizes (`48x48`, `64x64`), and selection states.

## Usage
```dart
ButtonIcon(
  icon: Icons.favorite_border,
  type: ButtonIconType.red,
  isSelected: false,
  size: 48.0,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `icon` | `IconData` | `Icons.favorite_border` | The icon to display. |
| `type` | `ButtonIconType` | `ButtonIconType.gray` | Color variant (`gray`, `white`, `primary`, `red`). |
| `isSelected` | `bool` | `false` | When true, renders a prominent border highlight. |
| `size` | `double` | `48.0` | Outer square dimension (e.g. 48 or 64). |
| `iconSize` | `double?` | `28.0` | Custom inner icon size (defaults to 28.0). |
| `onTap` | `VoidCallback?` | `null` | Tap callback handler. |

---

## Component Changelog
* **`v1.3.0`**: Added `ButtonIconType.red` variant matching Figma Design System.
* **`v1.2.0`**: Added customizable `size` and `iconSize` properties for flexible layout integration.
* **`v1.1.0`**: Added `isSelected` active border highlight support.
* **`v1.0.0`**: Initial release with `gray`, `white`, `primary` variants.
