# BioMarker

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/web/biomarker)

## Overview
`BioMarker` is a responsive entity and biography marker molecule card in the Alter Design System. It combines an entity logo box, title and subtitle typography, badge pills, and a structured bio description separated by a divider.

It seamlessly adapts between **Web (Desktop)** and **Mobile** viewports with responsive scaling of typography, logo container dimensions, and layout arrangements (`Tall` and `Wide`).

## Usage
```dart
// Standard Responsive BioMarker (Tall layout)
BioMarker(
  title: 'Alter Design System',
  subtitle: 'Component Library & Foundation',
  description: 'A modular, high-fidelity Flutter design system crafted from Figma specifications.',
  badge2Label: 'Flutter 3.x',
  badge3Label: 'Active',
)

// Wide Header Layout with Web Device Override
BioMarker.wide(
  device: BioMarkerDevice.web,
  title: 'Roberta Casas',
  subtitle: 'Senior Product Designer',
  description: 'Designing intuitive user interfaces and scalable design tokens for cross-platform apps.',
  hasBadgeOne: true,
  badge1Label: 'Design Lead',
  badge2Label: 'Figma',
  badge3Label: 'Full-time',
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `type` | `BioMarkerType` | `BioMarkerType.tall` | Layout arrangement (`tall` stacks badges beneath title, `wide` places badges alongside title). |
| `device` | `BioMarkerDevice` | `BioMarkerDevice.auto` | Viewport adaptation (`auto` responsive via `LayoutBuilder`, `web` forced desktop, `mobile` forced mobile). |
| `title` | `String` | `'Title'` | Main entity title text. |
| `titleWidget` | `Widget?` | `null` | Custom widget override for title. |
| `hasSubtitle` | `bool` | `true` | Toggle visibility of subtitle. |
| `subtitle` | `String` | `'Subtitle'` | Subtitle text. |
| `subtitleWidget` | `Widget?` | `null` | Custom widget override for subtitle. |
| `hasDescription` | `bool` | `true` | Toggle visibility of the bio description section and divider. |
| `description` | `String` | `'Description'` | Bio description body text. |
| `descriptionWidget` | `Widget?` | `null` | Custom widget override for description. |
| `hasLogo` | `bool` | `true` | Toggle visibility of entity logo container. |
| `logo` | `ImageProvider?` | `null` | Entity logo image provider. |
| `logoWidget` | `Widget?` | `null` | Custom logo widget override. |
| `logoAssetPath` | `String?` | `'assets/alter_logo.png'` | Custom asset path for the logo. |
| `onLogoTap` | `VoidCallback?` | `null` | Tap callback for logo container. |
| `hasBadgeBar` | `bool` | `true` | Toggle visibility of badge list container. |
| `hasBadgeOne` | `bool` | `false` | Toggle visibility of badge 1. |
| `badge1Label` | `String` | `'Label'` | Label text for badge 1. |
| `hasBadgeTwo` | `bool` | `true` | Toggle visibility of badge 2. |
| `badge2Label` | `String` | `'Label'` | Label text for badge 2. |
| `hasBadgeThree` | `bool` | `true` | Toggle visibility of badge 3. |
| `badge3Label` | `String` | `'Label'` | Label text for badge 3. |
| `badges` | `List<Widget>?` | `null` | Custom list of badge widgets. |

---

## Design System Tokens & Specs (Figma Node `761:7097`)
- **Responsive Sizing**:
  - **Desktop (`Web`)**:
    - Logo Box: `84x84px`, `24px` corner radius, `AlterSemanticTokens.stroke100` (`#F3F4F6`) border.
    - Title: `Headings/h2` -> `AlterTypography.h2Bold` (20px SemiBold).
    - Subtitle: `Body/body-lg` -> `AlterTypography.bodyLg` (16px Regular).
    - Description: `Body/body-lg` -> `AlterTypography.bodyLg` (16px Regular, `#4A5565`).
  - **Mobile**:
    - Logo Box: `48x48px`, `12px` corner radius, `AlterSemanticTokens.stroke100` (`#F3F4F6`) border.
    - Title: `Headings/h4` -> `AlterTypography.h4Bold` (16px SemiBold).
    - Subtitle: `Body/caption` -> `AlterTypography.caption` (12px Regular).
    - Description: `Body/body` -> `AlterTypography.body` (14px Regular, `#4A5565`).
- **Child Components**:
  - [Badge](file:///c:/Vayu/Alter/lib/components/pills/badge.dart) (`124:4003`, `BadgeColor.slate` `#F1F5F9` background, `#1D293D` text).
  - [Divider](file:///c:/Vayu/Alter/lib/components/utilities/divider.dart) (`559:916`, 1px `AlterSemanticTokens.stroke200` `#E5E7EB`).

---

## Component Changelog
* **`v1.0.0`**: Initial release matching Figma Node `761:7097` (`BioMarker` with `Tall`/`Wide` types and `Web`/`Mobile` responsive adaptation).
