# Toast

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/status/toast)

## Overview
`Toast` is a status and notification feedback banner component in the Alter Design System. It communicates concise system messages with distinct semantic status variants (`neutral`, `gray`, `white`, `danger`, `warning`, `caution`, `success`).

## Usage
```dart
Toast(
  label: 'Settings saved successfully',
  status: ToastStatus.success,
  hasIcon: true,
  icon: Icons.check_circle_outline,
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Feedback Text'` | The message text to display. |
| `status` | `ToastStatus` | `ToastStatus.neutral` | Status variant (`neutral`, `gray`, `white`, `danger`, `warning`, `caution`, `success`). |
| `hasIcon` | `bool` | `true` | Visibility flag for the leading status icon. |
| `icon` | `IconData` | `Icons.error_outline` | Icon data displayed when `hasIcon` is true (16x16px). |
| `width` | `double?` | `320.0` | Container width (defaults to Figma spec 320px). |

---

## Design System Tokens & Specs (Figma Node `342:12219`)
- **Dimensions & Geometry**:
  - Width: `320px`.
  - Padding: `10px` vertical, `12px` horizontal (`EdgeInsets.symmetric(horizontal: 12, vertical: 10)`).
  - Border Radius: `16px`.
  - Gap: `4px` between icon and label.
  - Icon size: `16x16px`.
- **Typography**:
  - `Body/caption` -> `AlterTypography.caption` (Geist 12px, Regular 400, line-height 16px).
- **Status Variants & Colors**:
  - **`neutral`**: Background `AlterSemanticTokens.baseBlack` (`#1E2939`), Foreground `AlterSemanticTokens.textInverse` (`#FFFFFF`).
  - **`gray`**: Background `AlterSemanticTokens.baseGray` (`#F9FAFB`), Border 1px `AlterSemanticTokens.stroke200` (`#E5E7EB`), Foreground `AlterSemanticTokens.textPrimary` (`#000000`).
  - **`white`**: Background `AlterSemanticTokens.baseWhite` (`#FFFFFF`), Border 1px `AlterSemanticTokens.stroke100` (`#F3F4F6`), Foreground `AlterSemanticTokens.textPrimary` (`#000000`).
  - **`danger`**: Background `AlterColors.colorsRed800` (`#9F0712`), Foreground `AlterSemanticTokens.textInverse` (`#FFFFFF`).
  - **`warning`**: Background `AlterSemanticTokens.statusWarning` / `AlterColors.colorsOrange800` (`#8A2C0D`), Foreground `AlterSemanticTokens.textInverse` (`#FFFFFF`).
  - **`caution`**: Background `AlterSemanticTokens.statusCaution` / `AlterColors.colorsYellow400` (`#FDC700`), Foreground `AlterSemanticTokens.textPrimary` (`#000000`).
  - **`success`**: Background `AlterColors.colorsGreen800` (`#016630`), Foreground `AlterSemanticTokens.textInverse` (`#FFFFFF`).

---

## Component Changelog
* **`v1.0.0`**: Initial release matching Figma Node `342:12219`.
