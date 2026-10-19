# MobileMockupsGridBlock Component Documentation

## Overview
`MobileMockupsGridBlock` (formerly `MobileGrid`) is a responsive layout and showcase component designed to present multiple mobile application mockups (`MobileMockupBlock` screens) accompanied by unified entity metadata (`BiographyBlock`).

## Figma Specifications
- **Component Set**: `MobileMockupsGridBlock` (Node `810:10819`)
- **PC Device Mode**:
  - The user controls `width` (or fills available parent width); `height` is hug contents.
  - Hosts 4 `MobileMockupBlock` cards of variant `scale=Width` filling the width in gaps of `24px`.
  - Each card's height is auto-deduced based on the `428:926` aspect ratio (`height = itemWidth / (428/926)`).
  - `isCarousel=False` (Node `810:10818`): Static 4-column row of 4 `MobileMockupBlock` cards + `BiographyBlock`.
  - `isCarousel=True` (Node `811:11752`): Sliding carousel with 4 cards visible at a time and `CarouselControl` overlay chevrons + `BiographyBlock`.
- **Mobile Device Mode**:
  - Regardless of `isCarousel` (true or false), always renders the single thumb-based scroll carousel (Node `810:10991`).
  - Hosts `MobileMockupBlock` cards of variant `scale=Height` (`height: 480.0px`, width auto-deduced ~`221.86px`, gap `24px`).
  - Viewport peek cue via `mobileViewportFraction` (default `0.78`) so the subsequent card is visible as a scroll cue.
  - Bottom `BiographyBlock` adapts to compact mobile layout (`hasLogo: false`, `hasBadgeBar: false`).

## Sizing & Design Tokens
- **Container Sizing**:
  - PC Default Width: `896px` (or flexible fill)
  - Mobile Default Width: `316px` (or responsive)
  - Mobile Marker Aspect Ratio: `428 / 926`
  - Gap: `24px` between mobile mockups, `16px` between media section and `BiographyBlock`
- **Design Tokens**:
  - Colors: `AlterSemanticTokens.textPrimary`, `AlterSemanticTokens.textSecondary`, `AlterSemanticTokens.stroke100`, `AlterSemanticTokens.baseWhite`
  - Typography: `AlterTypography.h2Bold`, `AlterTypography.bodyLargeRegular`, `AlterTypography.captionRegular`

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `device` | `MobileMockupsGridBlockDevice` | `auto` | Viewport mode (`auto`, `pc`, `mobile`). |
| `isCarousel` | `bool` | `false` | Whether to display as a sliding/swiping carousel or static 4-column grid. |
| `mobileViewportFraction` | `double` | `0.78` | Viewport fraction on mobile to peek the next item. |
| `mobileContainerHeight` | `double` | `480.0` | Height of the mobile screen containers on mobile. |
| `pcItemsPerView` | `int` | `4` | Number of items visible in PC carousel view. |
| `gap` | `double` | `24.0` | Spacing between mobile mockup items. |
| `imageUrls` | `List<String>?` | `null` | List of mockup image URLs. |
| `items` | `List<Widget>?` | `null` | Pre-constructed widget items. |
| `onItemTap` | `ValueChanged<int>?` | `null` | Callback triggered when a mockup item is tapped. |
| `title` | `String` | `'Title'` | Entity title in bottom BiographyBlock. |
| `subtitle` | `String` | `'Subtitle'` | Entity subtitle in bottom BiographyBlock. |
| `badges` | `List<Widget>?` | `null` | Badges displayed in BiographyBlock. |
| `logo` / `logoWidget` | `ImageProvider?` / `Widget?` | `null` | Entity logo. |

## Usage Examples

### 1. Static 4-Column PC Grid
```dart
MobileMockupsGridBlock(
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
MobileMockupsGridBlock(
  device: MobileMockupsGridBlockDevice.mobile,
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

## Changelog
- **`v1.1.0`**: Renamed from `MobileGrid` to `MobileMockupsGridBlock` matching Figma Node `810:10819`, moved to `/lib/web/`, retained `MobileGrid` typedef for backwards compatibility.
- **`v1.0.5`**: Added viewport-aware autoplay and configurable delay (default 1.2s) support via AlterMediaView.
- **`v1.0.4`**: Added videoUrls parameter for seamless multimedia video mockup lists across carousel and grid views.
- **`v1.0.3`**: Added ambient AlterDeviceScope propagation so child MobileMarkers and bottom BioMarker derive device mode directly from MobileGrid width.
- **`v1.0.2`**: Fixed PC non-carousel equal card heights by placing gap SizedBoxes between Expandeds, and made mobile layout dynamically hug the auto-deduced height of the mobile cards.
- **`v1.0.1`**: Standardized PC layout and unified Mobile layout.
- **`v1.0.0`**: Initial release matching Figma Node 810:10819.
