# InputControl

**Version**: `3.0.0`  
**Figma Node**: [`470:436`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=470-436)

---

## Overview
`InputControl` is the lean visual primitive foundation for all text and numeric inputs in the Alter Design System. It manages the outer container (`defaultSize` 20px radius / `compact` 14px radius), vertical slot hierarchy (`upSlot`, main `levelOne` row, `downSlot`), label row (with required asterisk indicator), left icon, prefix/suffix slots, interactive right ghost button slot (`rightButton: ButtonIconGhost?`), active border states (hover + focus/selected), character limit overflow logic, multiline start alignment, and multiple error condition resolution.

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
1. **Pure Flutter Lifecycle & Active State Management**:
   - Visual states (`default` empty, `active` focused/hovered/selected, `filled` populated) are dynamically driven by `FocusNode`, `TextEditingController`, and `MouseRegion`.
   - Hovering or focusing turns the border active black (`interactivePrimaryBorder` / `#030712`) and displays the live character counter when a label is present.
2. **Vertical Slot Layout (`upSlot`, `levelOne`, `downSlot`)**:
   - Inside `inputContainer`, elements are arranged in a vertical column with `16px` gap:
     - `upSlot`: Optional widget placed above the primary input row (e.g. preview content, filter chips).
     - `levelOne`: Primary horizontal input row (Left Icon + Prefix + Input Text + Suffix + Right Button).
     - `downSlot`: Optional widget placed below the primary input row (e.g. secondary actions, attachments, hints).
3. **Size Variations (`defaultSize` vs `compact`)**:
   - `defaultSize`: `20px vertical, 24px horizontal` padding, `20px` border radius, `16px` typography (`AlterTypography.bodyLg`), `24x24px` left icon.
   - `compact`: `12px` padding on all sides, `14px` border radius, `14px` typography (`AlterTypography.body`), `20x20px` left icon.
4. **Streamlined Nullable Properties**:
   - `label`, `characterLimit`, `prefix`, `suffix`, `leftIcon`, `upSlot`, `downSlot` are clean nullable properties.
   - **Label & Character Counter Rule**: The top `labelBar` (and its right-side live counter) is rendered **only when `label` is non-null and non-empty**. If `label == null`, no top label bar is rendered on the UI.
5. **Clean Multiline Sizing**:
   - Accepts `minLines` and `maxLines` directly (defaulting to 1 for single-line inputs).
   - Icons, prefixes, and suffixes automatically align to the top (`CrossAxisAlignment.start`) during multiline modes.
6. **Boolean `enabled` and `readOnly`**:
   - `enabled: false`: Renders the component at **48% opacity** and blocks pointer interactions (`IgnorePointer`).
   - `readOnly: true`: Displays text in `AlterSemanticTokens.textSecondary` and border in `AlterSemanticTokens.textDisabled`, preventing keyboard editing while allowing text selection/copy.
7. **Required Indicator**:
   - When `isRequired == true`, an asterisk `*` is appended directly beside the label text (`"$label *"`) using the **exact same color as the label** (`AlterSemanticTokens.textSecondary`).
8. **Interactive Right Button (`ButtonIconGhost`)**:
   - Accepts a [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) directly via `rightButton`.
9. **Automatic Overflow Handling**:
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
| `size` | `InputControlSize` | `defaultSize` | Size variant (`defaultSize`, `compact`) |
| `hasUpSlot` | `bool` | `false` | Visibility flag for upper vertical slot |
| `upSlot` | `Widget?` | `null` | Custom widget in upper slot (above input row) |
| `hasDownSlot` | `bool` | `false` | Visibility flag for lower vertical slot |
| `downSlot` | `Widget?` | `null` | Custom widget in lower slot (below input row) |
| `isSelected` | `bool` | `false` | Explicit active/selected state override |
| `isHovered` | `bool?` | `null` | Manual hover state override |
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
- **Default Size**: `AlterTypography.bodyLg` (Geist 16px Regular 400, line-height 20px)
- **Compact Size**: `AlterTypography.body` (Geist 14px Regular 400, line-height 16px)
- **Error Caption**: `AlterTypography.caption` (Geist 12px Regular 400, line-height 16px)

### Colors & Semantic Tokens
- **Surface Gray**: `AlterSemanticTokens.baseGray` (`#F9FAFB`)
- **Surface White**: `AlterSemanticTokens.baseWhite` (`#FFFFFF`)
- **Border Default**: `AlterSemanticTokens.baseBorder` (`#E5E7EB`, 1px solid)
- **Border Active (Hover / Focus / Selected)**: `AlterSemanticTokens.interactivePrimaryBorder` (`#030712`, 1px solid)
- **Border Error**: `AlterSemanticTokens.textDanger` (`#E7000B`)
- **Border ReadOnly**: `AlterSemanticTokens.textDisabled` (`#99A1AF`)
- **Text Primary**: `AlterSemanticTokens.textPrimary` (`#000000`)
- **Text Secondary (Label, Readonly, Counter)**: `AlterSemanticTokens.textSecondary` (`#4A5565`)
- **Text Disabled (Placeholder, Disabled)**: `AlterSemanticTokens.textDisabled` (`#99A1AF`)
- **Text Danger (Error Caption & Overflow Counter)**: `AlterSemanticTokens.textDanger` (`#E7000B`)

---

## Component Changelog
* **`v3.0.0`**: Added `InputControlSize` enum (`defaultSize`, `compact`), vertical slot hierarchy for `upSlot` and `downSlot`, and unified Active state support across hover (`MouseRegion`) and selection/focus per Figma Node `470:436`.
* **`v2.3.0`**: Streamlined multiline sizing: Clean minLines and maxLines configuration without redundant boolean flags; multiline cross-axis start alignment.
* **`v2.1.0`**: Streamlined label & character limit UI: Removed showLabel and showCharacterLimit booleans. labelBar is rendered whenever label is provided.
* **`v2.0.0`**: Pure Flutter convention overhaul: Removed InputControlStatus enum (visual states are 100% dynamically driven by FocusNode and TextEditingController).
* **`v1.0.0`**: Initial release matching Figma Node `470:436`.
