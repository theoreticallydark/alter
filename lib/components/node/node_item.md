# NodeItem

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/components/node/nodeitem)

## Overview
`NodeItem` is an interactive hierarchical tree navigation and node item component designed for sidebars, file trees, project listings, and collapsable navigation panes in the Alter Design System.

## Usage
```dart
NodeItem(
  label: 'Workspace',
  type: NodeItemType.ghost,
  iconData: Icons.folder_outlined,
  hasRightSlot: true,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Label'` | The primary label text. |
| `type` | `NodeItemType` | `.ghost` | Visual style type (`ghost`, `gray`). |
| `isSelected` | `bool` | `false` | Whether the node item is selected. |
| `isHovered` | `bool?` | `null` | Optional explicit hover state override. |
| `isCollapsed` | `bool` | `false` | When true, renders as a compact 32x32px square icon surface. |
| `isCollapsible` | `bool` | `true` | Whether the item supports collapsing/expanding. |
| `hasIcon` | `bool` | `true` | Toggle leading icon display. |
| `icon` | `Widget?` | `null` | Custom leading 20x20 widget (takes precedence over `iconData`). |
| `iconData` | `IconData?` | `Icons.face_5_outlined` | Leading icon glyph. |
| `hasRightSlot` | `bool` | `false` | Toggle trailing action slot. |
| `rightSlot` | `Widget?` | `null` | Custom trailing slot widget (defaults to `ButtonIconGhost`). |
| `hasSpacerOne` | `bool` | `false` | Flag to render the first 20px indent spacer. |
| `hasSpacerTwo` | `bool` | `false` | Flag to render the second 20px indent spacer. |
| `indentationLevel` | `int` | `0` | Convenience hierarchical indentation level (0, 1, 2, ...). |
| `onTap` | `VoidCallback?` | `null` | Tap callback for the main node row. |
| `onToggleCollapse` | `VoidCallback?` | `null` | Tap callback for collapsing/expanding. |
| `onRightSlotTap` | `VoidCallback?` | `null` | Tap callback for the trailing action slot. |

---

## Component Changelog
* **`v1.1.0`**: Improved icon-to-text vertical optical alignment by encapsulating the label within a 20px aligned slot with balanced font leading, and enforced strict 32px height and 32x32px collapsed container geometry per Figma node `657:1758`.
* **`v1.0.0`**: Initial release implementing Figma Node `657:1758` (`NodeItem`) with `Ghost` and `Gray` variants, full interactive hover/select states, collapsible tile mode, and nested indent spacers.
