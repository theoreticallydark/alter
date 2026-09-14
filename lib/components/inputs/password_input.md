# PasswordInput

**Version**: `2.2.0`  
**Base**: [InputControl](file:///c:/Vayu/Alter/lib/components/inputs/input_control.dart)

---

## Overview
`PasswordInput` is a specialized secure input component with built-in password obscuring, an interactive eye visibility toggle (`ButtonIconGhost`), space-denial formatting, character limit overflow support, and configurable strength validation rules.

---

## Features

1. **Clean Surface by Default**:
   - `leftIcon` defaults to `null` (no leading icon by default; customizable if desired).
2. **Space Denial Formatting**:
   - `allowSpaces: false` by default, preventing whitespace entry via `FilteringTextInputFormatter.deny(RegExp(r'\s'))`.
3. **Character Limit Support**:
   - Supports `characterLimit: int?`. When exceeded, triggers automatic error boundary, red counter, and `"Character limit exceeded"` message.
4. **Configurable Strength Validation Rules**:
   - `minCharacters: int?` (default `8`): Enforces minimum length.
   - `requireNumber: bool` (default `false`): Requires at least one digit (`0-9`).
   - `requireSpecialChar: bool` (default `false`): Requires at least one special character (`!@#$%^&*...`).
   - `requireUppercase: bool` (default `false`): Requires at least one uppercase letter (`A-Z`).
   - `requireLowercase: bool` (default `false`): Requires at least one lowercase letter (`a-z`).
   - `autoValidateRules: bool` (default `true`): Toggles automatic rule evaluation.
5. **Interactive Eye Visibility Toggle**:
   - Reuses [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) to toggle between obscured bullet points (`•`) and readable text.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Password'` | Top label text (omits labelBar when `null`) |
| `isRequired` | `bool` | `false` | Asterisk indicator beside label |
| `characterLimit` | `int?` | `null` | Maximum character length limit |
| `type` | `InputControlType` | `gray` | Surface variant (`gray` or `white`) |
| `leftIcon` | `IconData?` | `null` | Leading icon (defaults to `null` / none) |
| `placeholder` | `String` | `'Enter password'` | Ghost placeholder text |
| `value` | `String?` | `null` | Current input value |
| `showEyeToggle` | `bool` | `true` | Ghost eye button to toggle visibility |
| `initiallyObscured` | `bool` | `true` | Whether initial state is obscured |
| `obscuringCharacter` | `String` | `'•'` | Obscuring bullet character |
| `allowSpaces` | `bool` | `false` | When `false`, denies whitespace typing |
| `minCharacters` | `int?` | `8` | Minimum character length required |
| `requireNumber` | `bool` | `false` | Requires at least 1 digit |
| `requireSpecialChar` | `bool` | `false` | Requires at least 1 special character |
| `requireUppercase` | `bool` | `false` | Requires at least 1 uppercase letter |
| `requireLowercase` | `bool` | `false` | Requires at least 1 lowercase letter |
| `autoValidateRules` | `bool` | `true` | Enables built-in strength validation rules |
| `onToggleObscure` | `ValueChanged<bool>?` | `null` | Callback when eye is toggled |

---

## Reused Child Components
- [InputControl](file:///c:/Vayu/Alter/lib/components/inputs/input_control.dart) (`v2.1.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
