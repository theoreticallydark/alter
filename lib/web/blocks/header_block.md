# HeaderBlock

A responsive section header block with an expandable divider line and bold title for landing pages.

## Figma Reference
- **Node ID**: `761:6852`
- **Variants**:
  - `device=PC` (`761:6853`): Width 896px, Column container, 24px gap.
    - `blockHeader`: Row, `alignItems: center`, `gap: 48px`.
      - `Divider` (`559:916`): Horizontal 1px fill.
      - `header` text: 30px Geist Bold (`AlterTypography.h1Bold`), line height 36px, `AlterSemanticTokens.textPrimary` (`#000000`).
  - `device=Mobile` (`761:6861`): Width 316px, Column container, 24px gap.
    - `blockHeader`: Row, `alignItems: center`, `gap: 48px`.
      - `Divider` (`559:916`): Horizontal 1px fill.
      - `header` text: 30px Geist Bold (`AlterTypography.h1Bold`), line height 36px, `AlterSemanticTokens.textPrimary` (`#000000`).

## Specifications
- **Header Text**: 30px Geist Bold (`AlterTypography.h1Bold`), line height 36px, `AlterSemanticTokens.textPrimary` (`#000000`).
- **Divider**: Uses design system `Divider` component (`559:916`), 1px height, color `AlterSemanticTokens.stroke200` (`#E5E7EB`).
- **Gap**: 48px spacing between divider and header text.
- **Children**: Optional `child` slot placed directly below the header section with 24px vertical spacing.

## Usage

```dart
import 'package:alter/alter.dart';

// Standard Section Header
HeaderBlock(
  header: 'Experiences',
)

// Section Header with Embedded Section Content
HeaderBlock(
  header: 'Projects',
  child: ProjectGrid(
    projects: [
      ProjectMarker(title: 'Project 1'),
      ProjectMarker(title: 'Project 2'),
    ],
  ),
)
```
