# Tabs

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/tabs/tabs)

## Overview
`Tabs` is a horizontal segment/navigation control component in the Alter Design System. It renders a row of `TabItem` sub-components with standard 12px spacing and coordinated selection state.

## Usage
```dart
Tabs(
  tabs: const ['Overview', 'Activity', 'Settings'],
  selectedIndex: _currentTabIndex,
  type: TabsType.gray,
  onTabSelected: (index) {
    setState(() {
      _currentTabIndex = index;
    });
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `tabs` | `List<String>` | `const ['Tab 1', 'Tab 2', 'Tab 3']` | The list of string labels for each tab item. |
| `selectedIndex` | `int` | `0` | The 0-based index of the currently active/selected tab. |
| `type` | `TabsType` | `TabsType.gray` | Color variant (`gray` or `white`). |
| `onTabSelected` | `ValueChanged<int>?` | `null` | Callback fired when a tab item is tapped, passing the selected index. |

---

## Design System Tokens & Specs (Figma Node `336:10524`)
- **Layout & Spacing**:
  - Item spacing / Gap: `12px`.
  - Alignment: Centered horizontal row hugging content (`MainAxisSize.min`).
- **Child Components**:
  - Uses `TabItem` (`Node 336:10501`) for each segment.
- **Color Variables**:
  - `TabsType.gray`: Tab items use `TabItemType.gray` (Selected background: `AlterSemanticTokens.baseGray` `#F9FAFB`).
  - `TabsType.white`: Tab items use `TabItemType.white` (Selected background: `AlterSemanticTokens.baseWhite` `#FFFFFF`).
- **Typography**:
  - Tab Labels: `Body/body-lg` -> `AlterTypography.bodyLg` (Geist 16px, Regular 400, line-height 20px).

---

## Component Changelog
* **`v1.0.0`**: Initial release matching Figma Node `336:10524`.
