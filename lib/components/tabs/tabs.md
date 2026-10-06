# Tabs

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/tabs/tabs)

## Overview
`Tabs` is a horizontal segment/navigation control component in the Alter Design System. It renders a row of [TabItem](file:///c:/Vayu/Alter/lib/components/tabs/tab_item.dart) sub-components with standard 12px spacing, supporting text labels, leading icons, icon-only modes, and coordinated selection state.

## Usage
```dart
// Standard Label Tabs
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

// Composite Tabs with Icons
Tabs(
  tabs: const ['Home', 'Search', 'Profile'],
  hasIcon: true,
  icons: const [Icons.home_outlined, Icons.search_rounded, Icons.face_5_outlined],
  selectedIndex: _currentTabIndex,
  type: TabsType.white,
  onTabSelected: (index) => setState(() => _currentTabIndex = index),
)

// Icon-Only Tabs
Tabs(
  tabs: const ['', '', ''],
  hasIcon: true,
  hasLabel: false,
  icons: const [Icons.grid_view_rounded, Icons.view_list_rounded, Icons.settings_outlined],
  selectedIndex: _currentTabIndex,
  onTabSelected: (index) => setState(() => _currentTabIndex = index),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `tabs` | `List<String>` | `const ['Tab 1', 'Tab 2', 'Tab 3']` | The list of string labels for each tab item. |
| `hasIcon` | `bool` | `false` | Whether tab items display leading icons. |
| `hasLabel` | `bool` | `true` | Whether tab items display text labels. |
| `icon` | `IconData?` | `Icons.face_5_outlined` | Default icon used when `hasIcon` is true and no per-tab icon is provided. |
| `icons` | `List<IconData?>?` | `null` | Optional list of icon glyphs corresponding to each tab index. |
| `iconWidgets` | `List<Widget?>?` | `null` | Optional list of custom icon widgets corresponding to each tab index. |
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
  - `TabsType.gray`: Tab items use `TabItemType.gray` (Selected background: `AlterSemanticTokens.baseNeutral` / `baseGray` `#F9FAFB`).
  - `TabsType.white`: Tab items use `TabItemType.white` (Selected background: `AlterSemanticTokens.baseWhite` `#FFFFFF`).
- **Typography**:
  - Tab Labels: `Body/body-lg` -> `AlterTypography.bodyLg` (Geist 16px, Regular 400, line-height 20px).

---

## Component Changelog
* **`v1.1.0`**: Added `hasIcon` (default `false`), `hasLabel` (default `true`), `icon`, `icons`, and `iconWidgets` to propagate `TabItem` `v1.1.0` capabilities through `Tabs`.
* **`v1.0.0`**: Initial release matching Figma Node `336:10524`.
