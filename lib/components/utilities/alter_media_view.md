# AlterMediaView

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/components/utilities/altermediaview)

## Overview
`AlterMediaView` is a versatile multimedia presentation widget supporting static images, animated GIFs, and muted looping autoplay videos. Designed specifically for Alter Design System blocks and cards ([GraphicsBlock], [MobileMockupBlock]), it showcases rich media without control chrome and includes viewport-aware autoplay and delay controls to pause off-screen video assets.

## Design Specifications
* **Default Fit**: `BoxFit.cover`.
* **Border Radius**: Configurable (defaults to container styling, e.g. `20px` for GraphicsBlock, `16px` for MobileMockupBlock).
* **Border**: Optional 1px or 2px outline stroke (`AlterSemanticTokens.stroke100` / `#F3F4F6`).
* **Autoplay Compliance**: Autoplay videos default to `isMuted = true` for seamless web and mobile autoplay compatibility.
* **Viewport Automation**: When `playInViewportOnly` is enabled (default `true`), videos automatically initialize or play once visible, and pause when scrolled out of view, with a configurable delay (`autoPlayDelay: Duration(milliseconds: 1200)`).

## Usage

```dart
import 'package:alter/alter.dart';

// Image / GIF display
AlterMediaView(
  url: 'https://images.unsplash.com/photo-1579783902614-a3fb3927b675',
  borderRadius: BorderRadius.circular(16),
  fit: BoxFit.cover,
)

// Looping Autoplay Video with Viewport Awareness
AlterMediaView(
  url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
  mediaType: AlterMediaType.video,
  autoPlay: true,
  loop: true,
  playInViewportOnly: true,
  autoPlayDelay: const Duration(milliseconds: 1200),
  borderRadius: BorderRadius.circular(20),
)
```

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `image` | `ImageProvider?` | `null` | Optional static image provider. |
| `url` | `String?` | `null` | Network URL for image, GIF, or video. |
| `assetPath` | `String?` | `null` | Local Flutter asset bundle path. |
| `customWidget` | `Widget?` | `null` | Custom widget override. |
| `videoController` | `VideoPlayerController?` | `null` | Pre-configured video controller instance. |
| `mediaType` | `AlterMediaType?` | `null` | Explicit media type (`image`, `video`, `custom`). If null, auto-inferred from file extension. |
| `fit` | `BoxFit` | `BoxFit.cover` | Box fit mode. |
| `borderRadius` | `BorderRadius?` | `null` | Corner radius applied to media container. |
| `border` | `Border?` | `null` | Border outline. |
| `loop` | `bool` | `true` | Whether videos loop infinitely. |
| `autoPlay` | `bool` | `true` | Whether videos start playback automatically. |
| `playInViewportOnly` | `bool` | `true` | Pauses video off-screen and plays when visible in viewport. |
| `autoPlayDelay` | `Duration` | `1200ms` | Delay before video plays after entering the viewport. |
| `isMuted` | `bool` | `true` | Mutes audio for mobile/web autoplay compliance. |
| `aspectRatio` | `double?` | `null` | Optional container aspect ratio constraint. |
| `placeholder` | `Widget?` | `null` | Loading placeholder widget. |

---

## Changelog

### 1.1.0
- Added viewport-aware autoplay control with configurable delay (`autoPlayDelay`, default 1.2s) to pause off-screen videos and play when visible.

### 1.0.0
- Initial release supporting Images, GIFs, and autoplay looping Videos.
