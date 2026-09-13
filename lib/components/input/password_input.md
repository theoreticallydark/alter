# PasswordInput

**Version**: `2.0.0`  
**Base**: [TextInput](file:///c:/Vayu/Alter/lib/components/input/text_input.dart) / [InputControl](file:///c:/Vayu/Alter/lib/components/input/input_control.dart)

---

## Overview
`PasswordInput` is a specialized secure input component with built-in password obscuring and an interactive eye visibility toggle (`ButtonIconGhost`).

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `showLabel` | `bool` | `true` | Visibility toggle for entire label bar |
| `label` | `String?` | `'Password'` | Top label text |
| `isRequired` | `bool` | `false` | Asterisk indicator beside label |
| `leftIcon` | `IconData?` | `Icons.lock_outline_rounded` | Lock icon on left |
| `showEyeToggle` | `bool` | `true` | Ghost eye button to toggle visibility |
| `initiallyObscured` | `bool` | `true` | Whether initial state is obscured |
| `obscuringCharacter` | `String` | `'•'` | Obscuring bullet character |
| `onToggleObscure` | `ValueChanged<bool>?` | `null` | Callback when eye is toggled |

---

## Reused Child Components
- [InputControl](file:///c:/Vayu/Alter/lib/components/input/input_control.dart) (`v2.0.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
