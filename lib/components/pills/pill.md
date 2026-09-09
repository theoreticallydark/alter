# Pill

> Current Version: `v1.0.3`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/pills/pill)

## Overview
`Pill` is a multi-state badge and filter component in the Alter Design System. It supports `defaultSize` and `compact` sizing, `gray` and `neutral` color variants, selected/completed states, and smooth animated cross-fades when transitioning labels and values.

## Usage
```dart
Pill(
  label: 'STATUS',
  value: 'Active',
  size: PillSize.defaultSize,
  color: PillColor.gray,
  isSelected: false,
  isCompleted: true,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Label'` | Header title inside the pill. |
| `value` | `String?` | `null` | Secondary metric/value text. |
| `size` | `PillSize` | `PillSize.defaultSize` | Size variant (`defaultSize`, `compact`). |
| `color` | `PillColor` | `PillColor.gray` | Color variant (`gray`, `neutral`). |
| `hasLabel` | `bool` | `true` | Visibility toggle for label text. |
| `hasValue` | `bool` | `true` | Visibility toggle for value text. |
| `isSelected` | `bool` | `false` | Highlighted selection state with `stroke1000` 2px border. |
| `isCompleted` | `bool` | `false` | Completed status with fill color (`statusSuccess` or `statusTeal`). |
| `isInteractive` | `bool` | `true` | When true, wraps the container in an `InkWell`. |
| `horizontalPadding` | `double?` | `null` | Custom horizontal padding (defaults to 16.0). |
| `onTap` | `VoidCallback?` | `null` | Tap callback. |

---

## Component Changelog
* **`v1.0.3`**: Enhanced smooth size and label showcase transitions with synchronized `AnimatedCrossFade` and cubic interpolation.
* **`v1.0.2`**: Added `horizontalPadding` and `isInteractive` properties for non-clickable indicator usages.
* **`v1.0.1`**: Bound `statusSuccess` and `statusTeal` semantic color tokens for completed state.
* **`v1.0.0`**: Initial release.
