# BottomNavigationButton

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbutton)

## Overview
`BottomNavigationButton` is a dedicated `72x72` circular action button designed to accompany bottom navigation bars in the Alter Design System. It supports `primary` and `secondary` style variants.

## Design Specifications
* **Dimensions**: `72px x 72px`.
* **Padding**: `10px` on all sides (`EdgeInsets.all(10)`).
* **Corner Radius**: `30px` (`BorderRadius.circular(30)`).
* **Border**: 1px solid stroke.
* **Icon Size**: `28x28px`.

### Variant & Token Mapping
| Variant | Surface Fill | Border Stroke | Icon Color | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`Primary`** | `AlterSemanticTokens.baseBlack` (`#1E2939`) | `AlterSemanticTokens.stroke1000` (`#000000`) | `AlterSemanticTokens.textInverse` (`#FFFFFF`) | High-emphasis dark action trigger. |
| **`Secondary`** | `AlterSemanticTokens.baseGray` (`#F9FAFB`) | `AlterSemanticTokens.stroke100` (`#F3F4F6`) | `AlterSemanticTokens.textPrimary` (`#000000`) | Muted surface action trigger. |

---

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
| `type` | `BottomNavigationButtonType` | `BottomNavigationButtonType.secondary` | Color variant (`primary`, `secondary`). |
| `onTap` | `VoidCallback?` | `null` | Tap callback handler. |

---

## Component Changelog

### `v1.0.1`
* **Tokens**: Synchronized border and surface tokens with `AlterSemanticTokens.stroke1000` / `stroke100` and `AlterSemanticTokens.baseBlack` / `baseGray`.

### `v1.0.0`
* Initial release of `BottomNavigationButton`.
