# Input Components Architecture & Design System Conventions

## 1. Directory Structure & Exports
* All input components must reside in `lib/components/inputs/` (plural naming convention).
* Public components must be cleanly exported in `lib/alter.dart`.

## 2. Slot Standardization & Right Actions
* Standardize on `rightButton: ButtonIconGhost?` for trailing actions across inputs (per Figma Node `470:436`).
* Do not introduce stepper controls or dual increment/decrement buttons to `NumericInput` or `CurrencyInput` unless explicitly specified in Figma.

## 3. Multiline & Adaptive Sizing Paradigm
* Use streamlined sizing properties:
  * `lines: int`: Specifies reserved lines (for fixed height) or maximum growth ceiling (for adaptive height).
  * `minLines: int?`: Optional starting line count.
    * When `minLines == null`: Fixed reserved height (`minLines = lines, maxLines = lines`).
    * When `minLines` is provided: Dynamic adaptive expansion starting at `minLines` and growing up to `lines`.
* Avoid redundant boolean flags (e.g. `isAdaptive`, `reservedLinesOnly`) when nullable properties express both configurations cleanly.
* Always guard line bounds (`minLines <= maxLines`) in `InputControl` to prevent Flutter framework runtime assertion failures.

## 4. Deferred Validation Lifecycle (`isRequired`)
* Do not trigger `isRequired` errors immediately upon field focus or initial cursor click.
* Defer required validation until the user has blurred the field (`_hasBeenTouched`) or submitted/typed into the form.

## 5. PasswordInput Conventions
* `leftIcon` defaults to `null` (clean surface by default).
* Built-in interactive eye toggle using `ButtonIconGhost` (`Icons.visibility_outlined` / `Icons.visibility_off_outlined`).
* Support space denial (`allowSpaces: false` by default), character limit overflow, and optional strength validation rules (numbers, special characters).

## 6. Native Flutter Keyboard Escape Hatches
* In addition to high-level `TextInputMode` presets, expose an optional `keyboardType: TextInputType?` fallback on text entry components (`TextInput`, `TextArea`) for direct native virtual keyboard control.
