# ProjectMarker

Responsive project and portfolio card molecule combining banner media / carousel with an entity [BioMarker] sub-component for the Alter Design System.

## Figma Specification
- **Node ID**: [`795:6004`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=795-6004)
- **Component Set**: `ProjectMarker`
- **Variants**:
  - `device=PC, isCarousel=False` (`795:3760`): Single 16:9 banner image + BioMarker with logo and badge bar.
  - `device=Mobile, isCarousel=False` (`795:6005`): Single 16:9 banner image + compact BioMarker (no logo, no badge bar).
  - `device=PC, isCarousel=True` (`813:12021`): Multi-column side-by-side carousel with hardware-accelerated animated sliding and [CarouselControl] overlay.
  - `device=Mobile, isCarousel=True` (`819:2595`): Thumb-swipeable carousel with peek cue (~86% card width, 44px peek affordance) without chevrons.

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `width` | `double?` | `null` | Optional fixed width (defaults to fill available parent width) |
| `device` | `ProjectMarkerDevice` | `ProjectMarkerDevice.auto` | Viewport adaptation mode (`auto`, `pc`, `mobile`) |
| `isCarousel` | `bool` | `false` | Whether the media section operates in carousel mode |
| `pcItemsPerView` | `int` | `2` | Number of simultaneous cards visible in PC carousel mode (e.g. 2, 3, etc.) |
| `mobileViewportFraction` | `double` | `0.86` | Viewport fraction occupied by active card on mobile (leaves ~14% / 44px peek cue) |
| `carouselGap` | `double` | `24.0` | Gap between media cards in carousel mode |
| `animationDuration` | `Duration` | `Duration(milliseconds: 350)` | Sliding animation duration on PC carousel navigation |
| `animationCurve` | `Curve` | `Curves.easeInOutCubic` | Sliding animation curve for PC carousel track |
| `image` | `ImageProvider?` | `null` | Single banner image provider |
| `imageUrl` | `String?` | `null` | Single banner image network URL |
| `imageAssetPath` | `String?` | `null` | Single banner image asset path |
| `carouselImages` | `List<ImageProvider>?` | `null` | List of image providers for carousel mode |
| `carouselImageUrls` | `List<String>?` | `null` | List of network image URLs for carousel mode |
| `carouselImageAssetPaths` | `List<String>?` | `null` | List of asset paths for carousel mode |
| `carouselItems` | `List<Widget>?` | `null` | Custom widget list for carousel mode |
| `carouselIndex` | `int` | `0` | Active carousel index |
| `onCarouselIndexChanged` | `ValueChanged<int>?` | `null` | Callback triggered when active page changes |
| `aspectRatio` | `double` | `16 / 9` | Aspect ratio for media containers |
| `imageBorderRadius` | `BorderRadius?` | `BorderRadius.circular(20)` | Media container border radius |
| `title` | `String` | `'Title'` | Entity title string |
| `hasSubtitle` | `bool` | `true` | Subtitle visibility toggle |
| `subtitle` | `String` | `'Subtitle'` | Entity subtitle text |
| `hasLogo` | `bool?` | derived | Logo visibility toggle (defaults to `true` on PC, `false` on Mobile) |
| `logo` | `ImageProvider?` | `null` | Entity logo image provider |
| `hasBadgeBar` | `bool?` | derived | Badge bar visibility toggle (defaults to `true` on PC, `false` on Mobile) |
| `hasBadgeOne` | `bool` | `false` | Badge 1 visibility toggle |
| `badgeOneLabel` | `String` | `'Label'` | Badge 1 label text |
| `hasBadgeTwo` | `bool` | `true` | Badge 2 visibility toggle |
| `badgeTwoLabel` | `String` | `'Label'` | Badge 2 label text |
| `hasBadgeThree` | `bool` | `true` | Badge 3 visibility toggle |
| `badgeThreeLabel` | `String` | `'Label'` | Badge 3 label text |
| `hasDescription` | `bool` | `false` | Description text visibility toggle |
| `description` | `String` | `'Description'` | Descriptive paragraph |

## Child Components Reused
- [BioMarker](file:///c:/Vayu/Alter/lib/web/markers/bio_marker.dart) (`761:7097`): Metadata, logo, title, subtitle, and badges.
- [CarouselControl](file:///c:/Vayu/Alter/lib/components/utilities/carousel_control.dart) (`811:11843`): Chevron navigation overlay for PC carousel.
- [Badge](file:///c:/Vayu/Alter/lib/components/pills/badge.dart) (`124:4003`): Reused inside BioMarker.
- [Divider](file:///c:/Vayu/Alter/lib/components/utilities/divider.dart) (`559:916`): Reused inside BioMarker when description is visible.

## Changelog
- **`v1.2.0`**: Implemented smooth hardware-accelerated animated sliding for PC carousel navigation via `ScrollController` with `easeInOutCubic` curve.
- **`v1.1.0`**: Added configurable `pcItemsPerView` (defaults to 2, supports 3+), `mobileViewportFraction` (defaults to 0.86 with peek cue), and native touch-first `PageView` with `padEnds: false` for mobile carousels.
- **`v1.0.0`**: Initial release matching Figma Node `795:6004`.
