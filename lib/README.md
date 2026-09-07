# Alter Design System

Alter is a lightweight, mobile-first design system built for Flutter applications.

---

## 🚀 Quick Start

### 1. Import Alter Components & Styles
Include the Alter barrel export in your screen or component file:

```dart
import 'package:alter/alter.dart';
```

---

## 🎨 Styles & Tokens Architecture

Alter organizes styles under `lib/styles/`:

* **`swatches.dart` (`AlterColors`)**: Raw color palette swatches extracted from Figma variables (234 swatches).
* **`tokens.dart` (`AlterSemanticTokens`)**: Semantic color tokens mapped directly to `AlterColors` (e.g. `textPrimary`, `baseGray`, `stroke100`).
* **`typography.dart` (`AlterTypography`)**: Typography text style tokens (`displayXl`, `h1Bold`, `h1Serif`, `bodyLgBold`, `body`, `caption`, etc.).

---

## 🔤 Font Configuration

Alter components use bundled local font assets registered in `pubspec.yaml`:

- **`Geist`**: Primary sans-serif font family (Thin 100 to Black 900).
- **`InstrumentSerif`**: Serif accent font family (Regular & Italic).

### App-Level Theme Setup
Set `fontFamily: 'Geist'` in your main application theme:

```dart
MaterialApp(
  theme: ThemeData(
    fontFamily: 'Geist',
  ),
  home: const HomeScreen(),
);
```

---

## 🧩 Component Catalog

### Navigation & Header Components
| Component | Version | Docs & Changelog | Widgetbook | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`ApplicationHeader`** | `v1.0.2` | [application_header.md](file:///c:/Vayu/Alter/lib/components/application_header.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/navigation/applicationheader) | Top header with title, subtitle, composite actions, and child slot. |
| **`AlterBottomNavigationBar`** | `v1.0.1` | [bottom_navigation_bar.md](file:///c:/Vayu/Alter/lib/components/bottom_navigation/bottom_navigation_bar.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbar) | Rounded bottom navigation bar with item list. |
| **`BottomNavigationBarAction`** | `v1.0.2` | [bottom_navigation_bar_action.md](file:///c:/Vayu/Alter/lib/components/bottom_navigation/bottom_navigation_bar_action.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbaraction) | Action bottom bar with integrated primary action or multi-action triggers. |
| **`BottomNavigationButton`** | `v1.0.1` | [bottom_navigation_button.md](file:///c:/Vayu/Alter/lib/components/bottom_navigation/bottom_navigation_button.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationbutton) | 72x72 rounded action button. |
| **`BottomNavigationItem`** | `v1.0.1` | [bottom_navigation_item.md](file:///c:/Vayu/Alter/lib/components/bottom_navigation/bottom_navigation_item.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/navigation/bottomnavigationitem) | Individual selectable tab item. |

### Button Components
| Component | Version | Docs & Changelog | Widgetbook | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`ButtonText`** | `v1.0.1` | [button_text.md](file:///c:/Vayu/Alter/lib/components/buttons/button_text.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/buttons/buttontext) | Text button with type (`gray`, `white`, `primary`) and size variants. |
| **`ButtonIcon`** | `v1.2.0` | [button_icon.md](file:///c:/Vayu/Alter/lib/components/buttons/button_icon.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/buttons/buttonicon) | Square icon button (48x48, 64x64) with selection state. |
| **`ButtonIconGhost`** | `v1.1.0` | [button_icon_ghost.md](file:///c:/Vayu/Alter/lib/components/buttons/button_icon_ghost.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/buttons/buttoniconghost) | Ghost icon button with long press and tap gesture hooks. |
| **`ButtonGraphicImage`** | `v1.0.1` | [button_graphic_image.md](file:///c:/Vayu/Alter/lib/components/buttons/button_graphic_image.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/buttons/buttongraphicimage) | Compact 48x48 icon container button. |
| **`ButtonGraphicText`** | `v1.0.1` | [button_graphic_text.md](file:///c:/Vayu/Alter/lib/components/buttons/button_graphic_text.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/buttons/buttongraphictext) | Dual-label badge button (customizable title & subtitle). |

### Display & Input Components
| Component | Version | Docs & Changelog | Widgetbook | Description |
| :--- | :--- | :--- | :--- | :--- |
| **`ListItem`** | `v1.0.0` | [list_item.md](file:///c:/Vayu/Alter/lib/components/list_item.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/display/listitem) | Flexible list row with title, subtitle, left slot, and dual right slots. |
| **`Pill`** | `v1.0.3` | [pill.md](file:///c:/Vayu/Alter/lib/components/pills/pill.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/display/pill) | Status badge & filter pill with animated cross-fades. |
| **`Search`** | `v1.0.1` | [search.md](file:///c:/Vayu/Alter/lib/components/search/search.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/inputs/search) | Rounded search input field with 20px corners and state styling. |
| **`Checkbox`** | `v1.0.0` | [checkbox.md](file:///c:/Vayu/Alter/lib/components/selects/checkbox.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/inputs/checkbox) | Tri-state selection control (unchecked, intermediate, checked). |
| **`ToggleIcon`** | `v1.0.0` | [toggle_icon.md](file:///c:/Vayu/Alter/lib/components/selects/toggle_icon.md) | [Preview ↗](https://theoreticallydark.github.io/alter/#/inputs/toggleicon) | Binary toggle button with heart indicator. |

---

## 🏷️ Version Tracking & Changelog Standard

1. **Reverse Chronological Order**: All changelog entries (both in the global [`CHANGELOG.md`](file:///c:/Vayu/Alter/CHANGELOG.md) and individual component `.md` files) **must list the newest / latest version logs at the top**.
2. **Component Reference Constant**: Every component defines a runtime static version:
   ```dart
   static const String version = '1.0.2';
   ```
3. **Internal Mappings**: Internal Figma node IDs and workspace links are cataloged in `docs/figma_registry.json` and excluded from publication via `.pubignore`.
