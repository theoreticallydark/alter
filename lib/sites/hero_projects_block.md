# HeroProjectsBlock

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/sites/heroprojectsblock)

## Overview
`HeroProjectsBlock` (formerly `ProjectHeroBlock`) is a responsive project case study and portfolio hero block featuring logo branding, title, metadata details grid, notice banner, tech stack, and action buttons.

## Figma Reference
* **Node ID**: `802:8220`
* **Component Set**: `HeroProjectsBlock`
* **Variants**:
  * `device=PC` (`802:8221`): Width 896px, Column layout, 24px gap.
    * Logo Container: 84x84px with 24px border radius.
    * Title: 40px Geist Bold (`AlterTypography.displayBold`), line height 52px.
    * Description: 16px Geist Regular (`AlterTypography.bodyLg`), line height 20px.
    * Details: Row, 32px gap, 4 columns (16px label + 20px value).
    * Notice: `Toast` banner with `status=Caution` (yellow `#FDC700`).
    * StackBar: Row (64px gap) with "Built with" 48x48px tech icons and "Available on" `ButtonText` actions.
  * `device=Mobile` (`802:8605`): Width 316px, Column layout, 24px gap.
    * Logo Container: 48x48px with 16px border radius.
    * Title: 30px Geist Bold (`AlterTypography.h1Bold`), line height 36px.
    * Description: 16px Geist Regular (`AlterTypography.bodyLg`), line height 20px.
    * Details: 2x2 Grid, 16px gap (14px label + 18px value).
    * Notice: `Toast` banner with `status=Caution`.
    * StackBar: Column (24px gap) with "Built with" tech icons and "Available on" `ButtonIcon` 48x48px actions.

## Usage

```dart
import 'package:alter/alter.dart';

HeroProjectsBlock(
  device: AlterBlockDevice.auto,
  title: 'Alter -\nDesign System',
  description: 'A comprehensive Flutter design system built for performance and pixel perfection.',
  details: const [
    ProjectDetailItem(label: 'Client', value: 'Alter Labs'),
    ProjectDetailItem(label: 'Platform', value: 'Flutter Web & Mobile'),
    ProjectDetailItem(label: 'Year', value: '2026'),
    ProjectDetailItem(label: 'Status', value: 'Shipped'),
  ],
  actions: [
    ProjectHeroAction(
      label: 'Flutter’s Pub.Dev',
      icon: Icons.developer_mode,
      type: ButtonType.primary,
      onTap: () {},
    ),
    ProjectHeroAction(
      label: 'Github',
      icon: Icons.code,
      type: ButtonType.gray,
      onTap: () {},
    ),
  ],
)
```

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `device` | `AlterBlockDevice` | `AlterBlockDevice.auto` | Viewport adaptation mode (`auto`, `pc`, `mobile`). |
| `title` | `String` | `'Title'` | Project headline text. |
| `description` | `String` | `'Description'` | Project descriptive summary text. |
| `details` | `List<ProjectDetailItem>?` | `null` | Key-value detail metadata items. |
| `actions` | `List<ProjectHeroAction>?` | `null` | Action buttons rendered in the footer stack bar. |
| `hasNotice` | `bool` | `true` | Whether the notice toast banner is displayed. |
| `noticeText` | `String` | `'Project Notice'` | Text displayed in the notice banner. |

---

## Changelog

### 1.1.0
- Renamed from `ProjectHeroBlock` to `HeroProjectsBlock` matching Figma Node `802:8220`.
- Standardized device parameter to `AlterBlockDevice`.

### 1.0.0
- Initial release matching Figma Node `802:8220`.
