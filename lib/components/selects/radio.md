# Radio

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/selects/radio)

## Overview
`Radio` is a selection control component in the Alter Design System based on the standard Material/MUI radio icons. It supports both boolean state toggling and typed radio group selection with scalable dimensions.

## Usage

### Simple Boolean Usage
```dart
Radio(
  isSelected: _selected,
  onSelectedChanged: (value) {
    setState(() => _selected = value);
  },
)
```

### Radio Group Usage
```dart
Radio<int>(
  value: 1,
  groupValue: _selectedOption,
  onChanged: (val) {
    setState(() => _selectedOption = val!);
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `isSelected` | `bool` | `false` | Boolean selection state when not using group values. |
| `value` | `T?` | `null` | The value represented by this radio button in a group. |
| `groupValue` | `T?` | `null` | The currently selected value for the radio group. |
| `onChanged` | `ValueChanged<T?>?` | `null` | Callback fired when the radio button is selected in a group. |
| `onSelectedChanged` | `ValueChanged<bool>?` | `null` | Callback fired with next boolean state when tapped. |
| `activeColor` | `Color?` | `AlterSemanticTokens.textPrimary` | Icon color when selected (`#000000`). |
| `size` | `double` | `24.0` | Outer dimension and icon size (scales the component). |

---

## Design System Tokens & Specs (Figma Node `130:4532`)
- **Icons**:
  - `isSelected=False`: MUI `radio_button_unchecked` (`Icons.radio_button_unchecked`).
  - `isSelected=True`: MUI `radio_button_checked` (`Icons.radio_button_checked`).
- **Dimensions**:
  - Default size: `24x24px` (scalable via `size`).
- **Colors**:
  - `isSelected=False`: `AlterSemanticTokens.textDisabled` (`#99A1AF`).
  - `isSelected=True`: `AlterSemanticTokens.textPrimary` (`#000000`) or custom `activeColor`.

---

## Component Changelog
* **`v1.1.0`**: Locked unselected state color to `AlterSemanticTokens.textDisabled` (`#99A1AF`) and allowed custom `activeColor` defaulting to `AlterSemanticTokens.textPrimary` (`#000000`).
* **`v1.0.0`**: Initial release matching Figma Node `130:4532`.
