# Changelog

## 1.0.0

### Production Release — UI Foundation & Enhanced Component Modularity

* **Typography & Styling**:
  * Package-level asset scoping for Geist (`100` to `900`) and Instrument Serif font families.
  * Comprehensive color swatches (`AlterColors`) and Light Mode semantic token palette (`AlterSemanticTokens`).

* **Components & Enhancements**:
  * **`ApplicationHeader` (`v1.1.0`)**: Added `hasReturnButton` back navigation trigger (`ButtonIconGhost`), custom action icon bindings, and avatar image provider support with animated child slot expansion.
  * **`AlterBottomNavigationBar` (`v1.1.0`)**: Refined auto-layout geometry with explicit 8px item gap and standard bar sizing.
  * **`BottomNavigationBarAction` (`v1.1.0`)**: Standardized action trigger variants (`buttons`), default secondary styling, and custom action slotting.
  * **`ButtonText` (`v1.1.0`)**: Added `ButtonType.red` variant with `statusDanger` fill and `colorsRed800` border stroke.
  * **`ButtonIcon` (`v1.3.0`)**: Added `ButtonIconType.red` variant, customizable sizing (`48x48`, `64x64`), and selection border highlights.
  * **`ButtonIconGhost` (`v1.1.0`)**: Integrated gesture hooks (`onTapDown`, `onTapUp`, `onTapCancel`, `onLongPress`) for continuous interaction.
  * **`ButtonGraphicImage` (`v1.1.0`)**: Added `ImageProvider? image` support with `20px` anti-aliased clipping for avatars and custom child slots.
  * **`ButtonGraphicText` (`v1.0.2`)**: Fine-tuned asymmetric padding (`7px 10px 9px`) for metric badge styling.
  * **`Pill` (`v1.0.3`)**: Added animated cross-fades and smooth cubic sizing transitions between label/value variations across default and compact sizes.
  * **`Checkbox` (`v1.0.0`)**: Tri-state selection control with `unchecked`, `intermediate`, and `checked` states with `statusSuccess` highlight.
  * **`ToggleIcon` (`v1.1.0`)**: Implemented Material/MUI convention supporting outline `icon` and filled `selectedIcon` with graceful color fallback.
  * **`ListItem` (`v1.0.1`)**: Aligned subtitle styling to `textDisabled` (`#99A1AF`) and standardized swappable left/right slots.
  * **`Search` (`v1.0.1`)**: Sized input field with `20px` corner radius, prefix search icon, and focus/typing states.

* **Testing & Documentation**:
  * Comprehensive test suite verifying tokens, rendering, and interaction behaviors.
  * Public documentation for all components in `lib/components/**/*.md` with property tables and usage guides.

---

## 0.0.1
 
- Initial preview of the Alter Design System for Flutter.
- Curated typography scale supporting Geist and Instrument Serif font families.
- Color swatches (`AlterColors`) and semantic tokens (`AlterSemanticTokens`).
- Initial UI component implementations.
