# SearchInput

**Version**: `2.0.0`  
**Base**: [TextInput](file:///c:/Vayu/Alter/lib/components/inputs/text_input.dart)

---

## Overview
`SearchInput` is a specialized search entry field built on top of [TextInput](file:///c:/Vayu/Alter/lib/components/inputs/text_input.dart). It comes pre-configured with a search left icon (`Icons.search_rounded`), dynamic clear button (`ButtonIconGhost` with `Icons.close_rounded`), and search keyboard actions.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `placeholder` | `String` | `'Search...'` | Search ghost hint text |
| `value` | `String?` | `null` | Current search query |
| `leftIcon` | `IconData?` | `Icons.search_rounded` | Left search icon |
| `showClearButton` | `bool` | `true` | Automatically shows ghost clear button when text is non-empty |
| `customRightButton` | `ButtonIconGhost?` | `null` | Custom right ghost button override |
| `onSearch` | `ValueChanged<String>?` | `null` | Triggered on search text change and enter submission |
| `onClear` | `VoidCallback?` | `null` | Triggered when clear button is clicked |
| `onChanged` | `ValueChanged<String>?` | `null` | Standard text changed callback |
| `onSubmitted` | `ValueChanged<String>?` | `null` | Enter/submit keyboard action callback |

---

## Reused Child Components
- [TextInput](file:///c:/Vayu/Alter/lib/components/inputs/text_input.dart) (`v2.0.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
