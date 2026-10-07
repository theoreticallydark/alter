# HeroBlock

A responsive hero banner section block for landing pages.

* **Figma Node**: `761:6375` (`HeroBlock`)
* **Variants**: `device=PC` (`761:6374`), `device=Mobile` (`761:6392`)
* **Component Version**: `1.0.0`

---

## 📐 Layout & Specifications

### 1. PC Mode (`device=PC`)
* **Width**: Fixed `896px` (or fills available parent width).
* **Avatar / Graphic Container**: `84x84px` with `24px` border radius (`BorderRadius.circular(24)`).
* **Headline Title**: `80px` Geist SemiBold (600), `1.0` line height, `-0.05em` (`-4.0px`) letter spacing, center-aligned, `textPrimary`.
* **Subtitle**: `20px` Geist SemiBold (`Headings/h2`), `24px` line height, center-aligned, `textSecondary`.
* **Actions**: Primary (`ButtonTextType.primary`) and Gray (`ButtonTextType.gray`) `ButtonText` with leading icons (`hasIcon: true`), `12px` gap.

### 2. Mobile Mode (`device=Mobile`)
* **Width**: `316px` (or fills available parent width).
* **Avatar / Graphic Container**: `84x84px` with `24px` border radius (`BorderRadius.circular(24)`).
* **Headline Title**: `48px` Geist SemiBold (600), `1.0` line height, `-0.0833em` (`-4.0px`) letter spacing, center-aligned, `textPrimary`.
* **Subtitle**: `16px` Geist SemiBold (`Headings/h4`), `20px` line height, center-aligned, `textSecondary`.
* **Actions**: Primary (`ButtonTextType.primary`) and Gray (`ButtonTextType.gray`) `ButtonText` without icons (`hasIcon: false`), `12px` gap.

---

## 🧩 Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `width` | `double?` | `null` | Optional fixed width constraint. |
| `device` | `HeroBlockDevice` | `HeroBlockDevice.auto` | Viewport mode (`auto`, `pc`, or `mobile`). |
| `breakpoint` | `double` | `500.0` | Threshold below which mobile layout is activated in `auto` mode. |
| `avatar` | `ImageProvider?` | `null` | Image provider for top avatar. |
| `avatarUrl` | `String?` | `null` | Network URL for top avatar. |
| `avatarAssetPath` | `String?` | `null` | Local asset path for top avatar. |
| `avatarWidget` | `Widget?` | `null` | Custom widget override for avatar. |
| `avatarSize` | `double` | `84.0` | Width and height for avatar container. |
| `avatarRadius` | `BorderRadius?` | `BorderRadius.circular(24)` | Corner radius of avatar container. |
| `hasAvatar` | `bool` | `true` | Whether avatar container is shown. |
| `title` | `String` | `'Hi, I am Nayan &\nI build things.'` | Main headline text. |
| `titleWidget` | `Widget?` | `null` | Custom widget override for title. |
| `hasSubtitle` | `bool` | `true` | Whether subtitle is shown. |
| `subtitle` | `String` | `'Principal UX Designer & Engineer @SIG'` | Subtitle descriptive text. |
| `subtitleWidget` | `Widget?` | `null` | Custom widget override for subtitle. |
| `hasActions` | `bool` | `true` | Whether action buttons bar is shown. |
| `primaryButtonLabel` | `String` | `'Book a call'` | Label for primary action button. |
| `primaryButtonIcon` | `IconData?` | `Icons.videocam_outlined` | Icon for primary action button. |
| `hasPrimaryButtonIcon` | `bool?` | `null` | Icon visibility override (`true` on PC, `false` on Mobile by default). |
| `onPrimaryTap` | `VoidCallback?` | `null` | Callback for primary action tap. |
| `hasPrimaryButton` | `bool` | `true` | Whether primary button is shown. |
| `secondaryButtonLabel` | `String` | `'Download CV'` | Label for secondary action button. |
| `secondaryButtonIcon` | `IconData?` | `Icons.description_outlined` | Icon for secondary action button. |
| `hasSecondaryButtonIcon`| `bool?` | `null` | Icon visibility override (`true` on PC, `false` on Mobile by default). |
| `onSecondaryTap` | `VoidCallback?` | `null` | Callback for secondary action tap. |
| `hasSecondaryButton` | `bool` | `true` | Whether secondary button is shown. |
| `actions` | `List<Widget>?` | `null` | Custom widget list for actions bar. |

---

## 📦 Usage Example

```dart
import 'package:alter/alter.dart';

HeroBlock(
  avatarUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
  title: 'Hi, I am Nayan &\nI build things.',
  subtitle: 'Principal UX Designer & Engineer @SIG',
  primaryButtonLabel: 'Book a call',
  onPrimaryTap: () => print('Book call tapped'),
  secondaryButtonLabel: 'Download CV',
  onSecondaryTap: () => print('Download CV tapped'),
)
```

---

## 🏷️ Version History

* **`v1.0.0`**: Initial release matching Figma Node `761:6375` (`HeroBlock`: `device=PC` / `device=Mobile`).
