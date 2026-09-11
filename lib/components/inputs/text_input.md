# TextInput

> Current Version: `v1.5.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/inputs/textinput)

## Overview
`TextInput` is a comprehensive text entry component in the Alter Design System aligned with Figma Nodes `441:9205` and `.rightSlot` (`454:482`). It features:
- **`labelBarContainer`**: Top bar with the primary label on the left and dynamic character limit counter on the right (`gap: 16px`), controlled by `hasLabelBar`.
- **`.rightSlot` Sub-Architecture**: Mutually exclusive right-hand slot supporting `type=Suffix` or `type=Clear`. (For password inputs, use [PasswordInput](password_input.md)).
- **States**: `Default`, `Typing` (focused black border), `Filled`, `ReadOnly` (1px `textDisabled` / `#99A1AF` border, textSecondary input and icon), `Disabled` (48% opacity), and `Error` (danger border + bottom `FeedbackText`).
- **Surface Variants**: `gray` (`#F9FAFB`) and `white` (`#FFFFFF`).
- **Modes & Validation**: Support for input filtering modes, native `FormField<String>` validation, autofill hints, and container-wide tap-to-focus.

---

## Usage

### Standard Text Input
```dart
TextInput(
  label: 'Full Name',
  placeholder: 'Enter your full name',
  type: TextInputVariant.gray,
  inputMode: TextInputMode.onlyAlphabets,
  onChanged: (value) {
    // handle text change
  },
)
```

### Password Input
For password fields with dedicated visibility toggle and security defaults, use [PasswordInput](password_input.md):
```dart
PasswordInput(
  label: 'Password',
  placeholder: 'Enter password',
  type: TextInputVariant.white,
)
```

### Input with Top Character Limit Counter
```dart
TextInput(
  label: 'Bio',
  placeholder: 'Short bio',
  hasCharacterLimit: true,
  characterLimit: 100,
  showCharacterLimit: true,
  hasClear: true,
)
```

### Input with Suffix Text
```dart
TextInput(
  label: 'Weight',
  placeholder: '0.00',
  hasSuffix: true,
  suffix: 'kg',
  inputMode: TextInputMode.decimal,
)
```

### Error State with FeedbackText
```dart
TextInput(
  label: 'Email',
  placeholder: 'name@example.com',
  isError: true,
  hasFeedback: true,
  errorText: 'Please enter a valid email address',
)
```

---

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Label'` | Primary label displayed in `labelBarContainer` on the left. |
| `hasLabelBar` | `bool` | `true` | Visibility flag for the entire top bar (including label and character limit counter). |
| `hasCharacterLimit` | `bool` | `false` | Enables character length limiter. |
| `characterLimit` | `int?` | `null` | Maximum character length. |
| `showCharacterLimit` | `bool` | `true` | Renders `"$length/$limit"` in `labelBarContainer` on the top right. |
| `placeholder` | `String?` | `'Input'` | Placeholder hint text displayed when empty. |
| `initialValue` | `String?` | `null` | Initial text value for the input. |
| `controller` | `TextEditingController?` | `null` | External controller for managing text state. |
| `focusNode` | `FocusNode?` | `null` | External focus node for focus management. |
| `type` | `TextInputVariant` | `TextInputVariant.gray` | Surface style variant (`gray` or `white`). |
| `inputMode` | `TextInputMode` | `TextInputMode.all` | Input filtering mode (`all`, `onlyAlphabets`, `alphanumeric`, `onlyNumbers`, `decimal`, `email`, `phone`). |
| `hasIcon` | `bool` | `true` | Visibility flag for the leading icon. |
| `icon` | `IconData?` | `Icons.face_5_outlined` | Leading icon displayed at 24x24px. |
| `leadingWidget` | `Widget?` | `null` | Custom leading widget slot (e.g. flag, currency badge). |
| `hasSuffix` | `bool` | `false` | Renders text in `.rightSlot` (`type=Suffix`). |
| `suffix` | `String?` | `'suffix'` | Trailing suffix text (e.g. `'kg'`, `'USD'`). |
| `suffixWidget` | `Widget?` | `null` | Custom widget in `.rightSlot` (`type=Suffix`). |
| `hasClear` | `bool` | `false` | Renders clear button in `.rightSlot` (`type=Clear`). |
| `autocorrect` | `bool?` | `null` | Enables/disables autocorrect. |
| `enableSuggestions` | `bool?` | `null` | Enables/disables predictive suggestions. |
| `autofillHints` | `Iterable<String>?` | `null` | Autofill hints for native credentials. |
| `isRequired` | `bool` | `false` | Marks field as required; appends asterisk (`*`) matching label color and triggers error when empty. |
| `autoValidateRules` | `bool` | `true` | Automatically runs built-in format & required validation. |
| `requiredErrorText` | `String?` | `null` | Custom error message for required rule. |
| `emailErrorText` | `String?` | `null` | Custom error message for invalid email format. |
| `phoneErrorText` | `String?` | `null` | Custom error message for invalid phone format. |
| `isError` | `bool` | `false` | Triggers error state with red border `#E7000B`. |
| `hasFeedback` | `bool` | `true` | Controls whether [FeedbackText] is rendered in error state. |
| `errorText` | `String?` | `'Feedback Text'` | Error message displayed in [FeedbackText]. |
| `enabled` | `bool` | `true` | Enabled state; rendered at **48% opacity** when disabled. |
| `readOnly` | `bool` | `false` | Read-only state (1px `textDisabled` `#99A1AF` border, non-editable). |
| `validator` | `FormFieldValidator<String>?` | `null` | Custom form validation function; takes precedence over built-in rules. |
| `onSaved` | `FormFieldSetter<String>?` | `null` | Form save function; registers with Flutter's `Form` (`FormState.save()`). |
| `autovalidateMode` | `AutovalidateMode?` | `null` | Native form autovalidate mode. |
| `onChanged` | `ValueChanged<String>?` | `null` | Callback emitted on text change. |
| `onSubmitted` | `ValueChanged<String>?` | `null` | Callback emitted on keyboard submission. |
| `onEditingComplete` | `VoidCallback?` | `null` | Callback emitted on editing completion / action button. |

---

## Design System Tokens & Specs (Figma Node `441:9205` & `454:482`)
- **Dimensions & Spacing**:
  - Input box height: `64px` (`padding: 20px 24px`, `borderRadius: 20px`, `gap: 8px`).
  - Top `labelBarContainer`: `gap: 16px`, `8px` bottom margin.
  - Spacing between input box and feedback text: `4px`.
- **Colors**:
  - `type=Gray`: Background `AlterSemanticTokens.baseGray` (`#F9FAFB`), Default border `AlterSemanticTokens.stroke200` (`#E5E7EB`).
  - `type=White`: Background `AlterSemanticTokens.baseWhite` (`#FFFFFF`), Default border `AlterSemanticTokens.stroke100` (`#F3F4F6`).
  - Focused (Typing): 1px `AlterSemanticTokens.stroke1000` (`#000000`).
  - ReadOnly: 1px `AlterSemanticTokens.textDisabled` (`#99A1AF`).
  - Error: 1px `AlterSemanticTokens.textDanger` (`#E7000B`).
  - Suffix: `AlterSemanticTokens.textDisabled` (`#99A1AF`).
  - Input Text & Leading Icon in ReadOnly State: `AlterSemanticTokens.textSecondary` (`#4A5565`).
  - Input Text in Typing/Filled/Error: `AlterSemanticTokens.textPrimary` (`#000000`).
  - Disabled: `48% opacity` (`Opacity(opacity: 0.48)`).
- **Typography**:
  - Label & Character Limit Counter: `Body/body` -> `AlterTypography.body` (Geist 14px, Regular 400, `#4A5565`).
  - Input Text & Suffix: `Body/body-lg` -> `AlterTypography.bodyLg` (Geist 16px, Regular 400).
  - Placeholder: `AlterTypography.bodyLg` (`#4A5565`).
- **Child Components Reused**:
  - `InputContainer` for box layout, borders, and top label bar.
  - `ButtonIconGhost` (`size: 24`, `type: ButtonIconGhostType.secondary`) for `.rightSlot` clear action.
  - `FeedbackText` (`status: FeedbackTextStatus.danger`) for error message.

---

## Component Changelog
* **`v1.5.1`**: Passed `isRequired` to `InputContainer` to render red label asterisk (`*`).
* **`v1.5.0`**: Added smart built-in validation engine for `isRequired`, email, phone, and customizable error texts.
* **`v1.4.1`**: Refactored to compose shared `InputContainer` for visual styling, border states, and label bar.
* **`v1.4.0`**: Separated password logic into dedicated `PasswordInput` (`components/inputs/password_input.dart`); trimmed `isPassword` and `obscuringCharacter` from `TextInput`.
* **`v1.3.1`**: Standardized naming to `showCharacterLimit` and replaced word limit with character limit across all documentation and comments.
* **`v1.3.0`**: Added native `FormField<String>` registration (enabling `FormState.validate()` and `FormState.save()`), `onEditingComplete`, and `obscuringCharacter`.
* **`v1.2.3`**: Renamed `hasLabel` to `hasLabelBar` to control visibility of the entire top bar (including label and character limit counter).
* **`v1.2.2`**: Suffix is always visible across all states; Password toggle and Clear buttons are visible only when input text is present.
* **`v1.2.1`**: Updated suffix color to `textDisabled` (`#99A1AF`), and read-only leading icon and input text color to `textSecondary` (`#4A5565`) as per Figma.
* **`v1.2.0`**: Aligned with updated Figma Nodes `441:9205` & `454:482` (top `labelBarContainer` with right-aligned character limit counter, `.rightSlot` sub-architecture, and read-only stroke `ui4`).
* **`v1.1.1`**: Refined slot priorities (password mode hides leading icon/suffix/clear; independent suffix suppresses character counter; suffix presence suppresses clear button).
* **`v1.1.0`**: Added `leadingWidget`, character counter, password security rules, container tap-to-focus, mouse cursor styling, and `FormField` validator integration.
* **`v1.0.3`**: Retain focus and keyboard active in typing state when clearing input.
* **`v1.0.2`**: Updated leading icon and suffix color to `textPrimary` in typing, filled, read-only, and error states.
* **`v1.0.1`**: Disabled clear button in password mode; verified read-only and token colors against Figma.
* **`v1.0.0`**: Initial release matching Figma Node 441:9205.
