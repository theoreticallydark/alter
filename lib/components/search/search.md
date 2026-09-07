# Search

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/inputs/search)

## Overview
`Search` is a rounded input field with 20px corners, 64px height, and `AlterSemanticTokens.baseGray` fill. It features distinct visual states for Default (unfocused), Typing (active with 1px `stroke1000` border), and Typed text.

## Usage
```dart
Search(
  hintText: 'Search components...',
  onChanged: (query) => print('Query: $query'),
  onSubmitted: (query) => print('Submitted: $query'),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `hintText` | `String` | `'Search'` | Placeholder text displayed when input is empty. |
| `controller` | `TextEditingController?` | `null` | Optional external controller (internal fallback managed automatically). |
| `focusNode` | `FocusNode?` | `null` | Optional focus node for focus tracking and automation. |
| `onChanged` | `ValueChanged<String>?` | `null` | Callback triggered whenever text input changes. |
| `onSubmitted` | `ValueChanged<String>?` | `null` | Callback triggered when the keyboard action is submitted. |
| `onTap` | `VoidCallback?` | `null` | Tap callback for the input field. |
| `onEditingComplete` | `VoidCallback?` | `null` | Callback triggered when editing finishes. |
| `autofocus` | `bool` | `false` | Whether to automatically request keyboard focus on mount. |
| `enabled` | `bool` | `true` | Whether the search input is enabled. |
| `readOnly` | `bool` | `false` | When true, input cannot be edited via keyboard. |
| `textInputAction` | `TextInputAction` | `TextInputAction.search` | Action button on the virtual keyboard. |
| `keyboardType` | `TextInputType` | `TextInputType.text` | Virtual keyboard type. |

---

## Component Changelog
* **`v1.0.1`**: Removed extra non-Figma leading/trailing slots to strictly match Figma Node 130:11237 specs.
* **`v1.0.0`**: Initial release.
