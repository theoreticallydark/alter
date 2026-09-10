# Switch

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/selects/switch)

## Overview
`Switch` is a binary toggle component in the Alter Design System based on Material/MUI toggle icons (`toggle_on` and `toggle_off`). It provides compact, scalable switch toggling.

## Usage
```dart
Switch(
  isSelected: _isEnabled,
  onChanged: (value) {
    setState(() => _isEnabled = value);
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `isSelected` | `bool` | `false` | Whether the switch is toggled ON (`true`) or OFF (`false`). |
| `onChanged` | `ValueChanged<bool>?` | `null` | Callback fired when the switch is tapped, passing the next boolean state. |
| `activeColor` | `Color?` | `AlterSemanticTokens.textPrimary` | Icon color when selected/ON (`#000000`). |
| `size` | `double` | `24.0` | Dimension (width, height, and icon size) for scalable display. |

---

## Design System Tokens & Specs (Figma Node `167:9665`)
- **Icons**:
  - `isSelected=False`: MUI `toggle_off` (`Icons.toggle_off`).
  - `isSelected=True`: MUI `toggle_on` (`Icons.toggle_on`).
- **Dimensions**:
  - Default size: `24x24px` (scalable via `size`).
- **Colors**:
  - `isSelected=False`: `AlterSemanticTokens.textDisabled` (`#99A1AF`).
  - `isSelected=True`: `AlterSemanticTokens.textPrimary` (`#000000`) or custom `activeColor`.

---

## Component Changelog
* **`v1.1.0`**: Locked unselected state color to `AlterSemanticTokens.textDisabled` (`#99A1AF`) and allowed custom `activeColor` defaulting to `AlterSemanticTokens.textPrimary` (`#000000`).
* **`v1.0.0`**: Initial release matching Figma Node `167:9665`.
