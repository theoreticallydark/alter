# Alter

A lightweight, mobile-first design system built for Flutter applications, featuring curated Geist typography, semantic tokens, and modular UI components.

---

## 🚀 Getting Started

### 1. Add Dependency
Add `alter` to your `pubspec.yaml`:

```yaml
dependencies:
  alter: ^2.0.0
```

### 2. Import Alter
Import the single barrel file into your Dart code:

```dart
import 'package:alter/alter.dart';
```

### 3. App-Level Theme Setup
Set `fontFamily: AlterTypography.geistFont` in your main `MaterialApp` theme:

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

Alter organizes design tokens into foundational layers:

* **`AlterColors`**: 234 raw color palette swatches extracted from Figma design variables.
* **`AlterSemanticTokens`**: Semantic color mappings (`baseWhite`, `baseGray`, `baseBlack`, `textPrimary`, `stroke100`, `statusSuccess`, etc.).
* **`AlterTypography`**: Text style scale tokens (`display`, `displayXl`, `h1Serif`, `h1Bold`, `h2`, `h3`, `bodyLgBold`, `body`, `caption`, etc.).

---

## 🧩 Components Catalog

### Inputs (`lib/components/inputs/`)
- **`InputControl`**: Configurable surface primitive with multiline bounds safety, leading/trailing slots, hover/focus rings, and error message container.
- **`TextInput`**: Full `FormField<String>` wrapper with `TextInputMode` filters, deferred `isRequired` validation on blur, and direct `keyboardType` fallback override.
- **`TextArea`**: Multiline text area supporting both fixed reserved lines (`lines: 4`) and dynamic adaptive height (`minLines: 1`) that expands as users type.
- **`NumericInput`**: Live comma grouping (International and Indian systems), decimal precision limits, bounds validation (`minValue`/`maxValue`), and trailing action slot.
- **`CurrencyInput`**: Financial currency entry preset with Euro default icon, 2-decimal precision, and prefix formatting.
- **`PasswordInput`**: Secure input with interactive eye visibility toggle, built-in space denial, character limits, and strength validation rules.
- **`SearchInput`**: Search entry field with leading search icon, auto-clearing close button, and search keyboard action.
- **`OTPInput`**: Multi-box pin verification control with digit filtering, auto-focus forwarding, and backspace navigation.

### Buttons (`lib/components/buttons/`)
- **`ButtonText`**: Text buttons with `ButtonType` (`gray`, `white`, `primary`, `red`) and `ButtonSize` (`normal`, `large`).
- **`ButtonIcon`**: Square icon buttons (`48x48`, `64x64`) with selection state and accent colors.
- **`ButtonIconGhost`**: Borderless ghost icon buttons with gesture hooks (`onTap`, `onLongPress`).
- **`ButtonGraphicText`**: Dual-label badge button (customizable `title` & `subtitle`).
- **`ButtonGraphicImage`**: Compact icon button container.

### Selects & Toggles (`lib/components/selects/`)
- **`Checkbox`**: Tri-state selection control supporting `unchecked`, `intermediate`, and `checked` states.
- **`Radio`**: Single-selection control with token-driven active/inactive states.
- **`Switch`**: Smooth animated toggle switch with Alter semantic color fills.
- **`ToggleIcon`**: Outlined/filled Material-style icon toggle with color fallback.
- **`ToggleText`**: Text-based segmented/tabbed toggle button with animated sliding indicator.

### Pills & Badges (`lib/components/pills/`)
- **`Pill`**: Status badge & filter pill with animated cross-fades across default and compact sizes.
- **`AdvancedPill`**: Multi-segment status tag with customizable leading/trailing slots and interactive press states.
- **`Badge`**: Count badge and status dot indicator with multiple color variants and auto-overflow formatting (`99+`).

### Status & Feedback (`lib/components/status/`)
- **`Toast`**: Floating banner notification component with `success`, `warning`, `danger`, and `info` semantic variants.
- **`FeedbackText`**: Inline form helper and error message caption with semantic iconography.

### Navigation & Tabs (`lib/components/navigation/`, `lib/components/tabs/`, `lib/components/header/`)
- **`ApplicationHeader`**: Top navigation header with title, subtitle, return button, composite action buttons, and animated child slot.
- **`AlterTabs`**: Horizontal scrollable and fixed tab bar with animated underline indicator and custom `TabItem` badges.
- **`AlterBottomNavigationBar`**: Floating pill bottom navigation bar with responsive tab items.
- **`BottomNavigationBarAction`**: Bottom navigation bar composed with primary/secondary action triggers.
- **`BottomNavigationButton`**: Primary call-to-action button embedded in bottom navigation.

### Utilities (`lib/components/utilities/`)
- **`ListItem`**: Universal list tile with title, subtitle, leading action slot, and dual trailing slots.

---

## 📖 Live Interactive Documentation (Widgetbook)

Check out the interactive catalog and workbench in the [`example/`](https://github.com/theoreticallydark/alter/tree/main/example) directory:

```bash
cd example
flutter run -d chrome
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
