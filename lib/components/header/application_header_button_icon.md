# ApplicationHeaderButtonIcon

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/header/applicationheaderbuttonicon)

## Overview
`ApplicationHeaderButtonIcon` is a 48x48px action button for application headers. It supports icon glyphs and embedded user [Avatar](file:///c:/Vayu/Alter/lib/components/utilities/avatar.dart) instances with active hover and selection states.

## Usage
```dart
// Standard Icon Header Action
ApplicationHeaderButtonIcon(
  icon: Icons.search,
  onTap: () {
    // Search action
  },
)

// Avatar Header Action
ApplicationHeaderButtonIcon.avatar(
  avatarImageUrl: 'https://example.com/avatar.jpg',
  onTap: () {
    // Open profile
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `type` | `ApplicationHeaderButtonIconType` | `defaultType` | Variant type (`defaultType` for icon, `avatar` for user avatar). |
| `icon` | `IconData?` | `Icons.face_outlined` | Icon glyph data for default type. |
| `iconWidget` | `Widget?` | `null` | Custom icon widget override. |
| `avatar` | `Widget?` | `null` | Custom `Avatar` widget override. |
| `avatarImage` | `ImageProvider?` | `null` | Embedded avatar image provider. |
| `avatarImageUrl` | `String?` | `null` | Embedded avatar network image URL. |
| `avatarInitials` | `String?` | `null` | Embedded avatar fallback initials. |
| `isHovered` | `bool?` | `null` | Explicit hover state override. |
| `isSelected` | `bool` | `false` | Selected active state toggle. |
| `size` | `double` | `48.0` | Width and height of the button container. |
| `borderRadius` | `BorderRadius?` | `BorderRadius.zero` | Container corner radius (defaults to 0px sharp corners as per Figma node 542:9072). |
| `onTap` | `VoidCallback?` | `null` | Tap callback with splash feedback. |

---

## Design System Tokens & Specs (Figma Node `542:9072`)
- **Dimensions**: `48x48px` box, centered layout.
- **Corner Radius**: `0px` (`BorderRadius.zero`).
- **Child Components**: Reuses [Avatar](file:///c:/Vayu/Alter/lib/components/utilities/avatar.dart) (`655:11313`).
- **Colors**:
  - `state=Default`: Background `Colors.transparent`, Icon `AlterSemanticTokens.textPrimary`.
  - `state=Hover` / `state=Selected`: Background `AlterSemanticTokens.baseActive` (`#E5E7EB`).

---

## Component Changelog
* **`v1.0.1`**: Removed corner radius default to strictly adhere to Figma Node `542:9072` (sharp `BorderRadius.zero`).
* **`v1.0.0`**: Initial release matching Figma Node `542:9072` (`.ApplicationHeaderButtonIcon`).
