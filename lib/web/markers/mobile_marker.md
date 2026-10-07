# MobileMarker

Responsive mobile device showcase and entity card combining an iPhone 14 Plus media container (428:926 aspect ratio) with an optional [BioMarker] for the Alter Design System.

## Figma Specification
- **Node ID**: [`810:10719`](https://www.figma.com/design/zv3qKQ3LHZCA8hWFcsOMtH/Alter-Design-System?node-id=810-10719)
- **Component Set**: `MobileMarker`
- **Variants**:
  - `scale=Width` (`810:10718`): Width is controlled; height is auto-deduced and hugs content.
  - `scale=Height` (`810:10720`): Height is controlled; width is auto-deduced and hugs content.

## Sizing & Scale Modes
- **`MobileMarkerScale.width`**: You specify or fill the `width`, and the iPhone 14 Plus container automatically scales its height to match `width / (428 / 926)` while hugging content vertically.
- **`MobileMarkerScale.height`**: You specify the `height`, and the iPhone 14 Plus container automatically scales its width to match `height * (428 / 926)` while hugging content horizontally.

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `scale` | `MobileMarkerScale` | `MobileMarkerScale.width` | Scaling driver mode (`width` or `height`) |
| `width` | `double?` | `null` | Explicit width constraint when `scale = width` |
| `height` | `double?` | `null` | Explicit height constraint when `scale = height` |
| `aspectRatio` | `double` | `428 / 926` | iPhone 14 Plus container aspect ratio (~0.4622) |
| `image` | `ImageProvider?` | `null` | Mockup screen image provider |
| `imageUrl` | `String?` | `null` | Network URL for mockup image |
| `imageAssetPath` | `String?` | `null` | Asset path for mockup image |
| `imageWidget` | `Widget?` | `null` | Custom widget override for mockup container |
| `imageBorderRadius` | `BorderRadius?` | `BorderRadius.circular(20)` | Media container border radius |
| `onImageTap` | `VoidCallback?` | `null` | Tap handler for mockup screen |
| `hasBioMarker` | `bool` | `true` | Toggle visibility of the BioMarker section |
| `title` | `String` | `'Title'` | Main title string |
| `hasSubtitle` | `bool` | `true` | Subtitle visibility toggle |
| `subtitle` | `String` | `'Subtitle'` | Subtitle text |
| `hasDescription` | `bool` | `true` | Description visibility toggle |
| `description` | `String` | `'Description'` | Descriptive paragraph |
| `hasLogo` | `bool` | `false` | Logo visibility toggle |
| `hasBadgeBar` | `bool` | `false` | Badge bar visibility toggle |

## Child Components Reused
- [BioMarker](file:///c:/Vayu/Alter/lib/web/markers/bio_marker.dart) (`761:7097`): Metadata, title, subtitle, divider, and description.
- [Divider](file:///c:/Vayu/Alter/lib/components/utilities/divider.dart) (`559:916`): Reused inside BioMarker.

## Design Tokens Used
- **Border**: `AlterSemanticTokens.stroke100` (`#F3F4F6`, 1px solid)
- **Container Radius**: `20.0` px (`BorderRadius.circular(20.0)`)
- **Spacing**: `16.0` px gap between mockup and BioMarker
