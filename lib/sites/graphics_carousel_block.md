# GraphicsCarouselBlock

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/sites/graphicscarouselblock)

## Overview
`GraphicsCarouselBlock` is a responsive full-width visual showcase block for project graphics and portfolio items. It integrates [CarouselControl] overlay buttons, smooth touch and programmatic scrolling, and a bottom [BiographyBlock] card.

## Figma Reference
* **Node ID**: `957:17108`
* **Variants**:
  * `device=PC` (`957:17115`): Width 896px, 2 items visible per view with overlaid chevron buttons (`CarouselControl`), 24px gap.
  * `device=Mobile` (`957:17116`): Width 316px, touch swipeable carousel with 272x153px cards and viewport peek cue.

## Design Specifications
* **Media Container Aspect Ratio**: `16 / 9` with `20px` border radius and `2px` stroke border (`#F3F4F6`).
* **PC Viewport**: Multi-item row layout with smooth hardware-accelerated animated sliding via [ScrollController] and `Curves.easeInOutCubic`.
* **Mobile Viewport**: Touch-first [PageView] with configurable [mobileViewportFraction] (default `0.86`) providing a peek cue.
* **Child Components**:
  * Reuses [CarouselControl] for PC chevron controls.
  * Reuses [BiographyBlock] for entity metadata and description.

## Usage

```dart
import 'package:alter/alter.dart';

GraphicsCarouselBlock(
  title: 'Alter Design System',
  subtitle: 'Component Architecture',
  images: const [
    NetworkImage('https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe'),
    NetworkImage('https://images.unsplash.com/photo-1579783902614-a3fb3927b675'),
  ],
)
```

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `device` | `AlterBlockDevice` | `AlterBlockDevice.auto` | Viewport adaptation mode (`auto`, `pc`, `mobile`). |
| `images` | `List<ImageProvider>` | `const []` | List of images displayed in the carousel. |
| `imageUrls` | `List<String>?` | `null` | Optional list of image network URLs. |
| `title` | `String` | `'Title'` | Title text for the bottom biography card. |
| `subtitle` | `String` | `'Subtitle'` | Subtitle text for the bottom biography card. |
| `description` | `String` | `'Description'` | Description text for the biography card. |
| `pcItemsPerView` | `int` | `2` | Number of items visible simultaneously on PC. |
| `mobileViewportFraction` | `double` | `0.86` | Fraction of viewport occupied by each item on mobile. |
| `onItemTap` | `ValueChanged<int>?` | `null` | Callback executed when a carousel item is tapped. |

---

## Changelog

### 1.1.0
- Unified device parameter to `AlterBlockDevice`.
- Added support for `AlterMediaView` video playback in slides.

### 1.0.0
- Initial release matching Figma Node `957:17108`.
