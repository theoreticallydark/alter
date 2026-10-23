# Changelog

## 3.1.0

### Minor Release — Full Web & WASM Ready, Pluggable Media Slots & Node Item Tree

#### 🚀 What’s New?
- **Node Component (`lib/components/node/`)**:
  - `NodeItem` (`v1.0.0`): Hierarchical tree view and directory listing component supporting expandable chevron states, customizable leading/trailing slots, selection feedback, and collapsed icon tile mode.
- **Pluggable Media Slots Architecture (`AlterMediaView v2.0.0`)**:
  - Decoupled `package:video_player` from core Alter dependencies, achieving **100% Web & WebAssembly (WASM) compatibility** and zero native `dart:io` restrictions.
  - Added dedicated media slots (`slot` / `customWidget`) and lazy builders (`mediaBuilder: (context) => Widget`) to host custom video players (`video_player`, `media_kit`), Rive/Lottie animations, or custom interactive canvas layers.
  - Updated `GraphicsBlock` and `MobileMockupBlock` with `mediaBuilder` slots.
- **Explicit Platform Declarations**:
  - Registered full multi-platform support across Android, iOS, Web, Windows, macOS, and Linux in `pubspec.yaml`.
- **Ecosystem Quality**:
  - Reached **150 / 150 points** with **WASM-ready** status on pub.dev (Pana analyzer).

## 3.0.0

### Major Release — Web & Responsive Sites Support, Multimedia Layer & Standardized Foundations

#### 🚀 What’s New?
- **Web Header (`lib/web/application_header/`)**:
  - `ApplicationHeader` (`v1.0.1`): Full-width desktop/web application header supporting launcher app drawer, customizable brand logo unit, page navigation tab row, composite action buttons, and user avatar button.
- **Responsive Sites & Blocks Suite (`lib/sites/`)**:
  - `BiographyBlock` (`v1.1.0`): Responsive entity and bio presentation card supporting `Tall` and `Wide` layouts with logo, title, badges, and bio description.
  - `BrandBlock` (`v1.0.0`): Responsive social proof and partner brand showcase block.
  - `FooterBlock` (`v1.0.1`): Responsive landing page footer block with contact email, copy-to-clipboard action, and social profile links.
  - `GraphicsBlock` (`v1.5.0`): Responsive project and portfolio card molecule supporting single & multi-item carousels for images, animated GIFs, and autoplay looping videos.
  - `GraphicsGridBlock` (`v1.1.1`): Responsive project grid layout (PC 2-column, Mobile 1-column) consuming `GraphicsBlock` cards with device scope synchronization.
  - `HeaderBlock` (`v1.0.0`): Responsive section header block with expandable divider line and bold headline typography.
  - `HeroBlock` (`v1.0.0`): Responsive landing page hero banner section with avatar, 80px display headline, subtitle, and primary/secondary action buttons.
  - `HeroProjectsBlock` (`v1.1.0`): Responsive case study hero block with logo, title, metadata grid, notice banner, tech stack, and action links.
  - `MobileMockupBlock` (`v1.3.0`): Responsive mobile screen showcase and entity card (428:926 iPhone container) supporting images, GIFs, and viewport-aware video playback with integrated biography card.
  - `MobileMockupsGridBlock` (`v1.1.0`): Responsive mobile showcase grid & carousel with unified entity metadata supporting image and video lists with viewport autoplay.

#### 🔄 Updates
- **Standardized Block Device Modes**: Consolidated all 11 block device enums into a unified `AlterBlockDevice` enum (`auto`, `pc`, `mobile`) in `lib/foundations/device_scope.dart`.
- **Naming Alignment**:
  - Mobile header standardized as `ApplicationHeaderMobile` in `lib/mobile/application_header_mobile/`.
  - Canonical block naming across all site cards (`BiographyBlock`, `GraphicsBlock`, `MobileMockupBlock`, `GraphicsGridBlock`, `MobileMockupsGridBlock`, `HeroProjectsBlock`).
  - Added `hasBiographyBlock` on `MobileMockupBlock`.
- **Refactored Example Catalog**: Fully restructured `/example` into a 1:1 mirror of `/lib` with clean nested Widgetbook categories (`Foundations`, `Styles`, `Components`, `Mobile`, `Web`, `Sites`).

#### 🟡 In-Beta
- **`GraphicsCarouselBlock` (`v1.1.0`)**: Full-width responsive visual showcase block with multi-item sliding on PC and touch peek swipe on mobile.

#### 🎨 Figma Exclusives
- Added responsive PC (1440px / 896px content width) and Mobile (390px / 316px content width) layout artboards and handoff specifications for site sections.

#### 💻 Flutter Exclusives
- **`AlterDeviceScope` (`v1.1.0`)**: Ambient inherited device mode propagation (`AlterDevice.pc` / `AlterDevice.mobile`) ensuring nested child blocks derive layout mode from parent grid bounds without independent resize queries.
- **`AlterMediaView` (`v1.1.0`)**: Universal media presentation layer supporting static images, animated GIFs, and muted looping autoplay videos via `video_player` with viewport visibility detection (`playInViewportOnly`) and configurable delay (`autoPlayDelay: 1200ms`).

---

## 2.0.1

- Comprehensive dartdoc documentation (`///`) added across all UI components, semantic tokens, typography styles, and public API symbols.

## 2.0.0

### Major Release — Complete Inputs Suite, Expanded Selection & Status Components

- **New Inputs Suite (`lib/components/inputs/`)**:
  - **`InputControl` (`v2.3.0`)**: Multi-slot input primitive supporting 64px container height, `#F9FAFB` gray & `#FFFFFF` white surfaces, live focus/hover rings, top-aligned leading/trailing slots during multiline entry, and crash-proof line bounds guarding (`minLines <= maxLines`).
  - **`TextInput` (`v2.4.0`)**: FormField integration with `TextInputMode` filters (email, phone, decimal, alphanumeric, numbers), deferred `isRequired` validation on blur (`_hasBeenTouched`), and direct `keyboardType: TextInputType?` fallback override.
  - **`TextArea` (`v2.4.0`)**: Multiline text area supporting both fixed reserved lines (e.g. `lines: 4`) and dynamic adaptive height (e.g. `lines: 4, minLines: 1`) that auto-expands line-by-line up to max ceiling as the user types.
  - **`NumericInput` (`v2.3.0`)**: Live comma grouping (International and Indian numbering formats), decimal precision limits, bounds validation (`minValue`/`maxValue`), and customizable trailing `rightButton` action slot.
  - **`CurrencyInput` (`v2.2.0`)**: Financial currency entry preset built on `NumericInput` with Euro default icon, 2-decimal precision, and prefix formatting.
  - **`PasswordInput` (`v2.2.1`)**: Clean surface by default (`leftIcon: null`), interactive eye visibility toggle (`ButtonIconGhost`), built-in space denial (`allowSpaces: false`), character limit overflow, and toggleable password strength validation rules.
  - **`SearchInput` (`v2.1.0`)**: Search entry field with leading search icon, auto-clearing `close_rounded` action button, and search keyboard action.
  - **`OTPInput` (`v1.0.0`)**: Multi-box pin verification control with digit filtering, auto-focus forwarding, and backspace navigation.

- **New Selection & Toggle Controls (`lib/components/selects/`)**:
  - **`Radio` (`v1.0.0`)**: Single-selection control with token-driven active/inactive states and smooth indicator animation.
  - **`Switch` (`v1.0.0`)**: Mobile toggle switch with animated thumb transitions and Alter semantic color fills.
  - **`ToggleText` (`v1.0.0`)**: Text-based segmented/tabbed toggle button with animated sliding indicator.

- **New Pills & Badges (`lib/components/pills/`)**:
  - **`AdvancedPill` (`v1.0.0`)**: Multi-segment status tag with customizable leading/trailing slots and interactive press states.
  - **`Badge` (`v1.0.0`)**: Count badge and status dot indicator with multiple color variants and automatic overflow formatting (`99+`).

- **New Status & Feedback (`lib/components/status/`)**:
  - **`Toast` (`v1.0.0`)**: Floating banner notification component with success, warning, danger, and info semantic variants.
  - **`FeedbackText` (`v1.0.0`)**: Inline form helper and error message caption with semantic iconography.

- **New Navigation & Tabs (`lib/components/tabs/`, `lib/components/navigation/`)**:
  - **`AlterTabs` & `TabItem` (`v1.0.0`)**: Horizontal scrollable and fixed tab bar with animated underline indicator and custom tab item badges.
  - **`BottomNavigationButton` (`v1.0.0`)**: Primary call-to-action button embedded directly in bottom navigation bars.

- **Architecture, Quality & Tests**:
  - Unified component directory structure (`lib/components/inputs/`) with clean library exports in `lib/alter.dart`.
  - Expanded automated test suite to 19 unit & widget tests verifying rendering, token fidelity, and interactive lifecycles across all components.

---

## 1.0.0

### Production Release — UI Foundation & Enhanced Component Modularity

- **Typography & Styling**:
  - Package-level asset scoping for Geist (`100` to `900`) and Instrument Serif font families.
  - Comprehensive color swatches (`AlterColors`) and Light Mode semantic token palette (`AlterSemanticTokens`).

- **Components & Enhancements**:
  - **`ApplicationHeader` (`v1.1.0`)**: Added `hasReturnButton` back navigation trigger (`ButtonIconGhost`), custom action icon bindings, and avatar image provider support with animated child slot expansion.
  - **`AlterBottomNavigationBar` (`v1.1.0`)**: Refined auto-layout geometry with explicit 8px item gap and standard bar sizing.
  - **`BottomNavigationBarAction` (`v1.1.0`)**: Standardized action trigger variants (`buttons`), default secondary styling, and custom action slotting.
  - **`ButtonText` (`v1.1.0`)**: Added `ButtonType.red` variant with `statusDanger` fill and `colorsRed800` border stroke.
  - **`ButtonIcon` (`v1.3.0`)**: Added `ButtonIconType.red` variant, customizable sizing (`48x48`, `64x64`), and selection border highlights.
  - **`ButtonIconGhost` (`v1.1.0`)**: Integrated gesture hooks (`onTapDown`, `onTapUp`, `onTapCancel`, `onLongPress`) for continuous interaction.
  - **`ButtonGraphicImage` (`v1.1.0`)**: Added `ImageProvider? image` support with `20px` anti-aliased clipping for avatars and custom child slots.
  - **`ButtonGraphicText` (`v1.0.2`)**: Fine-tuned asymmetric padding (`7px 10px 9px`) for metric badge styling.
  - **`Pill` (`v1.0.3`)**: Added animated cross-fades and smooth cubic sizing transitions between label/value variations across default and compact sizes.
  - **`Checkbox` (`v1.0.0`)**: Tri-state selection control with `unchecked`, `intermediate`, and `checked` states with `statusSuccess` highlight.
  - **`ToggleIcon` (`v1.1.0`)**: Implemented Material/MUI convention supporting outline `icon` and filled `selectedIcon` with graceful color fallback.
  - **`ListItem` (`v1.0.1`)**: Aligned subtitle styling to `textDisabled` (`#99A1AF`) and standardized swappable left/right slots.
  - **`Search` (`v1.0.1`)**: Sized input field with `20px` corner radius, prefix search icon, and focus/typing states.

- **Testing & Documentation**:
  - Comprehensive test suite verifying tokens, rendering, and interaction behaviors.
  - Public documentation for all components in `lib/components/**/*.md` with property tables and usage guides.

---

## 0.0.1

- Initial preview of the Alter Design System for Flutter.
- Curated typography scale supporting Geist and Instrument Serif font families.
- Color swatches (`AlterColors`) and semantic tokens (`AlterSemanticTokens`).
- Initial UI component implementations.
