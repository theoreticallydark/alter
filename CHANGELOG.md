# Changelog

## 2.0.0

### Major Release — Complete Inputs Suite, Expanded Selection & Status Components

* **New Inputs Suite (`lib/components/inputs/`)**:
  * **`InputControl` (`v2.3.0`)**: Multi-slot input primitive supporting 64px container height, `#F9FAFB` gray & `#FFFFFF` white surfaces, live focus/hover rings, top-aligned leading/trailing slots during multiline entry, and crash-proof line bounds guarding (`minLines <= maxLines`).
  * **`TextInput` (`v2.4.0`)**: FormField integration with `TextInputMode` filters (email, phone, decimal, alphanumeric, numbers), deferred `isRequired` validation on blur (`_hasBeenTouched`), and direct `keyboardType: TextInputType?` fallback override.
  * **`TextArea` (`v2.4.0`)**: Multiline text area supporting both fixed reserved lines (e.g. `lines: 4`) and dynamic adaptive height (e.g. `lines: 4, minLines: 1`) that auto-expands line-by-line up to max ceiling as the user types.
  * **`NumericInput` (`v2.3.0`)**: Live comma grouping (International and Indian numbering formats), decimal precision limits, bounds validation (`minValue`/`maxValue`), and customizable trailing `rightButton` action slot.
  * **`CurrencyInput` (`v2.2.0`)**: Financial currency entry preset built on `NumericInput` with Euro default icon, 2-decimal precision, and prefix formatting.
  * **`PasswordInput` (`v2.2.1`)**: Clean surface by default (`leftIcon: null`), interactive eye visibility toggle (`ButtonIconGhost`), built-in space denial (`allowSpaces: false`), character limit overflow, and toggleable password strength validation rules.
  * **`SearchInput` (`v2.1.0`)**: Search entry field with leading search icon, auto-clearing `close_rounded` action button, and search keyboard action.
  * **`OTPInput` (`v1.0.0`)**: Multi-box pin verification control with digit filtering, auto-focus forwarding, and backspace navigation.

* **New Selection & Toggle Controls (`lib/components/selects/`)**:
  * **`Radio` (`v1.0.0`)**: Single-selection control with token-driven active/inactive states and smooth indicator animation.
  * **`Switch` (`v1.0.0`)**: Mobile toggle switch with animated thumb transitions and Alter semantic color fills.
  * **`ToggleText` (`v1.0.0`)**: Text-based segmented/tabbed toggle button with animated sliding indicator.

* **New Pills & Badges (`lib/components/pills/`)**:
  * **`AdvancedPill` (`v1.0.0`)**: Multi-segment status tag with customizable leading/trailing slots and interactive press states.
  * **`Badge` (`v1.0.0`)**: Count badge and status dot indicator with multiple color variants and automatic overflow formatting (`99+`).

* **New Status & Feedback (`lib/components/status/`)**:
  * **`Toast` (`v1.0.0`)**: Floating banner notification component with success, warning, danger, and info semantic variants.
  * **`FeedbackText` (`v1.0.0`)**: Inline form helper and error message caption with semantic iconography.

* **New Navigation & Tabs (`lib/components/tabs/`, `lib/components/navigation/`)**:
  * **`AlterTabs` & `TabItem` (`v1.0.0`)**: Horizontal scrollable and fixed tab bar with animated underline indicator and custom tab item badges.
  * **`BottomNavigationButton` (`v1.0.0`)**: Primary call-to-action button embedded directly in bottom navigation bars.

* **Architecture, Quality & Tests**:
  * Unified component directory structure (`lib/components/inputs/`) with clean library exports in `lib/alter.dart`.
  * Expanded automated test suite to 19 unit & widget tests verifying rendering, token fidelity, and interactive lifecycles across all components.

---

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
