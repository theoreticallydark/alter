# BottomNavigationButton

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbutton)

## Overview
`BottomNavigationButton` is a dedicated `72x72` circular action button designed to accompany bottom navigation bars in the Alter Design System.

## Usage
```dart
BottomNavigationButton(
  icon: Icons.add,
  type: BottomNavigationButtonType.primary,
  onTap: () {},
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `icon` | `IconData` | `Icons.add` | Icon rendered in the center (28px size). |
| `type` | `BottomNavigationButtonType` | `.secondary` | Color variant (`primary` = black, `secondary` = gray). |
| `onTap` | `VoidCallback?` | `null` | Tap callback. |

---

## Component Changelog
* **`v1.0.1`**: Synchronized border and surface tokens with `AlterSemanticTokens.stroke1000` / `stroke100`.
* **`v1.0.0`**: Initial release.
