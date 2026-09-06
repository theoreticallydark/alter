# Alter

A lightweight, mobile-first design system built for Flutter applications, featuring curated Geist typography, semantic tokens, and modular UI components.

---

## 🚀 Getting Started

### 1. Add Dependency
Add `alter` to your `pubspec.yaml`:

```yaml
dependencies:
  alter: ^0.0.1
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

### Buttons
- **`ButtonText`**: Text buttons with `ButtonType` (`gray`, `white`, `primary`) and `ButtonSize` (`normal`, `large`).
- **`ButtonIcon`**: Icon buttons (`48x48`, `64x64`) supporting `ButtonIconType` and selected state.
- **`ButtonIconGhost`**: Borderless ghost icon buttons with gesture triggers.
- **`ButtonGraphicText`**: Dual-label badge button (customizable `title` & `subtitle`).
- **`ButtonGraphicImage`**: Compact icon button container.

### Navigation
- **`ApplicationHeader`**: Top navigation header with title, subtitle, streak badge, composite action buttons, and animated child slot.
- **`AlterBottomNavigationBar`**: Floating pill bottom navigation bar with responsive tab items.
- **`BottomNavigationBarAction`**: Bottom navigation bar composed with primary/secondary action triggers.

### Inputs & Selects
- **`Search`**: Search input field with 20px rounded corners and smooth focus transitions.
- **`Checkbox`**: Checkbox supporting `unchecked`, `intermediate`, and `checked` states.
- **`ToggleIcon`**: Heart/favorite interactive toggle.

### Layout & Display
- **`ListItem`**: Modular list item with title, subtitle, leading action slot, and dual trailing slots.
- **`Pill`**: Badge pill with customizable labels, values, sizes (`defaultSize`, `compact`), and completion states.

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

