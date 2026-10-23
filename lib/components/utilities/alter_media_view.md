# AlterMediaView

> Current Version: `v2.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/components/utilities/altermediaview)

## Overview
`AlterMediaView` is a lightweight, versatile multimedia presentation widget supporting static images, animated GIFs, and pluggable media slots/builders. Designed specifically for Alter Design System blocks and cards ([GraphicsBlock], [MobileMockupBlock]), it showcases rich media without control chrome and offers 100% WebAssembly (WASM) and cross-platform compatibility.

## Design Specifications
* **Default Fit**: `BoxFit.cover`.
* **Border Radius**: Configurable (defaults to container styling, e.g. `20px` for GraphicsBlock, `16px` for MobileMockupBlock).
* **Border**: Optional outline stroke (`AlterSemanticTokens.stroke100` / `#F3F4F6`).
* **Slot Architecture**: Provides direct slots (`customWidget` / `slot`) and lazy builders (`mediaBuilder`) to host video players (`video_player`, `media_kit`), Rive/Lottie animations, or custom interactive widgets.

## Usage

```dart
import 'package:alter/alter.dart';

// 1. Image / GIF display
AlterMediaView(
  url: 'https://images.unsplash.com/photo-1579783902614-a3fb3927b675',
  borderRadius: BorderRadius.circular(16),
  fit: BoxFit.cover,
)

// 2. Custom Media Slot (Lottie, Rive, or Custom Interactive Widget)
AlterMediaView(
  borderRadius: BorderRadius.circular(20),
  slot: Lottie.asset('assets/animation.json'),
)

// 3. Pluggable Video Player Recipe
AlterMediaView(
  borderRadius: BorderRadius.circular(20),
  mediaBuilder: (context) => VideoPlayer(_videoController),
)
```

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `image` | `ImageProvider?` | `null` | Optional static image provider. |
| `url` | `String?` | `null` | Network URL for image, GIF, or media. |
| `assetPath` | `String?` | `null` | Local Flutter asset bundle path. |
| `customWidget` / `slot` | `Widget?` | `null` | Custom widget or interactive slot. |
| `mediaBuilder` | `WidgetBuilder?` | `null` | Builder for responsive or slotted media. |
| `mediaType` | `AlterMediaType?` | `null` | Explicit media type (`image`, `video`, `custom`). |
| `fit` | `BoxFit` | `BoxFit.cover` | Box fit mode. |
| `borderRadius` | `BorderRadius?` | `null` | Corner radius applied to media container. |
| `border` | `Border?` | `null` | Border outline. |
| `aspectRatio` | `double?` | `null` | Optional container aspect ratio constraint. |
| `placeholder` | `Widget?` | `null` | Loading / fallback placeholder widget. |

---

## Changelog

### 2.0.0
- Replaced direct `video_player` dependency with pluggable media slots (`slot`, `customWidget`, `mediaBuilder`) for 100% WASM compatibility and zero native platform lock-in.

### 1.1.0
- Added viewport-aware autoplay control with configurable delay (`autoPlayDelay`, default 1.2s).

### 1.0.0
- Initial release supporting Images, GIFs, and autoplay looping Videos.
