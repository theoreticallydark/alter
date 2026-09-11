# PasswordInput

> Current Version: `v1.1.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/inputs/password)

## Overview
`PasswordInput` is a dedicated, security-hardened password entry component in the Alter Design System built on Figma Node `441:9205` and `.rightSlot: type=Password` (`454:482`).

### Key Features
- **Right Slot Password Visibility Toggle**: Eye icon ([ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart)) displayed exclusively when text is entered.
- **Hardened Security Defaults**: Automatically disables autocorrect, disables predictive keyboard suggestions, and integrates `AutofillHints.password`.
- **Top Label Bar (`labelBarContainer`)**: Label on left with optional required red asterisk (`*`) and character limit counter on right (`hasLabelBar`).
- **Surface Variants**: `gray` (`#F9FAFB`) and `white` (`#FFFFFF`).
- **Form Validation**: Native `FormField<String>` registration supporting `Form.validate()` and `Form.save()`.

---

## Usage

### Standard Password Input with Required Indicator
```dart
PasswordInput(
  label: 'Password',
  placeholder: 'Enter password',
  isRequired: true,
  onChanged: (val) {
    // handle text change
  },
)
```

### Password Input with Security Constraints
```dart
PasswordInput(
  label: 'New Password',
  placeholder: 'Enter secure password',
  isRequired: true,
  minLength: 8,
  requireSpecialChar: true,
  requireUppercase: true,
  requireDigit: true,
)
```

### Password Input with Character Limit
```dart
PasswordInput(
  label: 'PIN / Passcode',
  placeholder: 'Enter 6-digit PIN',
  hasCharacterLimit: true,
  characterLimit: 6,
)
```

---

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Password'` | Primary label in `labelBarContainer`. |
| `hasLabelBar` | `bool` | `true` | Visibility flag for the entire top bar. |
| `placeholder` | `String?` | `'Enter password'` | Placeholder hint text. |
| `initialValue` | `String?` | `null` | Pre-populated text value. |
| `controller` | `TextEditingController?` | `null` | External controller. |
| `focusNode` | `FocusNode?` | `null` | External focus node. |
| `type` | `TextInputVariant` | `TextInputVariant.gray` | Surface style variant (`gray` or `white`). |
| `obscuringCharacter` | `String` | `'•'` | Bullet character for obscure mode. |
| `autocorrect` | `bool?` | `false` | Security option; disabled by default. |
| `enableSuggestions` | `bool?` | `false` | Security option; disabled by default. |
| `autofillHints` | `Iterable<String>?` | `[AutofillHints.password]` | Autofill hints for password managers. |
| `hasCharacterLimit` | `bool` | `false` | Enables character limiter. |
| `characterLimit` | `int?` | `null` | Maximum character length. |
| `showCharacterLimit` | `bool` | `true` | Renders `"$length/$limit"` in `labelBarContainer` on top right. |
| `isRequired` | `bool` | `false` | Marks field as required; appends asterisk (`*`) matching label color and validates non-empty input. |
| `requiredErrorText` | `String?` | `null` | Custom error message for required validation. |
| `minLength` | `int?` | `8` | Minimum required password length. |
| `maxLength` | `int?` | `null` | Maximum allowed password length. |
| `requireSpecialChar` | `bool` | `false` | Enforces inclusion of at least one special character. |
| `requireUppercase` | `bool` | `false` | Enforces inclusion of at least one uppercase letter. |
| `requireDigit` | `bool` | `false` | Enforces inclusion of at least one digit. |
| `autoValidateRules` | `bool` | `true` | Automatically evaluates password rules. |
| `minLengthErrorText` | `String?` | `null` | Custom error message for min length violation. |
| `maxLengthErrorText` | `String?` | `null` | Custom error message for max length violation. |
| `specialCharErrorText` | `String?` | `null` | Custom error message for missing special character. |
| `uppercaseErrorText` | `String?` | `null` | Custom error message for missing uppercase character. |
| `digitErrorText` | `String?` | `null` | Custom error message for missing digit. |
| `isError` | `bool` | `false` | Triggers error state with red border `#E7000B`. |
| `hasFeedback` | `bool` | `true` | Controls whether [FeedbackText] is rendered in error state. |
| `errorText` | `String?` | `'Feedback Text'` | Error message displayed in [FeedbackText]. |
| `enabled` | `bool` | `true` | Enabled state; rendered at **48% opacity** when disabled. |
| `readOnly` | `bool` | `false` | Read-only state (1px `textDisabled` `#99A1AF` border, non-editable). |
| `validator` | `FormFieldValidator<String>?` | `null` | Custom validation function; registers with Flutter's `Form`. |
| `onSaved` | `FormFieldSetter<String>?` | `null` | Form save function; registers with Flutter's `Form`. |
| `autovalidateMode` | `AutovalidateMode?` | `null` | Native form autovalidate mode. |
| `onChanged` | `ValueChanged<String>?` | `null` | Callback emitted on text change. |
| `onSubmitted` | `ValueChanged<String>?` | `null` | Callback emitted on keyboard submission. |
| `onEditingComplete` | `VoidCallback?` | `null` | Callback emitted on action button. |

---

## Component Changelog
* **`v1.1.1`**: Added `isRequired` support with red label asterisk (`*`) and required error validation.
* **`v1.1.0`**: Added smart password validation engine (`minLength`, `maxLength`, `requireSpecialChar`, `requireUppercase`, `requireDigit`) with custom error text overrides.
* **`v1.0.1`**: Refactored to compose shared `InputContainer` for visual styling, border states, and label bar.
* **`v1.0.0`**: Initial release of dedicated `PasswordInput` component (`password_input.dart`).
