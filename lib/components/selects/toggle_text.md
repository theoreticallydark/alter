# ToggleText

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/selects/toggletext)

## Overview
`ToggleText` is a large segmented selectable chip/pill component in the Alter Design System. It features an optional icon with customizable label text, standard 64px height, 20px rounded corners, and distinct selected/default border states.

## Usage
```dart
ToggleText(
  label: 'Male',
  icon: Icons.face_5_outlined,
  hasIcon: true,
  isSelected: _isSelected,
  type: ToggleTextType.gray,
  onChanged: (selected) {
    setState(() => _isSelected = selected);
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Option'` | Text label displayed inside the component. |
| `isSelected` | `bool` | `false` | Whether the chip is currently in the selected state. |
| `hasIcon` | `bool` | `true` | Controls the visibility of the leading icon. |
| `icon` | `IconData` | `Icons.face_5_outlined` | The leading icon data (24x24px). |
| `type` | `ToggleTextType` | `ToggleTextType.gray` | Surface variant (`gray` or `white`). |
| `onChanged` | `ValueChanged<bool>?` | `null` | Callback emitted with the next boolean state when tapped. |
| `onTap` | `VoidCallback?` | `null` | Direct tap callback. |

---

## Design System Tokens & Specs (Figma Node `167:9709`)
- **Dimensions & Geometry**:
  - Height: `64px`.
  - Padding: `18px` vertical, `24px` horizontal (`EdgeInsets.symmetric(horizontal: 24, vertical: 18)`).
  - Border Radius: `20px`.
  - Gap: `8px` between icon and label.
  - Icon size: `24x24px`.
- **Typography**:
  - `Body/body-lg` -> `AlterTypography.bodyLg` (Geist 16px, Regular 400, line-height 20px).
- **Colors**:
  - **Gray Variant (`type = gray`)**:
    - Surface: `AlterSemanticTokens.baseGray` (`#F9FAFB`).
    - Default Border: 1px `AlterSemanticTokens.stroke200` (`#E5E7EB`).
    - Selected Border: 1px `AlterSemanticTokens.stroke1000` / `#000000`.
  - **White Variant (`type = white`)**:
    - Surface: `AlterSemanticTokens.baseWhite` (`#FFFFFF`).
    - Default Border: 1px `AlterSemanticTokens.stroke100` (`#F3F4F6`).
    - Selected Border: 1px `AlterSemanticTokens.stroke1000` / `#000000`.
  - **Foreground (Text & Icon)**:
    - Default: `AlterSemanticTokens.textSecondary` (`#4A5565`).
    - Selected: `AlterSemanticTokens.textPrimary` (`#000000`).

---

## Component Changelog
* **`v1.0.0`**: Initial release matching Figma Node `167:9709`.
