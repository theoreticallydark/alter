# CurrencyInput

**Version**: `2.2.0`  
**Base**: [NumericInput](file:///c:/Vayu/Alter/lib/components/input/numeric_input.dart)

---

## Overview
`CurrencyInput` is a specialized financial currency entry component built on [NumericInput](file:///c:/Vayu/Alter/lib/components/input/numeric_input.dart). It features a default Euro icon, 2 decimal places, live comma grouping, and deferred required validation on blur.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Amount'` | Top label text (renders top labelBar when non-null) |
| `isRequired` | `bool` | `false` | Asterisk indicator beside label in label color |
| `characterLimit` | `int?` | `null` | Maximum character limit |
| `type` | `InputControlType` | `gray` | Surface variant (`gray` or `white`) |
| `leftIcon` | `IconData?` | `Icons.euro_rounded` | Left currency symbol icon |
| `leftIconWidget` | `Widget?` | `null` | Custom left icon widget override |
| `prefix` | `String?` | `null` | Optional prefix string |
| `prefixWidget` | `Widget?` | `null` | Custom prefix widget override |
| `groupingSystem` | `NumberGroupingSystem` | `international` | Comma grouping system (`international` or `indian`) |
| `allowDecimals` | `bool` | `true` | Decimal support |
| `decimalPlaces` | `int?` | `2` | Number of decimal places |
| `minValue` | `num?` | `null` | Minimum allowed value |
| `maxValue` | `num?` | `null` | Maximum allowed value |
| `placeholder` | `String` | `'0.00'` | Ghost placeholder text |
| `initialValue` | `num?` | `null` | Initial currency amount |
| `controller` | `TextEditingController?` | `null` | External controller |
| `focusNode` | `FocusNode?` | `null` | External focus node |
| `suffix` | `String?` | `null` | Optional suffix string |
| `suffixWidget` | `Widget?` | `null` | Custom suffix widget override |
| `rightButton` | `ButtonIconGhost?` | `null` | Trailing action slot |
| `isError` | `bool` | `false` | Error border and caption toggle |
| `showErrorMessage` | `bool` | `true` | Show/hide error caption container |
| `errorMessage` | `String` | `'Error Message'` | Error caption text |
| `errorMessages` | `List<String>?` | `null` | List of error messages |
| `enabled` | `bool` | `true` | Interactive enabled flag (48% opacity when false) |
| `readOnly` | `bool` | `false` | Readonly flag |
| `onAmountChanged` | `ValueChanged<num?>?` | `null` | Emits parsed currency amount |

---

## Reused Child Components
- [NumericInput](file:///c:/Vayu/Alter/lib/components/input/numeric_input.dart) (`v2.3.0`)
- [InputControl](file:///c:/Vayu/Alter/lib/components/input/input_control.dart) (`v2.3.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
