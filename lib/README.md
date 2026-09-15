# Alter Design System

Alter is a lightweight, mobile-first design system built for Flutter applications, featuring curated Geist typography, semantic tokens, and modular UI components.

---

## 🚀 Quick Start

### 1. Import Alter Components & Styles
Include the Alter barrel export in your screen or component file:

```dart
import 'package:alter/alter.dart';
```

### 2. App-Level Theme Setup
Set `fontFamily: AlterTypography.geistFont` in your main application theme:

```dart
MaterialApp(
  theme: ThemeData(
    fontFamily: AlterTypography.geistFont,
    scaffoldBackgroundColor: AlterSemanticTokens.baseWhite,
  ),
  home: const HomeScreen(),
);
```

---

## 🎨 Styles & Tokens Architecture

Alter organizes styles under `lib/styles/`:

* **`swatches.dart` (`AlterColors`)**: Raw color palette swatches extracted from design variables (234 swatches).
* **`tokens.dart` (`AlterSemanticTokens`)**: Semantic color tokens mapped directly to `AlterColors` (e.g. `textPrimary`, `baseGray`, `stroke100`, `focusRing`).
* **`typography.dart` (`AlterTypography`)**: Typography text style tokens (`displayXl`, `h1Bold`, `h1Serif`, `bodyLgBold`, `body`, `caption`, etc.).

---

## 🔤 Font Configuration

Alter components use bundled local font assets registered in `pubspec.yaml`:

- **`Geist`**: Primary sans-serif font family (Thin 100 to Black 900).
- **`InstrumentSerif`**: Serif accent font family (Regular & Italic).

---

## 🧩 Component Catalog

### Inputs (`lib/components/inputs/`)
| Component | Version | Docs | Description |
| :--- | :--- | :--- | :--- |
| **`InputControl`** | `v2.3.0` | [input_control.md](inputs/input_control.md) | Configurable surface primitive with multiline bounds safety, slots, and hover/focus rings. |
| **`TextInput`** | `v2.4.0` | [text_input.md](inputs/text_input.md) | FormField wrapper with `TextInputMode` filters, deferred `isRequired` validation, and native `keyboardType` override. |
| **`TextArea`** | `v2.4.0` | [text_area_input.md](inputs/text_area_input.md) | Multiline text area supporting fixed reserved height and auto-expanding adaptive height. |
| **`NumericInput`** | `v2.3.0` | [numeric_input.md](inputs/numeric_input.md) | Number formatting (International / Indian), bounds validation, decimal limits, and right button slot. |
| **`CurrencyInput`** | `v2.2.0` | [currency_input.md](inputs/currency_input.md) | Financial currency entry preset with Euro default icon, 2-decimal precision, and prefix formatting. |
| **`PasswordInput`** | `v2.2.1` | [password_input.md](inputs/password_input.md) | Secure input with interactive eye toggle, space denial, character limits, and strength rules. |
| **`SearchInput`** | `v2.1.0` | [search_input.md](inputs/search_input.md) | Search entry field with leading search icon, auto-clearing close button, and search keyboard action. |
| **`OTPInput`** | `v1.0.0` | [otp_input.md](inputs/otp_input.md) | Multi-box pin verification control with digit filtering, auto-focus forwarding, and backspace navigation. |

### Buttons (`lib/components/buttons/`)
| Component | Version | Docs | Description |
| :--- | :--- | :--- | :--- |
| **`ButtonText`** | `v1.1.0` | [button_text.md](buttons/button_text.md) | Text button with type (`gray`, `white`, `primary`, `red`) and size variants. |
| **`ButtonIcon`** | `v1.3.0` | [button_icon.md](buttons/button_icon.md) | Square icon button (`48x48`, `64x64`) with selection state. |
| **`ButtonIconGhost`** | `v1.1.0` | [button_icon_ghost.md](buttons/button_icon_ghost.md) | Ghost icon button with long press and tap gesture hooks. |
| **`ButtonGraphicText`** | `v1.0.2` | [button_graphic_text.md](buttons/button_graphic_text.md) | Dual-label badge button (customizable title & subtitle). |
| **`ButtonGraphicImage`** | `v1.1.0` | [button_graphic_image.md](buttons/button_graphic_image.md) | Compact icon button container. |

### Selects & Toggles (`lib/components/selects/`)
| Component | Version | Docs | Description |
| :--- | :--- | :--- | :--- |
| **`Checkbox`** | `v1.0.0` | [checkbox.md](selects/checkbox.md) | Tri-state selection control (unchecked, intermediate, checked). |
| **`Radio`** | `v1.0.0` | [radio.md](selects/radio.md) | Single-selection control with token-driven active/inactive states. |
| **`Switch`** | `v1.0.0` | [switch.md](selects/switch.md) | Smooth animated toggle switch with Alter semantic color fills. |
| **`ToggleIcon`** | `v1.1.0` | [toggle_icon.md](selects/toggle_icon.md) | Outlined/filled icon toggle with color fallback. |
| **`ToggleText`** | `v1.0.0` | [toggle_text.md](selects/toggle_text.md) | Text-based segmented/tabbed toggle button with animated sliding indicator. |

### Pills & Badges (`lib/components/pills/`)
| Component | Version | Docs | Description |
| :--- | :--- | :--- | :--- |
| **`Pill`** | `v1.0.3` | [pill.md](pills/pill.md) | Status badge & filter pill with animated cross-fades across default and compact sizes. |
| **`AdvancedPill`** | `v1.0.0` | [advanced_pill.md](pills/advanced_pill.md) | Multi-segment status tag with customizable leading/trailing slots. |
| **`Badge`** | `v1.0.0` | [badge.md](pills/badge.md) | Count badge and status dot indicator with multiple color variants and auto-overflow formatting (`99+`). |

### Status & Feedback (`lib/components/status/`)
| Component | Version | Docs | Description |
| :--- | :--- | :--- | :--- |
| **`Toast`** | `v1.0.0` | [toast.md](status/toast.md) | Floating banner notification component with semantic variants. |
| **`FeedbackText`** | `v1.0.0` | [feedback_text.md](status/feedback_text.md) | Inline form helper and error message caption with semantic iconography. |

### Navigation & Header (`lib/components/navigation/`, `lib/components/tabs/`, `lib/components/header/`)
| Component | Version | Docs | Description |
| :--- | :--- | :--- | :--- |
| **`ApplicationHeader`** | `v1.1.0` | [application_header.md](header/application_header.md) | Top header with title, subtitle, return button, composite action buttons, and animated child slot. |
| **`AlterTabs`** | `v1.0.0` | [tabs.md](tabs/tabs.md) | Horizontal scrollable and fixed tab bar with animated underline indicator. |
| **`AlterBottomNavigationBar`** | `v1.1.0` | [bottom_navigation_bar.md](navigation/bottom_navigation_bar.md) | Rounded bottom navigation bar with item list. |
| **`BottomNavigationBarAction`** | `v1.1.0` | [bottom_navigation_bar_action.md](navigation/bottom_navigation_bar_action.md) | Action bottom bar with integrated primary action or multi-action triggers. |
| **`BottomNavigationButton`** | `v1.0.0` | [bottom_navigation_button.md](navigation/bottom_navigation_button.md) | Primary action button embedded in bottom navigation. |

### Utilities (`lib/components/utilities/`)
| Component | Version | Docs | Description |
| :--- | :--- | :--- | :--- |
| **`ListItem`** | `v1.0.1` | [list_item.md](utilities/list_item.md) | Flexible list row with title, subtitle, left slot, and dual right slots. |

---

## 🏷️ Version Tracking Standard

1. **Reverse Chronological Order**: All changelog entries (both in the global [`CHANGELOG.md`](../CHANGELOG.md) and individual component `.md` files) list the newest version logs at the top.
2. **Component Reference Constant**: Every component defines a runtime static version:
   ```dart
   static const String version = '2.4.0';
   ```
3. **Internal Mappings**: Internal node registries are stored exclusively in internal registry files and excluded from publication via `.pubignore`.
