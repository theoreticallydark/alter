# TabItem

> Current Version: `v1.0.2`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/tabs/tabitem)

## Overview
`TabItem` is the atomic tab button sub-component of the Alter Design System. It is designed to be hosted within the parent `Tabs` component and represents a single selectable option with smooth selection state transitions.

> [!NOTE]
> `TabItem` is an internal child component intended to be consumed via `Tabs`.

## Usage
```dart
TabItem(
  label: 'Tab 1',
  isSelected: true,
  type: TabItemType.gray,
  onTap: () {
    // Handle tab selection
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Label'` | The text label displayed inside the tab item. |
| `isSelected` | `bool` | `false` | Whether this tab item is currently selected. |
| `type` | `TabItemType` | `TabItemType.gray` | Surface variant (`gray` or `white`). |
| `onTap` | `VoidCallback?` | `null` | Callback triggered when the tab item is tapped. |

---

## Design System Tokens & Specs (Figma Node `336:10501`)
- **Typography**:
  - Label: `Body/body-lg` -> `AlterTypography.bodyLg` (Geist 16px, Regular 400, line-height 20px / 1.25).
- **Layout & Spacing**:
  - Padding: `12px` vertical, `16px` horizontal (`EdgeInsets.symmetric(horizontal: 16, vertical: 12)`).
  - Border Radius: `24px`.
- **Colors**:
  - `state=Selected, type=Gray`: Background `AlterSemanticTokens.baseGray` (`#F9FAFB`), Text `AlterSemanticTokens.textPrimary` (`#000000`).
  - `state=Selected, type=White`: Background `AlterSemanticTokens.baseWhite` (`#FFFFFF`), Text `AlterSemanticTokens.textPrimary` (`#000000`).
  - `state=Default, type=Gray`: Background `transparent`, Text `AlterSemanticTokens.textDisabled` (`#99A1AF`).
  - `state=Default, type=White`: Background `transparent`, Text `AlterSemanticTokens.textDisabled` (`#99A1AF`).

---

## Component Changelog
* **`v1.0.2`**: Removed `Center` widget wrapper inside `AnimatedContainer` so `TabItem` strictly hugs its intrinsic 44px height rather than expanding to fill parent vertical constraints.
* **`v1.0.1`**: Fixed color interpolation flash artifact by preserving RGB channels during alpha transition and eliminated jarring `InkWell` highlight splash overlay.
* **`v1.0.0`**: Initial release matching Figma Node `336:10501` (`.TabItem`).
