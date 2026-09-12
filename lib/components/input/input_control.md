# InputControl

**Version**: `1.4.0`  
**Figma Node**: [`470:436`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=470-436)

---

## Overview
`InputControl` is the visual primitive foundation for all text and numeric inputs in the Alter Design System. It manages the outer container (64px height, 20px border radius), label row (with required indicator), left/right icon and prefix/suffix slots, border states, focus interactions, character limit overflow logic, and multiple error condition resolution.

---

## Key Behaviors & Architecture
1. **Label Bar & Required Indicator**:
   - Controlled by `hasLabel` and `showLabel`. If `showLabel == false`, the entire `labelBar` is hidden (including character limit).
   - When `isRequired == true`, an asterisk `*` is appended directly beside the label text (`"$label *"`) using the **exact same color as the label** (`AlterSemanticTokens.textSecondary`).
2. **Character Limit & Overflow Logic**:
   - Configured via `hasCharacterLimit`, `showCharacterLimit`, and numeric `characterLimit` (`int?`, default: `32`).
   - Displays dynamic live count `x/characterLimit` where `x` is the live character count.
   - **Visible only in Typing (Selected / Focused) State**.
   - **Automatic Overflow Handling**: If character count exceeds `characterLimit`:
     - `isError` becomes `true` (triggering red danger border).
     - Character counter text color changes to `AlterSemanticTokens.textDanger`.
     - Error message displays `"Character limit exceeded"` when `showErrorMessage: true`.
3. **Multiple Error Conditions & Priority Resolution**:
   - Supports multiple simultaneous error triggers via `errorMessages` (or `isError` + `errorMessage` + character limit overflow).
   - **Latest Error Priority**: When multiple error conditions occur simultaneously, `InputControl` **renders the latest active error in evaluation sequence** (`_activeErrors.last`).
4. **Status Lifecycle**:
   - `InputControlStatus`: `default_`, `selected`, `filled`, `readonly`, `disabled`.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Label'` | Label text |
| `hasLabel` | `bool` | `true` | Enables label bar slot |
| `showLabel` | `bool` | `true` | Visibility toggle for entire label bar |
| `isRequired` | `bool` | `false` | Renders asterisk `*` beside label in label color |
| `hasCharacterLimit` | `bool` | `true` | Enables character limit slot |
| `showCharacterLimit` | `bool` | `true` | Visibility toggle for character limit (visible only when typing) |
| `characterLimit` | `int?` | `32` | Maximum character limit number |
| `type` | `InputControlType` | `gray` | Surface variant (`gray` or `white`) |
| `status` | `InputControlStatus` | `default_` | Visual status (`default_`, `selected`, `filled`, `readonly`, `disabled`) |
| `placeholder` | `String` | `'Input'` | Ghost text displayed when empty |
| `value` | `String?` | `null` | Current input value |
| `hasLeftIcon` | `bool` | `true` | Left icon slot toggle |
| `leftIcon` | `IconData?` | `Icons.face_5_outlined` | Left icon data |
| `hasPrefix` | `bool` | `true` | Prefix slot toggle |
| `prefix` | `String` | `'Prefix'` | Prefix text |
| `hasSuffix` | `bool` | `true` | Suffix slot toggle |
| `suffix` | `String` | `'Suffix'` | Suffix text |
| `hasRightIcon` | `bool` | `true` | Right icon slot toggle |
| `rightIcon` | `IconData?` | `Icons.face_5_outlined` | Right icon data |
| `isError` | `bool` | `false` | Sets border color to error danger token |
| `showErrorMessage` | `bool` | `true` | Shows error message caption when error is active |
| `errorMessage` | `String` | `'Error Message'` | Single error text fallback |
| `errorMessages` | `List<String>?` | `null` | List of multiple active errors (renders latest in order) |
| `enabled` | `bool` | `true` | Interactive enabled flag |
| `readOnly` | `bool` | `false` | Readonly flag |

---

## Design Tokens & Variables Used

### Typography
- **Label**: `AlterTypography.bodyLg` (Medium, 16px)
- **Input Text / Placeholder**: `AlterTypography.bodyLg` (Regular, 16px)
- **Character Counter / Limit**: `AlterTypography.bodyLg` (Regular, 16px)
- **Error Caption**: `AlterTypography.caption` (Regular, 12px)

### Colors
- **Background**:
  - `InputControlType.gray`: `AlterSemanticTokens.baseGray` (`#F9FAFB`)
  - `InputControlType.white`: `AlterSemanticTokens.baseWhite` (`#FFFFFF`)
- **Borders**:
  - Default / Filled: `AlterSemanticTokens.stroke200` (`#E5E7EB`) / `stroke100` (`#F3F4F6`)
  - Selected (Focused): `AlterSemanticTokens.stroke1000` (`#111827`)
  - Readonly: `AlterSemanticTokens.textDisabled` (`#9CA3AF`)
  - Error: `AlterSemanticTokens.textDanger` (`#EF4444` / `#E7000B`)
- **Text & Icons**:
  - Primary text / label: `AlterSemanticTokens.textPrimary` (`#111827`)
  - Icons & Secondary text (and label asterisk): `AlterSemanticTokens.textSecondary` (`#4B5563`)
  - Placeholder & Disabled: `AlterSemanticTokens.textDisabled` (`#9CA3AF`)
  - Error & Limit Overflow: `AlterSemanticTokens.textDanger` (`#EF4444` / `#E7000B`)

---

## Version Changelog
- **`v1.4.0`**: Added `isRequired` support with asterisk matching label color. Added multiple error condition support rendering the latest error in order.
- **`v1.3.0`**: Added character limit overflow logic (`isError=true`, `AlterSemanticTokens.textDanger` counter color, and `"Character limit exceeded"` error message when character limit is crossed).
- **`v1.2.0`**: Hide entire `labelBar` if `showLabel` is false. Replaced `wordLimit` with numeric `characterLimit` displaying live `x/characterLimit` dynamic counter only in typing/selected state. Replaced `error` status with independent `isError` and `showErrorMessage` properties.
- **`v1.1.0`**: Replaced `initialValue` with clean `value` property; streamlined placeholder and value auto-transitions.
- **`v1.0.0`**: Initial recreation matching Figma Node `470:436`.
