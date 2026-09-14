# TextInput

**Version**: `2.4.0`  
**Figma Node**: [`471:1547`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=471-1547)

---

## Overview
`TextInput` is the primary text entry field in the Alter Design System built on top of [InputControl](file:///c:/Vayu/Alter/lib/components/inputs/input_control.dart). It integrates full Flutter `FormField<String>` support (`validator`, `onSaved`, `autovalidateMode`), built-in text input filtering (`TextInputMode`), direct `keyboardType` override, deferred `isRequired` validation, and multi-error condition rendering.

---

## Key Features & Behaviors

1. **Pure Flutter Lifecycle**:
   - Focus and text states are self-managing with zero manual status boilerplate.
2. **Streamlined Nullable API**:
   - `label`, `prefix`, `suffix`, `leftIcon`, `characterLimit` render when non-null/non-empty.
   - Top label bar and typing counter render when `label != null`.
3. **Figma Preset Compositions**:
   - Default left icon (`Icons.face_5_outlined`).
   - Default gray surface (`InputControlType.gray`).
   - Default character limit `32` with dynamic typing counter.
4. **Deferred `isRequired` Validation**:
   - Asterisk `*` is appended to the label in `AlterSemanticTokens.textSecondary`.
   - Error is deferred until the user touches/blurs the field or the form submits.
5. **Multiple Error Priority**:
   - Evaluates custom `errorMessages`, format rules (email, phone), and character overflows, rendering the latest active error in order.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Label'` | Label text (omits labelBar when `null`) |
| `isRequired` | `bool` | `false` | Renders asterisk `*` beside label in label color |
| `characterLimit` | `int?` | `32` | Maximum character count limit |
| `type` | `InputControlType` | `gray` | Surface variant (`gray` or `white`) |
| `inputMode` | `TextInputMode` | `all` | Character filtering & keyboard mode |
| `keyboardType` | `TextInputType?` | `null` | Direct native virtual keyboard override |
| `placeholder` | `String` | `'Input'` | Placeholder text |
| `value` | `String?` | `null` | Current input value |
| `leftIcon` | `IconData?` | `Icons.face_5_outlined` | Leading static icon |
| `leftIconWidget` | `Widget?` | `null` | Leading custom icon widget |
| `prefix` | `String?` | `null` | Leading prefix text |
| `prefixWidget` | `Widget?` | `null` | Leading custom prefix widget |
| `suffix` | `String?` | `null` | Trailing suffix text |
| `suffixWidget` | `Widget?` | `null` | Trailing custom suffix widget |
| `rightButton` | `ButtonIconGhost?` | `null` | Trailing ghost icon button |
| `maxLines` | `int?` | `1` | Maximum visible lines |
| `minLines` | `int?` | `1` | Minimum visible lines |
| `inputFormatters` | `List<TextInputFormatter>?` | `null` | Custom input formatters |
| `isError` | `bool` | `false` | Manual error flag |
| `showErrorMessage` | `bool` | `true` | Show error caption |
| `errorMessage` | `String` | `'Error Message'` | Single error text |
| `errorMessages` | `List<String>?` | `null` | List of multiple active errors |
| `enabled` | `bool` | `true` | Interactive enabled flag (48% opacity when false) |
| `readOnly` | `bool` | `false` | Readonly flag |
| `validator` | `FormFieldValidator<String>?` | `null` | Form validation function |
| `onSaved` | `FormFieldSetter<String>?` | `null` | Form save callback |
| `onChanged` | `ValueChanged<String>?` | `null` | Text change callback |
| `onSubmitted` | `ValueChanged<String>?` | `null` | Enter/submit callback |

---

## Design Tokens & Variables Used

### Child Components Reused
- [InputControl](file:///c:/Vayu/Alter/lib/components/inputs/input_control.dart) (`v2.1.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)

### Typography
- **Label**: `AlterTypography.bodyLg` (Medium, 16px)
- **Input Text / Placeholder**: `AlterTypography.bodyLg` (Regular, 16px)
- **Character Counter**: `AlterTypography.bodyLg` (Regular, 16px)
- **Error Caption**: `AlterTypography.caption` (Regular, 12px)
