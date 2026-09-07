# ButtonText

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/buttons/buttontext)

## Overview
`ButtonText` is a primary/secondary/destructive text button adhering to the Alter Design System. It features rounded corners (`20px`), centered bold Geist typography (`AlterTypography.bodyLgBold`), 1px structural stroke borders, and configurable size and style variants.

## Design Specifications
* **Layout**: Centered text container with `minWidth: 64px`.
* **Corner Radius**: `20px` (`BorderRadius.circular(20)`).
* **Border**: `1px` solid outline.
* **Typography**: Geist 16px SemiBold (`AlterTypography.bodyLgBold`, `fontWeight: FontWeight.w600`, line-height: 20px).

### Size Specifications
| Size (`size`) | Padding | Description |
| :--- | :--- | :--- |
| **`normal`** | `horizontal: 12px`, `vertical: 14px` | Standard button height (approx 48px). |
| **`large`** | `horizontal: 12px`, `vertical: 22px` | High-emphasis / tall button height (approx 64px). |

### Type & Token Mapping
| Type (`type`) | Surface Fill | Border Stroke | Text Color |
| :--- | :--- | :--- | :--- |
| **`primary`** | `AlterSemanticTokens.baseBlack` (`#1E2939`) | `AlterSemanticTokens.stroke1000` (`#000000`) | `AlterSemanticTokens.textInverse` (`#FFFFFF`) |
| **`white`** | `AlterSemanticTokens.baseWhite` (`#FFFFFF`) | `AlterSemanticTokens.stroke100` (`#F3F4F6`) | `AlterSemanticTokens.textPrimary` (`#000000`) |
| **`gray`** | `AlterSemanticTokens.baseGray` (`#F9FAFB`) | `AlterSemanticTokens.stroke100` (`#F3F4F6`) | `AlterSemanticTokens.textPrimary` (`#000000`) |
| **`red`** | `AlterSemanticTokens.statusDanger` (`#E7000B`) | `AlterColors.colorsRed800` (`#9F0712`) | `AlterSemanticTokens.statusDangerContrast` (`#FFFFFF`) |

---

## Usage
```dart
ButtonText(
  label: 'Delete Item',
  type: ButtonType.red,
  size: ButtonSize.normal,
  onTap: () => print('Delete tapped'),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | *required* | Text label displayed inside the button. |
| `type` | `ButtonType` | `ButtonType.gray` | Color variant (`gray`, `white`, `primary`, `red`). |
| `size` | `ButtonSize` | `ButtonSize.normal` | Size variant (`normal`, `large`). |
| `onTap` | `VoidCallback?` | `null` | Tap callback handler. |

---

## Component Changelog

### `v1.1.0`
* **Variants**: Added `ButtonType.red` destructive variant using `AlterSemanticTokens.statusDanger` and `AlterSemanticTokens.statusDangerContrast`.

### `v1.0.1`
* **Layout**: Enhanced minimum width constraint (`minWidth: 64px`) and normalized padding tokens.

### `v1.0.0`
* Initial release of `ButtonText` supporting `ButtonType` and `ButtonSize` variants.
