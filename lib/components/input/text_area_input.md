# TextArea

**Version**: `2.0.0`  
**Base**: [TextInput](file:///c:/Vayu/Alter/lib/components/input/text_input.dart)

---

## Overview
`TextArea` is a multiline text area input field built on top of [TextInput](file:///c:/Vayu/Alter/lib/components/input/text_input.dart). It reserves vertical height for a specified number of lines (default `4`), with character limit counter support and full FormField validation.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `showLabel` | `bool` | `true` | Visibility toggle for entire label bar |
| `label` | `String?` | `'Description'` | Top label text |
| `isRequired` | `bool` | `false` | Asterisk indicator beside label |
| `showCharacterLimit` | `bool` | `true` | Live character counter in typing state |
| `characterLimit` | `int?` | `200` | Maximum character limit |
| `lines` | `int` | `4` | Number of lines to reserve in visual height |
| `placeholder` | `String` | `'Enter description...'` | Ghost placeholder |
| `value` | `String?` | `null` | Initial text value |
| `enabled` | `bool` | `true` | Interactive enabled flag (48% opacity when false) |
| `readOnly` | `bool` | `false` | Readonly flag |

---

## Reused Child Components
- [TextInput](file:///c:/Vayu/Alter/lib/components/input/text_input.dart) (`v2.0.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
