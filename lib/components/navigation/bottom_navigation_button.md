# BottomNavigationButton

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbutton)

## Overview
`BottomNavigationButton` is a standalone 72x72px action button used in bottom navigation layouts. It supports `primary` (black fill, inverted icon) and `secondary` (gray fill, dark icon) variants with 30px corner radius.

## Usage
```dart
BottomNavigationButton(
  icon: Icons.add,
  type: BottomNavigationButtonType.secondary,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `icon` | `IconData` | `Icons.add` | Icon displayed inside the button (28px). |
| `type` | `BottomNavigationButtonType` | `secondary` | Variant type (`primary`, `secondary`). |
| `onTap` | `VoidCallback?` | `null` | Tap callback handler. |

---

## Component Changelog
* **`v1.0.1`**: Bound semantic color tokens (`baseBlack`, `baseGray`, `stroke1000`, `stroke100`).
* **`v1.0.0`**: Initial release.
