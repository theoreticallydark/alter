# Avatar

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/utilities/avatar)

## Overview
`Avatar` is a visual representation component for users, entities, or contacts in the Alter Design System. It supports image fills and placeholder fallbacks with customizable icons, initials, and border radiuses.

## Usage
```dart
// Placeholder Avatar (Default Figma spec: 32x32, 12px radius, face icon)
const Avatar()

// Image Avatar (with ImageProvider)
Avatar.image(
  image: AssetImage('assets/images/user.png'),
)

// Network Image Avatar
Avatar.network(
  url: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
)

// Initials Avatar
Avatar.initials(
  initials: 'RC',
)

// Custom Size & Tap Interaction
Avatar(
  size: 48,
  image: NetworkImage('https://images.unsplash.com/photo-1534528741775-53994a69daeb'),
  onTap: () {
    // Open profile
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `type` | `AvatarType` | `AvatarType.placeholder` | Variant type (`image` or `placeholder`). |
| `image` | `ImageProvider?` | `null` | Image source when `type` is `image`. |
| `imageUrl` | `String?` | `null` | Network image URL convenience parameter. |
| `initials` | `String?` | `null` | Initials text displayed in placeholder mode. |
| `icon` | `IconData?` | `Icons.face_5_outlined` | Leading icon displayed in placeholder mode. |
| `iconWidget` | `Widget?` | `null` | Custom widget override for placeholder. |
| `size` | `double` | `32.0` | Width and height dimension of the avatar. |
| `borderRadius` | `BorderRadius?` | `BorderRadius.circular(12)` | Container corner radius (scales proportionally if not specified). |
| `backgroundColor` | `Color?` | `baseWhite` / `baseGray` | Background fill color. |
| `foregroundColor` | `Color?` | `textPrimary` | Icon / initials color. |
| `borderColor` | `Color?` | `null` | Optional border stroke color. |
| `borderWidth` | `double` | `1.0` | Border stroke width. |
| `onTap` | `VoidCallback?` | `null` | Tap callback with splash feedback. |
| `semanticLabel` | `String?` | `null` | Accessibility label. |

---

## Design System Tokens & Specs (Figma Node `655:11313`)
- **Dimensions & Geometry**:
  - Size: `32x32px`
  - Border Radius: `12px`
- **Variants**:
  - `type=Image` (`655:11312`): Fills image with cover fit and 12px radius.
  - `type=Placeholder` (`655:11314`): Background `AlterSemanticTokens.baseWhite` (`#FFFFFF`), centered 24x24 `face` icon (`Icons.face_5_outlined` / `AlterSemanticTokens.textPrimary`).

---

## Component Changelog
* **`v1.0.0`**: Initial release matching Figma Node `655:11313` (`Avatar: Image and Placeholder variants`).
