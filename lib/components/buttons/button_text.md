# ButtonText

> Current Version: `v1.3.2`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/buttons/buttontext)

## Overview
`ButtonText` is a primary/secondary/destructive text button adhering to the Alter Design System. It features rounded corners (`20px`), centered bold Geist typography (`AlterTypography.bodyLgBold`), 1px structural stroke borders, optional leading icon support, hover/selected states with smooth animations, and configurable size and style variants.

## Design Specifications
* **Layout**: Centered text and optional leading icon container with `minWidth: 64px`.
* **Gap**: `4px` between leading icon and label.
* **Icon Size**: `24x24px`.
* **Corner Radius**: `20px` (`BorderRadius.circular(20)`).
* **Border**: `1px` solid outline.
* **Typography**: Geist 16px SemiBold (`AlterTypography.bodyLgBold`, `fontWeight: FontWeight.w600`, line-height: 20px).

### Size Specifications
| Size (`size`) | Padding | Description |
| :--- | :--- | :--- |
| **`normal`** | `horizontal: 16px`, `vertical: 12px` | Standard button height (approx 48px). |
| **`large`** | `horizontal: 16px`, `vertical: 20px` | High-emphasis / tall button height (approx 64px). |

### Type & Token Mapping (Default State)
| Type (`type`) | Surface Fill | Border Stroke | Text / Icon Color |
| :--- | :--- | :--- | :--- |
| **`primary`** | `AlterColors.colorsGray800` (`#1E2939`) | `AlterSemanticTokens.interactivePrimaryBorder` (`#030712`) | `AlterSemanticTokens.textInverse` (`#FFFFFF`) |
| **`white`** | `AlterSemanticTokens.baseWhite` (`#FFFFFF`) | `AlterSemanticTokens.baseBorder` (`#E5E7EB`) | `AlterSemanticTokens.textPrimary` (`#000000`) |
| **`gray`** | `AlterSemanticTokens.baseGray` (`#F9FAFB`) | `AlterSemanticTokens.baseBorder` (`#E5E7EB`) | `AlterSemanticTokens.textPrimary` (`#000000`) |
| **`red`** | `AlterSemanticTokens.statusDanger` (`#E7000B`) | `AlterColors.colorsRed800` (`#9F0712`) | `AlterSemanticTokens.statusDangerContrast` (`#FFFFFF`) |

### Hover & Selected States (`isHovered: true` or `isSelected: true`)
| Type (`type`) | Active Surface Fill | Active Border Stroke | Active Text / Icon Color |
| :--- | :--- | :--- | :--- |
| **`primary`** | `AlterSemanticTokens.interactivePrimaryActive` (`#101828`) | `AlterSemanticTokens.interactivePrimaryBorder` (`#030712`) | `AlterSemanticTokens.textInverse` (`#FFFFFF`) |
| **`white`** / **`gray`** | `AlterSemanticTokens.baseActive` (`#E5E7EB`) | `AlterSemanticTokens.baseActive` (`#E5E7EB`) | `AlterSemanticTokens.textPrimary` (`#000000`) |
| **`red`** | `AlterColors.colorsRed800` (`#9F0712`) | `AlterColors.colorsRed800` (`#9F0712`) | `AlterSemanticTokens.statusDangerContrast` (`#FFFFFF`) |

---

## Usage
```dart
ButtonText(
  label: 'Profile',
  type: ButtonType.primary,
  size: ButtonSize.normal,
  hasIcon: true,
  icon: Icons.face_5_outlined,
  onTap: () => print('Button tapped'),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | *required* | Text label displayed inside the button. |
| `type` | `ButtonType` | `ButtonType.gray` | Color variant (`gray`, `white`, `primary`, `red`). |
| `size` | `ButtonSize` | `ButtonSize.normal` | Size variant (`normal`, `large`). |
| `isSelected` | `bool` | `false` | Selected/active visual state. |
| `isHovered` | `bool?` | `null` | Optional manual override for hover state. |
| `hasIcon` | `bool` | `false` | Whether to render the leading icon. |
| `icon` | `IconData?` | `null` | Leading icon data (24x24px). |
| `iconWidget` | `Widget?` | `null` | Arbitrary custom widget for the icon slot. |
| `onTap` | `VoidCallback?` | `null` | Tap callback handler. |

---

## Component Changelog

### `v1.3.2`
* **Features**: Refined `hasIcon` visibility logic to honor explicit `false` overrides while dynamically inferring icon rendering when `icon` / `iconWidget` is supplied without explicit `hasIcon`.

### `v1.3.1`
* **Interaction**: Enhanced hover state tracking using explicit `MouseRegion` and resilient `(isHovered == true) || _internalHovered` check to prevent non-null knob overrides from silencing cursor hover.

### `v1.3.0`
* **Interaction**: Added interactive and explicit `Hover` state handling with `AnimatedContainer` alongside `Selected` state per Figma specifications.
* **Tokens**: Ensured `ButtonType.white` default fill is strictly `AlterSemanticTokens.baseWhite` (`#FFFFFF`).

### `v1.2.0`
* **Layout**: Aligned padding for `normal` (`16x12`) and `large` (`16x20`) per Figma Node `130:8382`.
* **Tokens**: Updated stroke tokens to `baseBorder` (`#E5E7EB`) and `interactivePrimaryBorder` (`#030712`).
* **Features**: Added `isSelected` active selection state and leading `icon` / `iconWidget` slot with `4px` gap.

### `v1.1.1`
* **Tokens**: Replaced deprecated `baseBlack` token reference with `AlterColors.colorsGray800` swatch.

### `v1.1.0`
* **Variants**: Added `ButtonType.red` destructive variant using `AlterSemanticTokens.statusDanger` and `AlterSemanticTokens.statusDangerContrast`.

### `v1.0.1`
* **Layout**: Enhanced minimum width constraint (`minWidth: 64px`) and normalized padding tokens.

### `v1.0.0`
* Initial release of `ButtonText` supporting `ButtonType` and `ButtonSize` variants.
