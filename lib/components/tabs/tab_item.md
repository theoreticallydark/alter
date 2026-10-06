# TabItem

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/tabs/tabitem)

## Overview
`TabItem` is the atomic tab button component of the Alter Design System. It can be hosted within the parent `Tabs` component or used independently, supporting label-only, icon-only, and composite (icon + label) configurations with smooth active state transitions.

## Usage
```dart
// Standard Label Tab
TabItem(
  label: 'Tab 1',
  isSelected: true,
  type: TabItemType.gray,
  onTap: () {
    // Handle tab selection
  },
)

// Composite Icon + Label Tab
TabItem(
  label: 'Profile',
  hasIcon: true,
  icon: Icons.face_5_outlined,
  isSelected: true,
  type: TabItemType.white,
)

// Icon-Only Tab
TabItem(
  hasIcon: true,
  hasLabel: false,
  icon: Icons.face_5_outlined,
  isSelected: true,
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Label'` | The text label displayed inside the tab item. |
| `hasLabel` | `bool` | `true` | Whether the text label is visible. |
| `hasIcon` | `bool` | `false` | Whether to display a leading icon (24x24). |
| `icon` | `IconData?` | `Icons.face_5_outlined` | Leading icon glyph data when `hasIcon` is true. |
| `iconWidget` | `Widget?` | `null` | Custom icon widget override. |
| `isSelected` | `bool` | `false` | Whether this tab item is currently active / selected. |
| `type` | `TabItemType` | `TabItemType.gray` | Surface variant (`gray` or `white`). |
| `onTap` | `VoidCallback?` | `null` | Callback triggered when the tab item is tapped. |

---

## Design System Tokens & Specs (Figma Node `336:10501`)
- **Typography**:
  - Label: `Body/body-lg` -> `AlterTypography.bodyLg` (Geist 16px, Regular 400, line-height 20px / 1.25).
- **Layout & Spacing**:
  - Padding: `12px` vertical, `16px` horizontal (`EdgeInsets.symmetric(horizontal: 16, vertical: 12)`).
  - Border Radius: `24px`.
  - Gap: `8px` between icon and label.
- **Colors**:
  - `state=Active, type=Gray`: Background `AlterSemanticTokens.baseNeutral` / `baseGray` (`#F9FAFB`), Icon & Text `AlterSemanticTokens.textPrimary` (`#000000`).
  - `state=Active, type=White`: Background `AlterSemanticTokens.baseWhite` (`#FFFFFF`), Icon & Text `AlterSemanticTokens.textPrimary` (`#000000`).
  - `state=Default, type=Gray`: Background `transparent`, Icon & Text `AlterSemanticTokens.textDisabled` (`#99A1AF`).
  - `state=Default, type=White`: Background `transparent`, Icon & Text `AlterSemanticTokens.textDisabled` (`#99A1AF`).

---

## Component Changelog
* **`v1.1.0`**: Aligned with live Figma Node `336:10501` (`.TabItem`): Added `hasIcon` (default `false`), `icon` (default `Icons.face_5_outlined`), `iconWidget`, and `hasLabel` (default `true`) supporting icon-only, label-only, and composite icon+label tabs with `8px` gap.
* **`v1.0.2`**: Removed `Center` widget wrapper inside `AnimatedContainer` so `TabItem` strictly hugs its intrinsic 44px height rather than expanding to fill parent vertical constraints.
* **`v1.0.1`**: Fixed color interpolation flash artifact by preserving RGB channels during alpha transition and eliminated jarring `InkWell` highlight splash overlay.
* **`v1.0.0`**: Initial release matching Figma Node `336:10501` (`.TabItem`).
