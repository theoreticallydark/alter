# ApplicationHeader

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/header/applicationheader)

## Overview
`ApplicationHeader` is the desktop and web top application navigation bar in the Alter Design System. It features an application launcher trigger, customizable logo brand unit (defaulting to `assets/alter_logo.png`), title typography, centered navigation page list, and configurable trailing action and user avatar buttons.

## Usage
```dart
ApplicationHeader(
  title: 'Alter Studio',
  hasLauncherButton: true,
  onLauncherTap: () {
    // Open app drawer / launcher
  },
  pages: const ['Dashboard', 'Projects', 'Analytics', 'Settings'],
  selectedPageIndex: _activePage,
  onPageSelected: (index) {
    setState(() => _activePage = index);
  },
  avatarInitials: 'RC',
  onAvatarTap: () {
    // Open user profile
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `hasLauncherButton` | `bool` | `true` | Whether the leading 48x48 launcher button is visible. |
| `launcherIcon` | `IconData` | `Icons.apps_rounded` | Launcher icon glyph. |
| `onLauncherTap` | `VoidCallback?` | `null` | Launcher button tap callback. |
| `hasLogo` | `bool` | `true` | Whether the 34x34 brand logo unit is visible. |
| `logo` | `ImageProvider?` | `null` | Custom logo image provider override. |
| `logoWidget` | `Widget?` | `null` | Custom logo widget override. |
| `logoAssetPath` | `String?` | `null` | Custom asset path for logo (defaults to Alter logo asset). |
| `onLogoTap` | `VoidCallback?` | `null` | Logo tap callback. |
| `applicationTitle` | `bool` | `true` | Whether the application title text is visible. |
| `title` | `String` | `'Application Title'` | Application title string. |
| `titleWidget` | `Widget?` | `null` | Custom title widget override. |
| `onTitleTap` | `VoidCallback?` | `null` | Title tap callback. |
| `hasPages` | `bool` | `true` | Whether the centered navigation page list is visible. |
| `pages` | `List<String>` | `['Label', ...]` | String labels for the center navigation page list. |
| `selectedPageIndex` | `int` | `0` | Active index for the center navigation tabs. |
| `onPageSelected` | `ValueChanged<int>?` | `null` | Navigation tab selection callback. |
| `pageWidgets` | `List<Widget>?` | `null` | Custom navigation tab widgets list. |
| `showApplicationHeaderButton1` | `bool` | `true` | Trailing action button 1 toggle. |
| `action1Icon` | `IconData` | `Icons.face_outlined` | Action button 1 icon. |
| `onAction1Tap` | `VoidCallback?` | `null` | Action button 1 tap callback. |
| `showApplicationHeaderButton2` | `bool` | `true` | Trailing action button 2 toggle. |
| `action2Icon` | `IconData` | `Icons.face_outlined` | Action button 2 icon. |
| `onAction2Tap` | `VoidCallback?` | `null` | Action button 2 tap callback. |
| `showApplicationHeaderButton3` | `bool` | `true` | Trailing action button 3 toggle. |
| `action3Icon` | `IconData` | `Icons.face_outlined` | Action button 3 icon. |
| `onAction3Tap` | `VoidCallback?` | `null` | Action button 3 tap callback. |
| `showApplicationHeaderButton4` | `bool` | `true` | Trailing action button 4 toggle. |
| `action4Icon` | `IconData` | `Icons.face_outlined` | Action button 4 icon. |
| `onAction4Tap` | `VoidCallback?` | `null` | Action button 4 tap callback. |
| `showAvatarButton` | `bool` | `true` | User avatar action toggle. |
| `avatar` | `Widget?` | `null` | Custom avatar widget override. |
| `avatarImage` | `ImageProvider?` | `null` | User avatar image provider. |
| `avatarImageUrl` | `String?` | `null` | User avatar network image URL. |
| `avatarInitials` | `String?` | `null` | User avatar fallback initials. |
| `onAvatarTap` | `VoidCallback?` | `null` | Avatar button tap callback. |
| `backgroundColor` | `Color?` | `baseWhite` | Header background color. |
| `borderColor` | `Color?` | `baseBorder` | 1px bottom border stroke color. |

---

## Design System Tokens & Specs (Figma Node `706:8794`)
- **Dimensions**: Fixed `48px` item height, edge-to-edge full width.
- **Child Components Reused**:
  - [ApplicationHeaderButtonIcon](file:///c:/Vayu/Alter/lib/components/header/application_header_button_icon.dart) (`542:9072`)
  - [ApplicationHeaderButtonText](file:///c:/Vayu/Alter/lib/components/header/application_header_button_text.dart) (`760:3612`)
  - [Avatar](file:///c:/Vayu/Alter/lib/components/utilities/avatar.dart) (`655:11313`)
- **Typography**:
  - Title: `Headings/h4` -> `AlterTypography.h4Bold` (Geist 16px, SemiBold 600, line-height 20px).
  - Navigation Tabs: `Body/body-bold` -> `AlterTypography.bodyBold` (Geist 14px, SemiBold 600, line-height 16px).
- **Colors**:
  - Background: `AlterSemanticTokens.baseWhite` (`#FFFFFF`).
  - Bottom Border: `AlterSemanticTokens.baseBorder` (`#F3F4F6` / `#E5E7EB`, 1px solid bottom).
  - Primary Text: `AlterSemanticTokens.textPrimary` (`#000000`).

---

## Component Changelog
* **`v1.0.1`**: Default logo uses `assets/alter_logo.png` asset with full customization support (`logo`, `logoWidget`, `logoAssetPath`).
* **`v1.0.0`**: Initial release matching Figma Node `706:8794` (`ApplicationHeader / device=Web`).
