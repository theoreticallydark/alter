# FeedbackText

> Current Version: `v1.0.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/status/feedbacktext)

## Overview
`FeedbackText` is an inline validation and helper status text component in the Alter Design System. It pairs a 16x16 icon with a caption message to communicate field-level feedback (`danger`, `warning`, `caution`, `success`).

## Usage
```dart
FeedbackText(
  text: 'This field is required',
  status: FeedbackTextStatus.danger,
  hasIcon: true,
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `text` | `String` | `'Feedback Text'` | The feedback or validation message string. |
| `status` | `FeedbackTextStatus` | `FeedbackTextStatus.danger` | Status variant (`danger`, `warning`, `caution`, `success`). |
| `hasIcon` | `bool` | `true` | Visibility flag for the leading status icon. |
| `icon` | `IconData` | `Icons.error` | Icon data displayed when `hasIcon` is true (16x16px). |

---

## Design System Tokens & Specs (Figma Node `339:11991`)
- **Dimensions & Geometry**:
  - Gap: `4px` between icon and text.
  - Icon size: `16x16px`.
  - Layout: `Row(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.center)`.
- **Typography**:
  - `Body/caption` -> `AlterTypography.caption` (Geist 12px, Regular 400, line-height 16px).
- **Status Variants & Colors**:
  - **`danger`**: `AlterSemanticTokens.textDanger` (`#E7000B`).
  - **`warning`**: `AlterSemanticTokens.textWarning` (`#8A2C0D`).
  - **`caution`**: `AlterSemanticTokens.textCaution` (`#D08700`).
  - **`success`**: `AlterSemanticTokens.textSuccess` (`#00A63E`).

---

## Component Changelog
* **`v1.0.0`**: Initial release matching Figma Node `339:11991`.
