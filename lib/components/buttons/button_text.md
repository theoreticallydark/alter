# ButtonText

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/buttons/buttontext)

## Overview
`ButtonText` is a primary/secondary text button adhering to the Alter Design System. It features rounded corners (`20px`), centered bold Geist typography (`AlterTypography.bodyLgBold`), and configurable sizing.

## Usage
```dart
ButtonText(
  label: 'Get Started',
  type: ButtonType.primary,
  size: ButtonSize.normal,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | *required* | The text label displayed inside the button. |
| `type` | `ButtonType` | `ButtonType.gray` | Color variant (`gray`, `white`, `primary`). |
| `size` | `ButtonSize` | `ButtonSize.normal` | Sizing variant (`normal` = 14px vertical, `large` = 22px vertical). |
| `onTap` | `VoidCallback?` | `null` | Tap callback handler. |

---

## Component Changelog
* **`v1.0.1`**: Enhanced minimum width constraint (`minWidth: 64px`) and normalized padding.
* **`v1.0.0`**: Initial release supporting `ButtonType` and `ButtonSize` variants.
