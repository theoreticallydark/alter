# CurrencyInput

**Version**: `2.0.0`  
**Base**: [NumericInput](file:///c:/Vayu/Alter/lib/components/input/numeric_input.dart)

---

## Overview
`CurrencyInput` is a specialized financial currency entry component built on [NumericInput](file:///c:/Vayu/Alter/lib/components/input/numeric_input.dart). It features a default Euro icon, 2 decimal places, and live comma grouping.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `showLabel` | `bool` | `true` | Visibility toggle for entire label bar |
| `label` | `String?` | `'Amount'` | Top label text |
| `isRequired` | `bool` | `false` | Asterisk indicator beside label |
| `leftIcon` | `IconData?` | `Icons.euro_rounded` | Left currency symbol icon |
| `groupingSystem` | `NumberGroupingSystem` | `international` | Comma grouping system (`international` or `indian`) |
| `allowDecimals` | `bool` | `true` | Decimal support |
| `decimalPlaces` | `int?` | `2` | Number of decimal places |
| `onAmountChanged` | `ValueChanged<num?>?` | `null` | Emits parsed currency amount |

---

## Reused Child Components
- [NumericInput](file:///c:/Vayu/Alter/lib/components/input/numeric_input.dart) (`v2.0.0`)
- [InputControl](file:///c:/Vayu/Alter/lib/components/input/input_control.dart) (`v2.0.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
