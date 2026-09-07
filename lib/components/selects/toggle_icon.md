# ToggleIcon

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/inputs/toggleicon)

## Overview
`ToggleIcon` is a binary toggle button (e.g. favorite heart) supporting checked (`AlterColors.colorsPink600`) and unchecked (`AlterSemanticTokens.textSecondary`) states.

## Usage
```dart
ToggleIcon(
  state: ToggleIconState.checked,
  onChanged: (newState) => print('Toggle: $newState'),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `state` | `ToggleIconState` | `ToggleIconState.unchecked` | Binary state (`unchecked`, `checked`). |
| `onChanged` | `ValueChanged<ToggleIconState>?` | `null` | Callback invoked when tapped. |
| `size` | `double` | `24.0` | Outer dimension of the toggle icon. |

---

## Component Changelog
* **`v1.0.0`**: Initial release with `AlterColors.colorsPink600` for active state.
