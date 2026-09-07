# ButtonGraphicText

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/buttons/buttongraphictext)

## Overview
`ButtonGraphicText` is a dual-label metric/streak badge button featuring a dark green container, high-contrast typography, and compact padding.

## Usage
```dart
ButtonGraphicText(
  title: 'STREAK',
  subtitle: '7 DAYS',
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | `String` | `'STREAK'` | Header label text (Geist 10px, SemiBold). |
| `subtitle` | `String` | `'7 DAYS'` | Primary counter/metric text (Geist 12px, Black 900). |
| `onTap` | `VoidCallback?` | `null` | Tap callback. |

---

## Component Changelog
* **`v1.0.1`**: Bound container background to `AlterColors.colorsGreen900` with `AlterColors.colorsGreen500` border.
* **`v1.0.0`**: Initial release.
