# BrandBlock

A responsive social proof and brand partner showcase block for landing pages.

## Figma Reference
- **Node ID**: `761:6543`
- **Variants**:
  - `device=PC` (`761:6544`): Width 896px, Column layout, 12px gap, centered.
  - `device=Mobile` (`761:6552`): Width 316px, Column layout, 12px gap, centered.

## Specifications
- **Title**: 14px Geist Regular (`AlterTypography.body`), line height 16px, center aligned, `AlterSemanticTokens.textSecondary` (`#4A5565`).
- **BrandBar**: Wrap flow layout with 12px horizontal and vertical spacing (`spacing: 12.0`).
- **Brand Tiles**:
  - Height: Fixed 64px (`brandHeight = 64.0`).
  - Corner Radius: 16px (`brandRadius = BorderRadius.circular(16)`).
  - Width: Hugs content / source image aspect ratio (`BoxFit.fitHeight`).
  - Background: `AlterSemanticTokens.bgSubtle` / `#F9FAFB`.
  - Border: `AlterSemanticTokens.borderSubtle` (1px).

## Usage

```dart
import 'package:alter/alter.dart';

// Default design system brands
BrandBlock(
  device: BrandBlockDevice.auto,
)

// Custom brands
BrandBlock(
  title: 'Trusted by world-class teams',
  items: [
    BrandItem(
      name: 'Google',
      imageUrl: 'https://example.com/google.png',
      onTap: () {},
    ),
    BrandItem(
      name: 'Siemens',
      imageUrl: 'https://example.com/siemens.png',
    ),
  ],
)
```
