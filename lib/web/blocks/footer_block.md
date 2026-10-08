# FooterBlock

A responsive footer block with contact email, copy-to-clipboard action, and social profile links for landing pages.

## Figma Reference
- **Node ID**: `922:9277`
- **Variants**:
  - `device=PC` (`922:7403`): Width 896px, 24px padding, Row layout with space-between distribution.
    - Left: Email text (14px Geist Regular `#000000`) + `ButtonIconGhost` copy button (24x24px).
    - Right: "Find me on " text (14px Geist Regular `#4A5565`) + `ButtonIcon` white buttons (48x48px, 20px radius).
  - `device=Mobile` (`922:9278`): Width 316px, 24px padding, Column layout with 24px gap.
    - Top: Email text + `ButtonIconGhost` copy button.
    - Bottom: "Find me on " text + `ButtonIcon` white buttons.

## Specifications
- **Email Text**: 14px Geist Regular (`AlterTypography.body`), color `AlterSemanticTokens.textPrimary` (`#000000`).
- **Copy Button**: `ButtonIconGhost` (Node `130:4572`), 24x24px, `ButtonIconGhostType.primary`, icon `content_copy`.
- **Social Label**: 14px Geist Regular (`AlterTypography.body`), color `AlterSemanticTokens.textSecondary` (`#4A5565`).
- **Social Links**: `ButtonIcon` (Node `130:8371`), 48x48px container, 20px border radius, `ButtonIconType.white`, 28px icon glyph.

## Usage

```dart
import 'package:alter/alter.dart';

FooterBlock(
  email: 'hello@example.com',
  socialLinks: [
    FooterSocialLink(
      icon: Icons.code,
      tooltip: 'GitHub',
      onTap: () {},
    ),
    FooterSocialLink(
      icon: Icons.design_services,
      tooltip: 'Figma',
      onTap: () {},
    ),
  ],
)
```
