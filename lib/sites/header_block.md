# HeaderBlock

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/sites/headerblock)

## Overview
`HeaderBlock` is a responsive section header block featuring an expandable horizontal divider line, bold title typography, and an optional child content slot for landing pages.

## Figma Reference
* **Node ID**: `761:6852`
* **Variants**:
  * `device=PC` (`761:6853`): Width 896px, Column container, 24px gap.
    * `blockHeader`: Row, `alignItems: center`, `gap: 48px`.
      * `Divider` (`559:916`): Horizontal 1px fill.
      * `header` text: 30px Geist Bold (`AlterTypography.h1Bold`), line height 36px, `AlterSemanticTokens.textPrimary` (`#000000`).
  * `device=Mobile` (`761:6861`): Width 316px, Column container, 24px gap.
    * `blockHeader`: Row, `alignItems: center`, `gap: 48px`.
      * `Divider` (`559:916`): Horizontal 1px fill.
      * `header` text: 30px Geist Bold (`AlterTypography.h1Bold`), line height 36px, `AlterSemanticTokens.textPrimary` (`#000000`).

## Design Specifications
* **Header Text**: 30px Geist Bold (`AlterTypography.h1Bold`), line height 36px, `AlterSemanticTokens.textPrimary` (`#000000`).
* **Divider**: Uses design system `Divider` component (`559:916`), 1px height, color `AlterSemanticTokens.stroke200` (`#E5E7EB`).
* **Gap**: 48px spacing between divider and header text.
* **Children**: Optional `child` slot placed directly below the header section with 24px vertical spacing.

## Usage

```dart
import 'package:alter/alter.dart';

// Standard Section Header
HeaderBlock(
  header: 'Experiences',
  device: AlterBlockDevice.auto,
)

// Section Header with Embedded Section Content
HeaderBlock(
  header: 'Projects',
  child: const GraphicsGridBlock(
    projects: [
      GraphicsBlock(title: 'Project 1'),
      GraphicsBlock(title: 'Project 2'),
    ],
  ),
)
```

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `device` | `AlterBlockDevice` | `AlterBlockDevice.auto` | Viewport adaptation mode (`auto`, `pc`, `mobile`). |
| `header` | `String` | `'Header'` | Headline title text displayed on the right. |
| `hasDivider` | `bool` | `true` | Whether the expandable divider line is shown. |
| `child` | `Widget?` | `null` | Optional content widget placed directly below the header bar. |

---

## Changelog

### 1.0.0
- Initial release matching Figma Node `761:6852`.
