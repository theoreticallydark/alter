# CarouselControl

> Current Version: `v1.0.1`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/utilities/carouselcontrol)

## Overview
`CarouselControl` is a carousel navigation control overlay bar that provides responsive previous/next chevron action buttons. It supports `Start`, `Middle`, and `End` positions with smooth opacity transitions for boundary limits.

## Usage
```dart
// Standard Carousel Navigation Bar
CarouselControl(
  position: CarouselControlPosition.middle,
  onPrevious: () => pageController.previousPage(),
  onNext: () => pageController.nextPage(),
)

// Start Position (Previous button hidden)
CarouselControl.start(
  onNext: () => pageController.nextPage(),
)

// End Position (Next button hidden)
CarouselControl.end(
  onPrevious: () => pageController.previousPage(),
)
```

## Properties
| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `position` | `CarouselControlPosition` | `CarouselControlPosition.middle` | Carousel position variant (`start`, `middle`, `end`). |
| `onPrevious` | `VoidCallback?` | `null` | Tap callback for previous button. |
| `onNext` | `VoidCallback?` | `null` | Tap callback for next button. |
| `canPrevious` | `bool?` | `null` | Explicit toggle to enable/show previous button. |
| `canNext` | `bool?` | `null` | Explicit toggle to enable/show next button. |
| `padding` | `EdgeInsetsGeometry` | `EdgeInsets.symmetric(horizontal: 24.0)` | Outer padding of the control bar. |

---

## Design System Tokens & Specs (Figma Node `811:11843`)
- **Layout**: Row with `MainAxisAlignment.spaceBetween`, 24px horizontal padding.
- **Buttons**:
  - Reuses [ButtonIcon](file:///c:/Vayu/Alter/lib/components/buttons/button_icon.dart) (`130:8371`, `ButtonIconType.white`).
  - Size: `48x48px`, `20px` corner radius, `1px` border stroke (`AlterSemanticTokens.stroke200` `#E5E7EB`).
  - Chevron Glyph Size: `28px` (`layout_7c8bdc2c`).
  - Boundary States: Inactive chevron button renders with `opacity: 0` (`IgnorePointer`).

---

## Component Changelog
* **`v1.0.1`**: Encapsulated internal `ButtonIcon` properties strictly adhering to Figma Node `811:11843` without leaking child button configuration params.
* **`v1.0.0`**: Initial release matching Figma Node `811:11843` (`.CarouselControl`).
