# Checkbox

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/selects/checkbox)

## Overview
`Checkbox` is a tri-state selection control for Alter supporting `unchecked`, `intermediate`, and `checked` states with custom color tokens.

## Usage
```dart
Checkbox(
  state: CheckboxState.checked,
  onChanged: (newState) => print('New state: $newState'),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `state` | `CheckboxState` | `CheckboxState.unchecked` | Visual state (`unchecked`, `intermediate`, `checked`). |
| `onChanged` | `ValueChanged<CheckboxState>?` | `null` | Callback invoked with next state upon tap. |
| `size` | `double` | `24.0` | Square dimension of the checkbox. |

---

## Component Changelog
* **`v1.0.0`**: Initial release supporting `unchecked`, `intermediate`, and `checked` states with `AlterSemanticTokens.statusSuccess`.
