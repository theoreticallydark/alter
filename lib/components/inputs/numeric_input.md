# NumericInput

> Current Version: `v1.2.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/inputs/numericinput)

## Overview
`NumericInput` is a specialized numeric entry component in the Alter Design System that composes [InputContainer](file:///c:/Vayu/Alter/lib/components/inputs/input_container.dart). It provides live thousand grouping (Indian & International numbering systems), decimal precision enforcement, signed/negative support (auto-derived from `minValue < 0`), min/max bounds validation, required indicator (`*` in `textDanger`), leading currency icons, and clear buttons.

### Key Features
- **Number Grouping Systems**:
  - `NumberGroupingSystem.international`: Standard Western 3-digit comma grouping (e.g. `100,000`, `1,000,000.50`).
  - `NumberGroupingSystem.indian`: Indian Lakhs & Crores grouping (e.g. `1,00,000`, `10,00,000.50`).
  - `NumberGroupingSystem.none`: Unformatted numbers (e.g. `1000000.50`).
- **Precision & Limits**:
  - `allowDecimals` & `decimalPlaces` (e.g. `2` for currency / financial inputs).
  - `minValue` & `maxValue` boundaries with automatic error feedback or `clampOnUnfocus`.
  - Negative values (`-`) are permitted automatically when `minValue == null` or `minValue < 0`.
- **Top Label Bar (`labelBarContainer`)**: Label on left with optional red asterisk (`*`) when `isRequired: true`.
- **Currencies & Units**:
  - Material icons (e.g. `Icons.currency_rupee`, `Icons.attach_money`) or custom `leadingWidget`.
  - Units (`kg`, `%`, `hrs`) in `.rightSlot: type=Suffix` or clear button in `type=Clear`.
- **Developer-Friendly Parsing**:
  - `onChangedNumber: ValueChanged<num?>?` emits parsed `int` / `double` values directly.

---

## Usage

### Indian Numbering Format with Rupee Icon & Required Indicator
```dart
NumericInput(
  label: 'Amount (INR)',
  placeholder: '0',
  isRequired: true,
  groupingSystem: NumberGroupingSystem.indian,
  hasIcon: true,
  icon: Icons.currency_rupee,
  decimalPlaces: 2,
  onChangedNumber: (val) {
    print('Parsed value: $val'); // num?
  },
)
```

### International Numbering Format with Dollar Icon
```dart
NumericInput(
  label: 'Annual Salary',
  placeholder: '50,000',
  groupingSystem: NumberGroupingSystem.international,
  hasIcon: true,
  icon: Icons.attach_money,
  maxValue: 1000000,
)
```

### Integer Only with Min/Max Bounds & Unit Suffix
```dart
NumericInput(
  label: 'Weight',
  placeholder: '70',
  allowDecimals: false,
  hasSuffix: true,
  suffix: 'kg',
  minValue: 1,
  maxValue: 300,
)
```

---

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String?` | `'Number'` | Label displayed in top `labelBarContainer`. |
| `hasLabelBar` | `bool` | `true` | Visibility flag for the top bar. |
| `placeholder` | `String?` | `'0'` | Placeholder hint text. |
| `initialValue` | `num?` | `null` | Pre-populated numeric value. |
| `controller` | `TextEditingController?` | `null` | External controller. |
| `focusNode` | `FocusNode?` | `null` | External focus node. |
| `type` | `TextInputVariant` | `TextInputVariant.gray` | Surface style (`gray` or `white`). |
| `groupingSystem` | `NumberGroupingSystem` | `NumberGroupingSystem.international` | Thousand separator system (`none`, `international`, `indian`). |
| `allowDecimals` | `bool` | `true` | Allows floating-point numbers. |
| `decimalPlaces` | `int?` | `null` | Maximum allowed decimal places (e.g. `2`). |
| `minValue` | `num?` | `null` | Minimum allowed value (permits `-` if `minValue < 0` or unset). |
| `maxValue` | `num?` | `null` | Maximum allowed value. |
| `clampOnUnfocus` | `bool` | `false` | Automatically clamps value to min/max on blur. |
| `hasIcon` | `bool` | `false` | Visibility flag for leading icon. |
| `icon` | `IconData?` | `null` | Leading icon (e.g. `Icons.currency_rupee`, `Icons.attach_money`). |
| `leadingWidget` | `Widget?` | `null` | Custom leading widget slot. |
| `hasSuffix` | `bool` | `false` | Renders unit text in `.rightSlot` (`type=Suffix`). |
| `suffix` | `String?` | `null` | Trailing unit text (e.g. `'kg'`, `'%'`). |
| `suffixWidget` | `Widget?` | `null` | Custom widget in `.rightSlot`. |
| `hasClear` | `bool` | `false` | Renders clear button in `.rightSlot` (`type=Clear`). |
| `isRequired` | `bool` | `false` | Marks field as required; appends asterisk (`*`) matching label color and validates on submit/interaction. |
| `autoValidateRules` | `bool` | `true` | Automatically evaluates numeric range & required rules. |
| `requiredErrorText` | `String?` | `null` | Custom error message for required rule. |
| `minErrorText` | `String?` | `null` | Custom error message for minimum value violation. |
| `maxErrorText` | `String?` | `null` | Custom error message for maximum value violation. |
| `isError` | `bool` | `false` | Triggers error border. |
| `hasFeedback` | `bool` | `true` | Controls whether [FeedbackText] is rendered on error. |
| `errorText` | `String?` | `'Feedback Text'` | Error message displayed in [FeedbackText]. |
| `enabled` | `bool` | `true` | Enabled flag (48% opacity when `false`). |
| `readOnly` | `bool` | `false` | Read-only flag (1px `textDisabled` border). |
| `onChangedNumber` | `ValueChanged<num?>?` | `null` | Callback emitting parsed numeric value. |
| `onChanged` | `ValueChanged<String>?` | `null` | Callback emitting raw formatted string. |
| `onSubmitted` | `ValueChanged<String>?` | `null` | Callback emitted on enter/submission. |
| `onEditingComplete` | `VoidCallback?` | `null` | Callback emitted on action button. |
| `validator` | `FormFieldValidator<String>?` | `null` | Custom validation function; registers with Flutter's `Form`. |
| `onSaved` | `FormFieldSetter<String>?` | `null` | Form save function; registers with Flutter's `Form`. |
| `autovalidateMode` | `AutovalidateMode?` | `null` | Native form autovalidate mode. |

---

## Component Changelog
* **`v1.2.0`**: Streamlined by removing redundant `allowNegative` (auto-derived from `minValue < 0`) and character limit properties; passed `isRequired` to `InputContainer` to render red label asterisk (`*`).
* **`v1.1.0`**: Added smart numeric range & required validation engine with custom error text overrides.
* **`v1.0.0`**: Initial release of dedicated `NumericInput` component with Indian/International grouping, decimal control, and min/max limits.
