# MobileGrid Component Documentation

## Overview
`MobileGrid` is a responsive layout and showcase component designed to present multiple mobile application mockups (`MobileMarker` screens) accompanied by unified entity metadata (`BioMarker`).

## Figma Specifications
- **Component Set**: `MobileGrid` (Node `810:10819`)
- **PC Device Mode**:
  - The user controls `width` (or fills available parent width); `height` is hug contents.
  - Hosts 4 `MobileMarker` cards of variant `scale=Width` filling the width in gaps of `24px`.
  - Each card's height is auto-deduced based on the `428:926` aspect ratio (`height = itemWidth / (428/926)`).
  - `isCarousel=False` (Node `810:10818`): Static 4-column row of 4 `MobileMarker` cards + `BioMarker`.
  - `isCarousel=True` (Node `811:11752`): Sliding carousel with 4 cards visible at a time and `CarouselControl` overlay chevrons + `BioMarker`.
- **Mobile Device Mode**:
  - Regardless of `isCarousel` (true or false), always renders the single thumb-based scroll carousel (Node `810:10991`).
  - Hosts `MobileMarker` cards of variant `scale=Height` (`height: 480.0px`, width auto-deduced ~`221.86px`, gap `24px`).
  - Viewport peek cue via `mobileViewportFraction` (default `0.78`) so the subsequent card is visible as a scroll cue.
  - Bottom `BioMarker` adapts to compact mobile layout (`hasLogo: false`, `hasBadgeBar: false`).

## Sizing & Design Tokens
- **Container Sizing**:
  - PC Default Width: `896px` (or flexible fill)
  - Mobile Default Width: `316px` (or responsive)
  - Mobile Marker Aspect Ratio: `428 / 926`
  - Gap: `24px` between mobile markers, `16px` between media section and `BioMarker`
- **Design Tokens**:
  - Colors: `AlterSemanticTokens.textPrimary`, `AlterSemanticTokens.textSecondary`, `AlterSemanticTokens.stroke100`, `AlterSemanticTokens.baseWhite`
  - Typography: `AlterTypography.h2Bold`, `AlterTypography.bodyLargeRegular`, `AlterTypography.captionRegular`

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `device` | `MobileGridDevice` | `auto` | Viewport mode (`auto`, `pc`, `mobile`). |
| `isCarousel` | `bool` | `false` | Whether to display as a sliding/swiping carousel or static 4-column grid. |
| `mobileViewportFraction` | `double` | `0.78` | Viewport fraction on mobile to peek the next item. |
| `mobileContainerHeight` | `double` | `480.0` | Height of the mobile screen containers on mobile. |
| `pcItemsPerView` | `int` | `4` | Number of items visible in PC carousel view. |
| `gap` | `double` | `24.0` | Spacing between mobile mockup items. |
| `imageUrls` | `List<String>?` | `null` | List of mockup image URLs. |
| `items` | `List<Widget>?` | `null` | Pre-constructed widget items. |
| `onItemTap` | `ValueChanged<int>?` | `null` | Callback triggered when a mockup item is tapped. |
| `title` | `String` | `'Title'` | Entity title in bottom BioMarker. |
| `subtitle` | `String` | `'Subtitle'` | Entity subtitle in bottom BioMarker. |
| `badges` | `List<Widget>?` | `null` | Badges displayed in BioMarker. |
| `logo` / `logoWidget` | `ImageProvider?` / `Widget?` | `null` | Entity logo. |

## Usage Examples

### 1. Static 4-Column PC Grid
```dart
MobileGrid(
  isCarousel: false,
  imageUrls: [
    'https://example.com/screen1.png',
    'https://example.com/screen2.png',
    'https://example.com/screen3.png',
    'https://example.com/screen4.png',
  ],
  title: 'Fintech App Showcase',
  subtitle: 'Mobile Banking & Wealth Platform',
)
```

### 2. Mobile Swipe Carousel with Viewport Peek
```dart
MobileGrid(
  device: MobileGridDevice.mobile,
  isCarousel: true,
  mobileViewportFraction: 0.78,
  imageUrls: [
    'https://example.com/screen1.png',
    'https://example.com/screen2.png',
    'https://example.com/screen3.png',
    'https://example.com/screen4.png',
  ],
  title: 'Mobile Wallet',
  subtitle: 'iOS 18 Interface Flow',
)
```
