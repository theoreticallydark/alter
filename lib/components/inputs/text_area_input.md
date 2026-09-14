# TextArea

**Version**: `2.4.0`  
**Base**: [TextInput](file:///c:/Vayu/Alter/lib/components/inputs/text_input.dart)

---

## Overview
`TextArea` is a multiline text area input field built on top of [TextInput](file:///c:/Vayu/Alter/lib/components/inputs/text_input.dart). It supports both **fixed reserved lines** (e.g. `lines: 4`, when `minLines == null`) and **dynamic adaptive height** (when `minLines` is provided, e.g. `lines: 4, minLines: 1`), where the container starts at `minLines` and grows dynamically line-by-line up to `lines` max height as the user types.

---

## Sizing Paradigm
- **Fixed Reserved Lines**: `TextArea(lines: 4)` $\rightarrow$ `minLines: 4, maxLines: 4`
- **Adaptive Auto-Expanding**: `TextArea(lines: 4, minLines: 1)` $\rightarrow$ Starts at 1 line, grows up to 4 lines dynamically before scrolling.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Description'` | Top label text (renders top labelBar when non-null) |
| `isRequired` | `bool` | `false` | Asterisk indicator beside label in label color |
| `characterLimit` | `int?` | `200` | Maximum character limit (shows live counter during typing when label is present) |
| `type` | `InputControlType` | `gray` | Gray (`#F9FAFB`) or White (`#FFFFFF`) surface |
| `lines` | `int` | `4` | Fixed reserved lines (or maximum adaptive ceiling lines) |
| `minLines` | `int?` | `null` | Starting lines for adaptive auto-expansion (`null` = fixed reserved lines) |
| `keyboardType` | `TextInputType?` | `null` | Direct native virtual keyboard override |
| `placeholder` | `String` | `'Enter description...'` | Ghost placeholder |
| `value` | `String?` | `null` | Initial text value |
| `controller` | `TextEditingController?` | `null` | External controller |
| `focusNode` | `FocusNode?` | `null` | External focus node |
| `leftIcon` | `IconData?` | `null` | Optional leading icon |
| `prefix` | `String?` | `null` | Optional prefix string |
| `suffix` | `String?` | `null` | Optional suffix string |
| `rightButton` | `ButtonIconGhost?` | `null` | Trailing action slot |
| `isError` | `bool` | `false` | Error border and caption toggle |
| `showErrorMessage` | `bool` | `true` | Show/hide error caption container |
| `errorMessage` | `String` | `'Error Message'` | Error caption text |
| `errorMessages` | `List<String>?` | `null` | List of error messages (latest active error is displayed) |
| `enabled` | `bool` | `true` | Interactive enabled flag (48% opacity when false) |
| `readOnly` | `bool` | `false` | Readonly flag |

---

## Reused Child Components
- [TextInput](file:///c:/Vayu/Alter/lib/components/inputs/text_input.dart) (`v2.3.0`)
- [InputControl](file:///c:/Vayu/Alter/lib/components/inputs/input_control.dart) (`v2.3.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
