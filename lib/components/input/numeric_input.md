# NumericInput

**Version**: `2.0.0`  
**Base**: [InputControl](file:///c:/Vayu/Alter/lib/components/input/input_control.dart)

---

## Overview
`NumericInput` is a comprehensive numeric entry component with live comma formatting (International and Indian systems), bounds validation, decimal control, and optional steppers.

---

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `showLabel` | `bool` | `true` | Visibility toggle for entire label bar |
| `label` | `String?` | `'Number'` | Top label text |
| `isRequired` | `bool` | `false` | Asterisk indicator beside label |
| `groupingSystem` | `NumberGroupingSystem` | `international` | Comma grouping system (`international`, `indian`, `none`) |
| `allowDecimals` | `bool` | `true` | Decimal point allowed |
| `decimalPlaces` | `int?` | `null` | Max decimal digits |
| `allowNegative` | `bool` | `false` | Negative numbers allowed |
| `minValue` | `num?` | `null` | Minimum allowed value |
| `maxValue` | `num?` | `null` | Maximum allowed value |
| `showSteppers` | `bool` | `false` | Shows + / - ghost buttons |
| `step` | `num?` | `1` | Increment/decrement step |
| `onNumberChanged` | `ValueChanged<num?>?` | `null` | Callback emitting parsed numeric value |

---

## Reused Child Components
- [InputControl](file:///c:/Vayu/Alter/lib/components/input/input_control.dart) (`v2.0.0`)
- [ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart) (`v1.1.0`)
