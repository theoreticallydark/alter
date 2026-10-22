# BrandBlock

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/sites/brandblock)

## Overview
`BrandBlock` is a responsive social proof and partner brand showcase block for landing pages. It features an optional section headline and a flowing wrap bar of brand logo tiles.

## Figma Reference
* **Node ID**: `761:6543`
* **Variants**:
  * `device=PC` (`761:6544`): Width 896px, Column layout, 12px gap, centered.
  * `device=Mobile` (`761:6552`): Width 316px, Column layout, 12px gap, centered.

## Design Specifications
* **Title**: 14px Geist Regular (`AlterTypography.body`), line height 16px, center aligned, `AlterSemanticTokens.textSecondary` (`#4A5565`).
* **BrandBar**: Wrap flow layout with 12px horizontal and vertical spacing (`spacing: 12.0`).
* **Brand Tiles**:
  * Height: Fixed 64px (`brandHeight = 64.0`).
  * Corner Radius: 16px (`brandRadius = BorderRadius.circular(16)`).
  * Width: Hugs content / source image aspect ratio (`BoxFit.fitHeight`).
  * Background: `AlterSemanticTokens.bgSubtle` / `#F9FAFB`.
  * Border: `AlterSemanticTokens.borderSubtle` (1px).

## Usage

```dart
import 'package:alter/alter.dart';

// Default design system brands
BrandBlock(
  device: AlterBlockDevice.auto,
)

// Custom brands
BrandBlock(
  title: 'Trusted by world-class teams',
  brands: [
    BrandItem(
      name: 'Google',
      imageUrl: 'https://example.com/google.png',
      child: const Text('Google'),
    ),
    BrandItem(
      name: 'Siemens',
      imageUrl: 'https://example.com/siemens.png',
    ),
  ],
)
```

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `device` | `AlterBlockDevice` | `AlterBlockDevice.auto` | Viewport adaptation mode (`auto`, `pc`, `mobile`). |
| `title` | `String` | `'Brands I've worked with'` | Headline text above the brand tiles. |
| `brands` | `List<BrandItem>?` | `null` | Custom list of brand tiles. If null, displays default design system partner tiles. |
| `brandHeight` | `double` | `64.0` | Fixed height of each brand tile. |
| `brandRadius` | `BorderRadius` | `circular(16)` | Corner radius of the brand tile containers. |
| `onBrandTap` | `ValueChanged<int>?` | `null` | Callback executed when a brand tile is tapped. |

---

## Changelog

### 1.0.0
- Initial release matching Figma Node `761:6543`.
