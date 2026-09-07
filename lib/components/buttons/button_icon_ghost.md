# ButtonIconGhost

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/buttons/buttoniconghost)

## Overview
`ButtonIconGhost` is a borderless icon button supporting primary, secondary, and destructive red color states, designed for dense lists and inline utility toolbars.

## Usage
```dart
ButtonIconGhost(
  icon: Icons.remove_circle_outline,
  type: ButtonIconGhostType.secondary,
  size: 24.0,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `icon` | `IconData` | *required* | Icon to display. |
| `type` | `ButtonIconGhostType` | `.primary` | Color variant (`primary`, `secondary`, `red`). |
| `size` | `double` | `24.0` | Square dimension and icon size. |
| `onTap` | `VoidCallback?` | `null` | Tap handler. |
| `onLongPress` | `VoidCallback?` | `null` | Long press handler. |
| `onTapDown` | `GestureTapDownCallback?` | `null` | Gesture tap-down hook. |
| `onTapUp` | `GestureTapUpCallback?` | `null` | Gesture tap-up hook. |
| `onTapCancel` | `GestureTapCancelCallback?` | `null` | Gesture cancel hook. |

---

## Component Changelog
* **`v1.1.0`**: Added `onLongPress`, `onTapDown`, `onTapUp`, and `onTapCancel` gesture hooks for continuous interactions.
* **`v1.0.0`**: Initial release with `primary`, `secondary`, `red` color tokens.
