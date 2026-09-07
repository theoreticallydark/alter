# ApplicationHeader

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/applicationheader)

## Overview
`ApplicationHeader` is the standard top header component for the Alter Design System. It houses an optional return/back button, title and subtitle typography on the left, an adaptive right action group (style button, primary/secondary action buttons, profile image), and an expandable child slot below with smooth transition animations.

## Usage
```dart
ApplicationHeader(
  title: 'Alter',
  subtitle: 'Design System',
  hasReturnButton: true,
  onReturnTap: () => Navigator.of(context).pop(),
  hasStyleButton: true,
  styleButtonTitle: 'STREAK',
  styleButtonSubtitle: '7 DAYS',
  onStyleButtonTap: () {},
  hasActionOne: true,
  onActionOneTap: () {},
  slot: Search(),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `title` | `String` | `'Alter'` | Primary header title using `AlterTypography.h1Serif`. |
| `subtitle` | `String` | `'Design System'` | Secondary caption text using `AlterTypography.caption`. |
| `hasReturnButton` | `bool` | `false` | Whether to display the return back button (`ButtonIconGhost`). |
| `onReturnTap` | `VoidCallback?` | `null` | Tap handler for the return button. |
| `hasStyleButton` | `bool` | `true` | Whether to display the `ButtonGraphicText` badge. |
| `styleButtonTitle` | `String` | `'STREAK'` | Title displayed within the style badge. |
| `styleButtonSubtitle` | `String` | `'7 DAYS'` | Subtitle displayed within the style badge. |
| `onStyleButtonTap` | `VoidCallback?` | `null` | Tap handler for the style button. |
| `hasActionOne` | `bool` | `true` | Whether to show the first action button (`ButtonIcon`). |
| `actionOneIcon` | `IconData` | `Icons.favorite_border` | Custom icon for first action button. |
| `onActionOneTap` | `VoidCallback?` | `null` | Tap handler for the first action button. |
| `hasActionTwo` | `bool` | `false` | Whether to show the second action button (`ButtonIcon`). |
| `actionTwoIcon` | `IconData` | `Icons.favorite_border` | Custom icon for second action button. |
| `onActionTwoTap` | `VoidCallback?` | `null` | Tap handler for the second action button. |
| `hasProfileAction` | `bool` | `true` | Whether to display the profile container (`ButtonGraphicImage`). |
| `profileImage` | `ImageProvider?` | `null` | Optional avatar image for the profile container. |
| `onProfileTap` | `VoidCallback?` | `null` | Tap handler for profile action. |
| `slot` | `Widget?` | `null` | Optional bottom widget container (e.g. `Search`) with 16px top spacing. |

---

## Component Changelog
* **`v1.1.0`**: Added `hasReturnButton`, `onReturnTap`, customizable `actionOneIcon`, `actionTwoIcon`, and `profileImage` matching Figma node `119:5716`.
* **`v1.0.2`**: Dynamically hug action elements with spacing only between adjacent active items, eliminating trailing space when subsequent actions are absent.
* **`v1.0.1`**: Updated outer layout to 24px padding all around and 16px itemSpacing between headerContainer and Slot.
* **`v1.0.0`**: Initial implementation.
