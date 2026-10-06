# BottomNavigationButton

> Current Version: `v1.0.4`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbutton)

## Overview
`BottomNavigationButton` is a standalone 72x72px action button used in bottom navigation layouts. It supports `primary` (black fill, inverted icon) and `secondary` (gray fill, dark icon) variants with 30px corner radius and smooth hover/tap animations.

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
* **`v1.0.4`**: Wrapped in `MouseRegion` (`SystemMouseCursors.click`) and upgraded container to `AnimatedContainer` (`150ms`, `Curves.easeOut`) for responsive pointer feedback across Web and Mobile.
* **`v1.0.3`**: Aligned primary border with `AlterSemanticTokens.interactivePrimaryBorder` (`#030712`) and secondary border with `AlterSemanticTokens.baseBorder` (`#E5E7EB`) per Figma Node `60:1950`.
* **`v1.0.2`**: Replaced deprecated `baseBlack` token reference with `AlterColors.colorsGray800` swatch.
* **`v1.0.1`**: Bound semantic color tokens (`baseBlack`, `baseGray`, `stroke1000`, `stroke100`).
* **`v1.0.0`**: Initial release.
