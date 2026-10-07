# Divider

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/utilities/divider)

## Overview
`Divider` is a 1px separator line for creating visual division between sections, list items, and header elements in the Alter Design System.

## Usage
```dart
// Standard Horizontal Divider
Divider()

// Custom Thickness and Color
Divider(
  thickness: 1.5,
  color: AlterSemanticTokens.stroke200,
)

// Vertical Divider
Divider.vertical(
  length: 24,
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `axis` | `Axis` | `Axis.horizontal` | Orientation axis (horizontal or vertical). |
| `thickness` | `double` | `1.0` | Line thickness (1.0px matching Figma). |
| `height` | `double?` | `null` | Total vertical space allocated for horizontal divider. |
| `width` | `double?` | `null` | Total horizontal space allocated for vertical divider. |
| `color` | `Color?` | `AlterSemanticTokens.stroke200` | Line color (`#E5E7EB`). |
| `indent` | `double?` | `null` | Leading empty space before the divider. |
| `endIndent` | `double?` | `null` | Trailing empty space after the divider. |
| `length` | `double?` | `null` | Explicit length along the primary axis. |

---

## Design System Tokens & Specs (Figma Node `559:916`)
- **Dimensions**: Default thickness `1px`, dimensions `896x1px`.
- **Colors**:
  - Stroke / Fill: `AlterSemanticTokens.stroke200` (`#E5E7EB` / `AlterColors.colorsGray200`).

---

## Component Changelog
* **`v1.0.1`**: Default color mapped directly to `AlterSemanticTokens.stroke200` (`#E5E7EB`).
* **`v1.0.0`**: Initial release matching Figma Node `559:916` (`Divider`).
