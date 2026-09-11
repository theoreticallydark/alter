# Search

> Current Version: `v2.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/inputs/search)

## Overview
`Search` is a specialized input field in the Alter Design System built on [InputContainer](file:///c:/Vayu/Alter/lib/components/inputs/input_container.dart). It features a hidden top label bar (`hasLabelBar: false`), a leading search icon, clear button action, and full token styling matching Figma Node `130:11237`.

### Key Features
- **No Label Bar**: Top bar is hidden by default (`hasLabelBar: false`) for a clean, streamlined search bar.
- **Leading Search Icon**: Displays `Icons.search` (24px) with dynamic state coloring (`textSecondary` when empty/unfocused $\rightarrow$ `textPrimary` when focused/typed).
- **Clear Button**: Right-hand clear button ([ButtonIconGhost](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.dart)) appears automatically when search query text is entered.
- **Surface Variants**: Supports `gray` (`#F9FAFB`) and `white` (`#FFFFFF`).
- **Keyboard Action**: Defaults to `TextInputAction.search` for native mobile/desktop keyboard submission.

---

## Usage

### Standard Search Bar
```dart
Search(
  hintText: 'Search items, tags, collections...',
  onChanged: (query) {
    // live filter
  },
  onSubmitted: (query) {
    // perform search
  },
)
```

### White Variant with Custom Icon
```dart
Search(
  type: TextInputVariant.white,
  hintText: 'Search people...',
  icon: Icons.person_search,
  hasClear: true,
)
```

---

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `hintText` | `String` | `'Search'` | Placeholder hint text displayed when empty. |
| `initialValue` | `String?` | `null` | Initial search query. |
| `controller` | `TextEditingController?` | `null` | External controller. |
| `focusNode` | `FocusNode?` | `null` | External focus node. |
| `type` | `TextInputVariant` | `TextInputVariant.gray` | Surface style (`gray` or `white`). |
| `hasIcon` | `bool` | `true` | Visibility flag for the leading icon. |
| `icon` | `IconData?` | `Icons.search` | Leading search icon. |
| `leadingWidget` | `Widget?` | `null` | Custom leading widget slot. |
| `hasClear` | `bool` | `true` | Renders clear button when query text is present. |
| `autofocus` | `bool` | `false` | Automatically focuses input on mount. |
| `enabled` | `bool` | `true` | Enabled state; rendered at **48% opacity** when disabled. |
| `readOnly` | `bool` | `false` | Read-only state (1px `textDisabled` border). |
| `onChanged` | `ValueChanged<String>?` | `null` | Callback emitted on search query change. |
| `onSubmitted` | `ValueChanged<String>?` | `null` | Callback emitted on keyboard submission / enter. |
| `onTap` | `VoidCallback?` | `null` | Callback emitted on container tap. |
| `onEditingComplete` | `VoidCallback?` | `null` | Callback emitted on editing completion. |
| `textInputAction` | `TextInputAction` | `TextInputAction.search` | Keyboard action button. |
| `keyboardType` | `TextInputType` | `TextInputType.text` | Keyboard type. |

---

## Component Changelog
* **`v2.0.0`**: Rebuilt to compose `InputContainer` with `hasLabelBar: false`, leading search icon, clear button action, and surface variants.
