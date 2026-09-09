# Badge

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/pills/badge)

## Overview
`Badge` is a compact status, tag, and indicator component in the Alter Design System. It supports 18 curated color variants, optional leading (`hasLeftIcon`) and trailing (`hasRightIcon`) icons, and an integrated dismissible action button (`hasAction` / `onActionTap`).

## Usage
```dart
Badge(
  label: 'Status',
  color: BadgeColor.brand,
  hasLeftIcon: true,
  leftIcon: Icons.star_border,
  hasAction: true,
  onActionTap: () {
    // Handle dismiss or secondary clear action
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Label'` | Text content inside the badge. |
| `color` | `BadgeColor` | `BadgeColor.gray` | Color variant (18 options: `gray`, `white`, `red`, `orange`, `yellow`, `green`, `teal`, `indigo`, `purple`, `pink`, `amber`, `lime`, `emerald`, `cyan`, `sky`, `brand`, `slate`, `zinc`). |
| `hasLeftIcon` | `bool` | `false` | Visibility toggle for leading icon. |
| `leftIcon` | `IconData?` | `null` | Leading icon (defaults to `Icons.grid_view` if `hasLeftIcon` is true). |
| `hasRightIcon` | `bool` | `false` | Visibility toggle for trailing icon. |
| `rightIcon` | `IconData?` | `null` | Trailing icon (defaults to `Icons.grid_view` if `hasRightIcon` is true). |
| `hasAction` | `bool` | `false` | Visibility toggle for dismiss/action button. |
| `actionIcon` | `IconData?` | `null` | Action button icon (defaults to `Icons.close` / 12x12px). |
| `onActionTap` | `VoidCallback?` | `null` | Callback triggered when the action button is tapped. |

---

## Design System Tokens & Specs (Figma Node `124:4003`)
- **Typography**: `Body/caption` -> `AlterTypography.caption` (Geist 12px, Regular 400, line-height 16px).
- **Layout & Spacing**:
  - Container padding: 6px vertical, 8px horizontal.
  - Border radius: 12px.
  - Main row gap: 4px.
  - Content container padding: 0px vertical, 2px horizontal (gap: 2px).
- **Color Variables**:
  - `gray`: BG `AlterColors.colorsGray100` (`#F3F4F6`), Text `AlterColors.colorsGray800` (`#1E2939`)
  - `white`: BG `AlterColors.white` (`#FFFFFF`), Text `AlterColors.colorsGray800` (`#1E2939`)
  - `red`: BG `AlterColors.colorsRed100` (`#FFE2E2`), Text `AlterColors.colorsRed800` (`#9F0712`)
  - `orange`: BG `AlterColors.colorsOrange100` (`#FEECDC`), Text `AlterColors.colorsOrange800` (`#8A2C0D`)
  - `yellow`: BG `AlterColors.colorsYellow100` (`#FEF9C2`), Text `AlterColors.colorsYellow800` (`#894B00`)
  - `green`: BG `AlterColors.colorsGreen100` (`#DCFCE7`), Text `AlterColors.colorsGreen800` (`#016630`)
  - `teal`: BG `AlterColors.colorsTeal100` (`#CBFBF1`), Text `AlterColors.colorsTeal800` (`#005F59`)
  - `indigo`: BG `AlterColors.colorsIndigo100` (`#E0E7FF`), Text `AlterColors.colorsIndigo800` (`#372AAC`)
  - `purple`: BG `AlterColors.colorsPurple100` (`#F3E8FF`), Text `AlterColors.colorsPurple800` (`#6E11B0`)
  - `pink`: BG `AlterColors.colorsPink100` (`#FCE7F3`), Text `AlterColors.colorsPink800` (`#A3004C`)
  - `amber`: BG `AlterColors.colorsAmber100` (`#FEF3C6`), Text `AlterColors.colorsAmber800` (`#973C00`)
  - `lime`: BG `AlterColors.colorsLime100` (`#ECFCCA`), Text `AlterColors.colorsLime800` (`#3C6300`)
  - `emerald`: BG `AlterColors.colorsEmerald100` (`#D0FAE5`), Text `AlterColors.colorsEmerald800` (`#006045`)
  - `cyan`: BG `AlterColors.colorsCyan100` (`#CEFAFE`), Text `AlterColors.colorsCyan800` (`#005F78`)
  - `sky`: BG `AlterColors.colorsSky100` (`#DFF2FE`), Text `AlterColors.colorsSky800` (`#00598A`)
  - `brand`: BG `AlterColors.colorsBrand100` (`#DBEAFE`), Text `AlterColors.colorsBrand800` (`#193CB8`)
  - `slate`: BG `AlterColors.colorsSlate100` (`#F1F5F9`), Text `AlterColors.colorsSlate800` (`#1D293D`)
  - `zinc`: BG `AlterColors.colorsZinc100` (`#F4F4F5`), Text `AlterColors.colorsZinc800` (`#27272A`)

---

## Component Changelog
* **`v1.1.0`**: Removed body tap interaction and `isInteractive` property; Badge now exclusively uses `hasAction` and `onActionTap` for action button interactions.
* **`v1.0.2`**: Decoupled main badge `onTap` from action button `onActionTap` with independent hit regions.
* **`v1.0.1`**: Fixed `hasAction`, `hasLeftIcon`, and `hasRightIcon` to strictly respect their boolean visibility flags.
* **`v1.0.0`**: Initial release supporting 18 Figma color variants, leading/trailing icons, and dismiss action button.
