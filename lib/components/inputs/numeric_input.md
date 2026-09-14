# NumericInput

**Version**: `2.3.0`  
**Base**: [InputControl](file:///c:/Vayu/Alter/lib/components/inputs/input_control.dart)

---

## Overview
`NumericInput` is a specialized numeric entry component built directly on [InputControl](file:///c:/Vayu/Alter/lib/components/inputs/input_control.dart). It features live comma formatting (International and Indian systems), bounds validation, decimal control, and deferred required validation on blur.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Number'` | Top label text (renders top labelBar when non-null) |
| `isRequired` | `bool` | `false` | Asterisk indicator beside label in label color |
| `characterLimit` | `int?` | `null` | Maximum character limit |
| `type` | `InputControlType` | `gray` | Surface variant (`gray` or `white`) |
| `groupingSystem` | `NumberGroupingSystem` | `international` | Comma grouping system (`international`, `indian`, `none`) |
| `allowDecimals` | `bool` | `true` | Decimal point allowed |
| `decimalPlaces` | `int?` | `null` | Max decimal digits |
| `allowNegative` | `bool` | `false` | Negative numbers allowed |
| `minValue` | `num?` | `null` | Minimum allowed value |
| `maxValue` | `num?` | `null` | Maximum allowed value |
| `placeholder` | `String` | `'0'` | Ghost placeholder text |
| `initialValue` | `num?` | `null` | Initial numeric value |
| `controller` | `TextEditingController?` | `null` | External controller |
| `focusNode` | `FocusNode?` | `null` | External focus node |
| `leftIcon` | `IconData?` | `null` | Optional leading icon |
| `prefix` | `String?` | `null` | Optional prefix string |
| `suffix` | `String?` | `null` | Optional suffix string |
| `rightButton` | `ButtonIconGhost?` | `null` | Trailing action slot |
| `isError` | `bool` | `false` | Error border and caption toggle |
| `showErrorMessage` | `bool` | `true` | Show/hide error caption container |
| `errorMessage` | `String` | `'Error Message'` | Error caption text |
| `errorMessages` | `List<String>?` | `null` | List of error messages |
| `enabled` | `bool` | `true` | Interactive enabled flag (48% opacity when false) |
| `readOnly` | `bool` | `false` | Readonly flag |
| `onNumberChanged` | `ValueChanged<num?>?` | `null` | Callback emitting parsed numeric value |

---

## Reused Child Components
- [InputControl](file:///c:/Vayu/Alter/lib/components/inputs/input_control.dart) (`v2.3.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
