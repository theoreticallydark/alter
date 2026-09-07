# ButtonGraphicImage

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/buttons/buttongraphicimage)

## Overview
`ButtonGraphicImage` is a compact image and avatar action button featuring `20px` rounded corners, `AlterSemanticTokens.stroke200` border, and support for network/asset images, custom widgets, or fallback icon placeholders.

## Usage
```dart
ButtonGraphicImage(
  image: const NetworkImage('https://images.unsplash.com/...'),
  size: 48.0,
  onTap: () => print('Avatar tapped'),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `image` | `ImageProvider?` | `null` | Optional background image (avatar/graphic) rendered with `BoxFit.cover`. |
| `child` | `Widget?` | `null` | Optional custom widget child inside the container. |
| `size` | `double` | `48.0` | Outer square dimension. |
| `onTap` | `VoidCallback?` | `null` | Tap callback handler. |

---

## Component Changelog
* **`v1.1.0`**: Added `image`, `child`, and `size` properties with `Clip.antiAlias` for avatar and image rendering.
* **`v1.0.1`**: Configured 20px border radius with `stroke200` border styling.
* **`v1.0.0`**: Initial release.
