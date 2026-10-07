# ApplicationHeaderButtonText

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/header/applicationheaderbuttontext)

## Overview
`ApplicationHeaderButtonText` is a 48px height text action button / badge for application headers in the Alter Design System.

## Usage
```dart
ApplicationHeaderButtonText(
  label: 'STREAK',
  onTap: () {
    // Open streak details
  },
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | `'Label'` | Button text label. |
| `isHovered` | `bool?` | `null` | Explicit hover state override. |
| `isSelected` | `bool` | `false` | Selected active state toggle. |
| `height` | `double` | `48.0` | Height of the button container (Figma default: 48px). |
| `borderRadius` | `BorderRadius?` | `BorderRadius.zero` | Container corner radius (defaults to 0px sharp corners as per Figma node 760:3612). |
| `onTap` | `VoidCallback?` | `null` | Tap callback with splash feedback. |

---

## Design System Tokens & Specs (Figma Node `760:3612`)
- **Dimensions & Layout**:
  - Height: `48px`, horizontal padding: `12px` (`EdgeInsets.symmetric(horizontal: 12)`).
  - Corner Radius: `0px` (`BorderRadius.zero`).
- **Typography**:
  - Label: `Body/body-bold` -> `AlterTypography.bodyBold` (Geist 14px, SemiBold 600, 16px line-height).
- **Colors**:
  - Text: `AlterSemanticTokens.textPrimary` (`#000000`).
  - `state=Default`: Background `Colors.transparent`.
  - `state=Hover` / `state=Selected`: Background `AlterSemanticTokens.baseActive` (`#E5E7EB`).

---

## Component Changelog
* **`v1.0.1`**: Removed corner radius default to strictly adhere to Figma Node `760:3612` (sharp `BorderRadius.zero`).
* **`v1.0.0`**: Initial release matching Figma Node `760:3612` (`.ApplicationHeaderButtonText`).
