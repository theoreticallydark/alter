# FooterBlock

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/sites/footerblock)

## Overview
`FooterBlock` is a responsive footer section component with contact email presentation, integrated copy-to-clipboard action, and configurable social profile links for landing pages.

## Figma Reference
* **Node ID**: `922:9277`
* **Variants**:
  * `device=PC` (`922:7403`): Designed width 896px (contextual fill / end-to-end), 24px padding, Row layout with space-between distribution.
    * Left: Email text (14px Geist Regular `#000000`) + `ButtonIconGhost` copy button (24x24px).
    * Right: "Find me on " text (14px Geist Regular `#4A5565`) + `ButtonIcon` white buttons (48x48px, 20px radius).
  * `device=Mobile` (`922:9278`): Designed width 316px (contextual fill / end-to-end), 24px padding, Column layout with 24px gap, center-aligned.
    * Top: Email text + `ButtonIconGhost` copy button.
    * Bottom: "Find me on " text + `ButtonIcon` white buttons.

## Design Specifications
* **Layout Behavior**: Contextual fill (`width: double.infinity` across bounded parents) without max-width capping, allowing full end-to-end spread of email and availability containers.
* **Email Text**: 14px Geist Regular (`AlterTypography.body`), color `AlterSemanticTokens.textPrimary` (`#000000`).
* **Copy Button**: `ButtonIconGhost` (Node `130:4572`), 24x24px, `ButtonIconGhostType.primary`, icon `content_copy`.
* **Social Label**: 14px Geist Regular (`AlterTypography.body`), color `AlterSemanticTokens.textSecondary` (`#4A5565`).
* **Social Links**: `ButtonIcon` (Node `130:8371`), 48x48px container, 20px border radius, `ButtonIconType.white`, 28px icon glyph.

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

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `device` | `AlterBlockDevice` | `AlterBlockDevice.auto` | Viewport adaptation mode (`auto`, `pc`, `mobile`). |
| `email` | `String` | `'hello@example.com'` | Contact email address displayed on the left/top. |
| `socialLabel` | `String` | `'Find me on'` | Label preceding social link icon buttons. |
| `socialLinks` | `List<FooterSocialLink>` | `const [...]` | List of social link button models. |
| `onEmailCopied` | `VoidCallback?` | `null` | Optional callback triggered when email is copied to clipboard. |

---

## Changelog

### 1.0.1
- Unified device parameter to `AlterBlockDevice`.
- Improved contextual fill across wide parents.

### 1.0.0
- Initial release matching Figma Node `922:9277`.
