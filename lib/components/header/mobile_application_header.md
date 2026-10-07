# MobileApplicationHeader

> Current Version: `v1.2.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/header/mobileapplicationheader)

## Overview
`MobileApplicationHeader` is the standard top header / app-bar component for mobile viewports in the Alter Design System. It houses an optional return/back button, title and subtitle typography on the left, an adaptive right action group (style button, primary/secondary action buttons, profile image), and an expandable child slot below with smooth transition animations.

## Usage
```dart
MobileApplicationHeader(
  title: 'Dashboard',
  subtitle: 'Welcome Back',
  hasReturnButton: true,
  onReturnTap: () => Navigator.of(context).pop(),
  hasStyleButton: true,
  styleButtonTitle: 'STREAK',
  styleButtonSubtitle: '7 DAYS',
  hasActionOne: true,
  actionOneIcon: Icons.search,
  hasProfileAction: true,
  profileImage: NetworkImage('https://example.com/avatar.jpg'),
  slot: Container(
    height: 48,
    color: AlterSemanticTokens.baseGray,
  ),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | `String` | `'Alter'` | Primary headline text. |
| `subtitle` | `String` | `'Design System'` | Secondary subtitle / category descriptor. |
| `hasReturnButton` | `bool` | `false` | Whether to show the leading chevron back button. |
| `onReturnTap` | `VoidCallback?` | `null` | Return button tap callback. |
| `hasStyleButton` | `bool` | `true` | Whether to render the streak/badge action button. |
| `styleButtonTitle` | `String` | `'STREAK'` | Style badge title string. |
| `styleButtonSubtitle` | `String` | `'7 DAYS'` | Style badge subtitle string. |
| `onStyleButtonTap` | `VoidCallback?` | `null` | Style badge tap callback. |
| `hasActionOne` | `bool` | `true` | Whether the first circular action button is visible. |
| `actionOneIcon` | `IconData` | `Icons.favorite_border` | First action button icon. |
| `onActionOneTap` | `VoidCallback?` | `null` | First action button tap callback. |
| `hasActionTwo` | `bool` | `false` | Whether the second circular action button is visible. |
| `actionTwoIcon` | `IconData` | `Icons.favorite_border` | Second action button icon. |
| `onActionTwoTap` | `VoidCallback?` | `null` | Second action button tap callback. |
| `hasProfileAction` | `bool` | `true` | Whether the profile avatar trigger button is visible. |
| `profileImage` | `ImageProvider?` | `null` | Profile image provider. |
| `onProfileTap` | `VoidCallback?` | `null` | Profile image tap callback. |
| `slot` | `Widget?` | `null` | Optional bottom expandable child slot with animated cross-fade. |

---

## Design System Tokens & Specs (Figma Node `119:5716`)
- **Padding**: `24px` all around (`EdgeInsets.all(24)`).
- **Item Spacing**: `16px` between header bar and bottom expandable slot.
- **Typography**:
  - Title: `AlterTypography.h1Serif` (Instrument Serif 32px, Regular 400).
  - Subtitle: `AlterTypography.caption` (Geist 12px, Regular 400).

---

## Component Changelog
* **`v1.2.0`**: Renamed component from `ApplicationHeader` to `MobileApplicationHeader` matching design system nomenclature. Added backwards-compatibility typedef alias.
* **`v1.1.0`**: Added `hasReturnButton`, `onReturnTap`, custom action icons, and `profileImage` matching Figma node `119:5716`.
* **`v1.0.2`**: Dynamically hug action elements with spacing only between adjacent active items.
* **`v1.0.1`**: Updated outer layout to 24px padding all around and 16px itemSpacing between headerContainer and slot.
* **`v1.0.0`**: Initial release matching Figma Node `119:5716`.
