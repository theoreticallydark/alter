# AdvancedPill

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/pills/advancedpill)

## Overview
`AdvancedPill` is a multi-line detail pill component in the Alter Design System. It accommodates title and subtitle metrics alongside configurable leading and trailing icon slots using the standard `ButtonIconGhost` component or any custom child widget.

## Usage
```dart
AdvancedPill(
  title: 'Guava, 100g',
  subtitle: 'ALA 20% • Zinc 10%',
  type: AdvancedPillType.gray,
  hasLeftSlot: true,
  leftSlot: ButtonIconGhost(
    icon: Icons.add_circle_outline,
    type: ButtonIconGhostType.secondary,
    size: 24,
    onTap: () {
      // handle tap
    },
  ),
  hasRightSlot: false,
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | `String` | `'Title'` | Primary bold caption title using `AlterTypography.captionBold`. |
| `subtitle` | `String?` | `'Subtitle'` | Secondary caption subtitle using `AlterTypography.caption` with `AlterSemanticTokens.textDisabled`. |
| `type` | `AdvancedPillType` | `AdvancedPillType.gray` | Color/surface variant (`gray` or `white`). |
| `hasLeftSlot` | `bool` | `true` | Visibility flag for leading slot. |
| `leftIcon` | `IconData?` | `null` | Icon for the default `ButtonIconGhost` in the left slot (falls back to `Icons.add_circle_outline`). |
| `leftSlot` | `Widget?` | `null` | Custom widget override for left slot (e.g., interactive `ButtonIconGhost`). |
| `hasRightSlot` | `bool` | `false` | Visibility flag for trailing slot. |
| `rightIcon` | `IconData?` | `null` | Icon for the default `ButtonIconGhost` in the right slot (falls back to `Icons.add_circle_outline`). |
| `rightSlot` | `Widget?` | `null` | Custom widget override for right slot. |

---

## Design System Tokens & Specs (Figma Node `349:15869`)
- **Typography**:
  - Title: `Body/caption-bold` -> `AlterTypography.captionBold` (Geist 12px, SemiBold 600, line-height 16px, `AlterSemanticTokens.textPrimary`).
  - Subtitle: `Body/caption` -> `AlterTypography.caption` (Geist 12px, Regular 400, line-height 16px, `AlterSemanticTokens.textDisabled` / `#99A1AF`).
- **Layout & Spacing**:
  - Container padding: 12px vertical, 16px horizontal.
  - Border radius: 24px.
  - Row gap: 8px.
  - Text column gap: 2px.
- **Color Variables**:
  - `gray`: Surface `AlterSemanticTokens.baseGray` (`#F9FAFB`), Border 1px `AlterSemanticTokens.stroke200` (`#E5E7EB`).
  - `white`: Surface `AlterSemanticTokens.baseWhite` (`#FFFFFF`), Border 1px `AlterSemanticTokens.stroke100` (`#F3F4F6`).
- **Child Components**: Reuses `ButtonIconGhost` (`24x24px`, `ButtonIconGhostType.secondary`) for slot interactions.

---

## Component Changelog
* **`v1.1.0`**: Removed container `onTap` and slot callback wrappers (`onLeftTap`, `onRightTap`). Child slot widgets (such as `ButtonIconGhost`) directly handle their own tap interactions. Generic defaults (`'Title'`, `'Subtitle'`) applied.
* **`v1.0.0`**: Initial release matching Figma Node `349:15869`.

