# TextInput

**Version**: `1.4.0`  
**Figma Node**: [`471:1547`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=471-1547)

---

## Overview
`TextInput` is a form-ready text entry component built on top of [InputControl](file:///c:/Vayu/Alter/lib/components/input/input_control.dart). By default, it applies Figma node `471:1547` configuration (`hasLeftIcon: true`, `hasRightIcon: false`, `hasPrefix: false`, `hasSuffix: false`, `showLabel: true`, `showCharacterLimit: true`), while allowing developers to customize underlying properties, built-in validation, multiple error condition resolution, and Flutter `FormField<String>` integration.

---

## Key Behaviors
1. **Child Component Reuse**:
   - Reuses [InputControl](file:///c:/Vayu/Alter/lib/components/input/input_control.dart) (`v1.4.0`).
2. **Label Bar & Required State**:
   - If `showLabel == false`, the entire label bar is hidden.
   - When `isRequired == true`, an asterisk `*` is placed beside the label in the exact same color.
   - **Deferred `isRequired` Validation**: Pristine fields on initial load show the `*` without triggering an immediate error. The `"This field is required"` message activates upon user interaction / blur or explicit form validation (`Form.validate()`).
   - Dynamic character counter (`x/characterLimit`) is displayed only during typing / active focus state.
3. **Multiple Error Conditions & Latest Error Resolution**:
   - Evaluates active rules in sequence:
     1. Required field check (`"This field is required"`)
     2. Input mode / format checks (`"Please enter a valid email address"` / `"Please enter a valid phone number"`)
     3. Character limit overflow (`"Character limit exceeded"`)
     4. Custom form validator errors
     5. Manual `errorMessages` / `errorMessage`
   - **Renders the latest failing error in order** (`activeErrors.last`).
   - `isError` changes border to `AlterSemanticTokens.textDanger`.
   - `showErrorMessage` controls error message caption visibility.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Label'` | Label text |
| `hasLabel` | `bool` | `true` | Enables label bar |
| `showLabel` | `bool` | `true` | Hides label bar if false |
| `isRequired` | `bool` | `false` | Smart required field validator with label asterisk |
| `hasCharacterLimit` | `bool` | `true` | Enables character limit |
| `showCharacterLimit` | `bool` | `true` | Shows dynamic counter when typing |
| `characterLimit` | `int?` | `32` | Maximum character limit |
| `type` | `InputControlType` | `gray` | Gray or white surface variant |
| `placeholder` | `String` | `'Input'` | Ghost placeholder text |
| `value` | `String?` | `null` | Current input value |
| `hasLeftIcon` | `bool` | `true` *(Figma default)* | Left icon toggle |
| `leftIcon` | `IconData?` | `Icons.face_5_outlined` | Left icon data |
| `hasRightIcon` | `bool` | `false` *(Figma default)* | Right icon toggle |
| `hasPrefix` | `bool` | `false` *(Figma default)* | Prefix toggle |
| `hasSuffix` | `bool` | `false` *(Figma default)* | Suffix toggle |
| `inputMode` | `TextInputMode` | `all` | Input format filter (`all`, `onlyAlphabets`, `alphanumeric`, `onlyNumbers`, `decimal`, `email`, `phone`) |
| `isError` | `bool` | `false` | Sets border to danger token |
| `showErrorMessage` | `bool` | `true` | Displays error caption |
| `errorMessage` | `String` | `'Error Message'` | Custom error text fallback |
| `errorMessages` | `List<String>?` | `null` | List of multiple error conditions |
| `validator` | `FormFieldValidator<String>?` | `null` | Flutter FormField validator |
| `onSaved` | `FormFieldSetter<String>?` | `null` | Form saved callback |
| `onChanged` | `ValueChanged<String>?` | `null` | Text changed callback |

---

## Version Changelog
- **`v1.4.0`**: Deferred `isRequired` validation until touch/blur or explicit Form validation (preventing immediate errors on pristine load).
- **`v1.3.0`**: Added support for multiple error conditions rendering the latest error in order; integrated `InputControl` v1.4.0 `isRequired` asterisk styling.
- **`v1.2.0`**: Synchronized character limit overflow logic with `InputControl` v1.3.0 (`isError=true`, red counter text, and `"Character limit exceeded"`).
- **`v1.1.0`**: Adopted `InputControl` v1.2.0: replaced `wordLimit` with numeric `characterLimit`, hide labelBar if `showLabel` is false, dynamic counter shown only in typing state, independent `isError` and `showErrorMessage` properties.
- **`v1.0.0`**: Initial release of recreated `TextInput` built on `InputControl` matching Figma Node `471:1547`.
