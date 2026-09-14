# InputControl

**Version**: `2.3.0`  
**Figma Node**: [`470:436`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=470-436)

---

## Overview
`InputControl` is the lean visual primitive foundation for all text and numeric inputs in the Alter Design System. It manages the outer container (64px height, 20px border radius), label row (with required asterisk indicator), left icon, prefix/suffix slots, interactive right ghost button slot (`rightButton: ButtonIconGhost?`), border states, focus interactions, character limit overflow logic, multiline start alignment, and multiple error condition resolution.

---

## Architecture & Specialization
`InputControl` keeps common layout and visual styling lean, delegating specialized use-case logic to dedicated wrapper components:

- **`TextInput`**
  - **`SearchInput`** (wrapper of `TextInput`)
  - **`TextArea`** (wrapper of `TextInput` supporting fixed lines or adaptive auto-expansion via `minLines`)
- **`PasswordInput`** (manages `obscureText` toggle via right `ButtonIconGhost`)
- **`NumericInput`** (manages formatters, parsing, commas)
  - **`OTPInput`** (digit grid)
  - **`CurrencyInput`** (wrapper of `NumericInput`)
- **`DropdownInput`** (future)
- **`CalendarInput`** (future)

---

## Key Behaviors
1. **Pure Flutter Lifecycle (Self-Managing States)**:
   - Visual states (`default_` empty, `selected` focused, `filled` populated) are **100% dynamically driven** by `FocusNode` and `TextEditingController`.
   - Focus turns the border active black (`stroke1000`) and displays the live character counter when a label is present.
2. **Streamlined Nullable Properties**:
   - `label`, `characterLimit`, `prefix`, `suffix`, `leftIcon` are clean nullable properties.
   - **Label & Character Counter Rule**: The top `labelBar` (and its right-side live counter) is rendered **only when `label` is non-null and non-empty**. If `label == null`, no top label bar is rendered on the UI.
   - **Character Limit Validation**: If `characterLimit` is set without a label, validation (e.g. error boundary and overflow message) continues to function in the background.
3. **Clean Multiline Sizing**:
   - Accepts `minLines` and `maxLines` directly (defaulting to 1 for single-line inputs).
   - Icons, prefixes, and suffixes automatically align to the top (`CrossAxisAlignment.start`) during multiline modes.
4. **Boolean `enabled` and `readOnly`**:
   - `enabled: false`: Renders the component at **48% opacity** and blocks pointer interactions (`IgnorePointer`).
   - `readOnly: true`: Displays text in `AlterSemanticTokens.textSecondary` and border in `AlterSemanticTokens.textDisabled`, preventing keyboard editing while allowing text selection/copy.
5. **Required Indicator**:
   - When `isRequired == true`, an asterisk `*` is appended directly beside the label text (`"$label *"`) using the **exact same color as the label** (`AlterSemanticTokens.textSecondary`).
6. **Interactive Right Button (`ButtonIconGhost`)**:
   - Accepts a [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) directly via `rightButton`.
7. **Automatic Overflow Handling**:
   - If character count exceeds `characterLimit`:
     - `isError` becomes `true` (triggering red danger border).
     - Character counter text color changes to `AlterSemanticTokens.textDanger`.
     - Error message displays `"Character limit exceeded"` when `showErrorMessage: true`.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Label'` | Label text (omits labelBar when `null`) |
| `isRequired` | `bool` | `false` | Renders asterisk `*` beside label in label color |
| `characterLimit` | `int?` | `32` | Maximum character limit number |
| `type` | `InputControlType` | `gray` | Surface variant (`gray` or `white`) |
| `placeholder` | `String` | `'Input'` | Ghost text displayed when empty |
| `value` | `String?` | `null` | Current input value |
| `leftIcon` | `IconData?` | `Icons.face_5_outlined` | Left icon data |
| `leftIconWidget` | `Widget?` | `null` | Custom left icon widget override |
| `prefix` | `String?` | `'Prefix'` | Prefix text |
| `prefixWidget` | `Widget?` | `null` | Custom prefix widget override |
| `suffix` | `String?` | `'Suffix'` | Suffix text |
| `suffixWidget` | `Widget?` | `null` | Custom suffix widget override |
| `rightButton` | `ButtonIconGhost?` | `null` | Trailing interactive action slot |
| `obscureText` | `bool` | `false` | Text obscuring flag for password inputs |
| `obscuringCharacter` | `String` | `'•'` | Character used when obscured |
| `maxLines` | `int?` | `1` | Max visible text lines (or lines ceiling) |
| `minLines` | `int?` | `1` | Min visible text lines |
| `inputFormatters` | `List<TextInputFormatter>?` | `null` | Custom input formatters |
| `isError` | `bool` | `false` | Sets border color to error danger token |
| `showErrorMessage` | `bool` | `true` | Shows error message caption when error is active |
| `errorMessage` | `String` | `'Error Message'` | Single error text fallback |
| `errorMessages` | `List<String>?` | `null` | List of multiple active errors (renders latest in order) |
| `enabled` | `bool` | `true` | Interactive enabled flag (renders 48% opacity when false) |
| `readOnly` | `bool` | `false` | Readonly flag (renders disabled border & secondary text) |

---

## Design Tokens & Variables Used

### Child Components Reused
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)

### Typography
- **Label**: `AlterTypography.bodyLg` (Medium, 16px)
- **Input Text / Placeholder**: `AlterTypography.bodyLg` (Regular, 16px)
- **Character Counter / Limit**: `AlterTypography.bodyLg` (Regular, 16px)
- **Error Caption**: `AlterTypography.caption` (Regular, 12px)

### Colors & Semantic Tokens
- **Surface Gray**: `AlterSemanticTokens.baseGray` (`#F9FAFB`)
- **Surface White**: `AlterSemanticTokens.baseWhite` (`#FFFFFF`)
- **Border Default Gray**: `AlterSemanticTokens.stroke200` (`#E5E7EB`)
- **Border Default White**: `AlterSemanticTokens.stroke100` (`#F3F4F6`)
- **Border Focused/Selected**: `AlterSemanticTokens.stroke1000` (`#000000`, 1px solid)
- **Border Error**: `AlterSemanticTokens.textDanger` (`#EF4444` / `#E7000B`)
- **Border ReadOnly**: `AlterSemanticTokens.textDisabled` (`#99A1AF`)
- **Text Primary**: `AlterSemanticTokens.textPrimary` (`#000000`)
- **Text Secondary (Label, Readonly, Counter)**: `AlterSemanticTokens.textSecondary` (`#4A5565`)
- **Text Disabled (Placeholder, Disabled)**: `AlterSemanticTokens.textDisabled` (`#99A1AF`)
- **Text Danger (Error Caption & Overflow Counter)**: `AlterSemanticTokens.textDanger` (`#E7000B`)
