# Component Composition & Slot Flexibility Guidelines

## 1. Slot Design & Graceful Swapping
* Every slot in compound/container components (e.g., `ApplicationHeader`, `ListItem`) must accept arbitrary `Widget?` inputs rather than enforcing hardcoded primitives.
* When slots are omitted, defaulted, or set to `null` / `false`, the surrounding container must hug dynamically without leaving dangling margins or whitespace.
* Transitions between slot states (e.g. expanding/collapsing child slots in headers) should use smooth, non-disruptive animations (`AnimatedSize`, `AnimatedCrossFade`, cubic easing).

## 2. Icon Toggles & MUI Conventions
* Toggle buttons and icon switches (e.g., `ToggleIcon`) should follow the Material/MUI convention:
  * Default / Unselected State: Outlined/border icon (`icon`, e.g. `Icons.star_border`, `Icons.favorite_border`).
  * Selected / Active State: Filled icon (`selectedIcon`, e.g. `Icons.star`, `Icons.favorite`).
* **Graceful Fallback**: If a custom icon does not have an outlined/filled counterpart or `selectedIcon` is omitted, the component must gracefully fallback to rendering `icon` and let semantic color tokens convey the active/inactive state.
* Allow consumers to configure icons directly at points of usage.

## 3. Component Versioning & Quality Verification
* Every component class maintains a public `static const String version` updated upon modifications with inline change comments.
* Always add/update automated widget tests in `test/alter_test.dart` and verify that `flutter test` exits code 0 before concluding a component iteration.

## 4. Interactive Widgetbook (`/example`) Synchronization
* After every component update or version upgrade, always update the interactive Widgetbook catalog in `/example` (`example/lib/categories/`) to reflect all newly introduced variants, properties, knobs, and states (e.g. new size variants, selection toggles, slots, or icons).
* Ensure that the example showcase compiles cleanly and accurately portrays all public capabilities of the component.

## 5. Dual-Interaction Pattern (Runtime Pointer + Explicit Knobs)
* Interactive components must support both automatic pointer tracking (`MouseRegion`, `InkWell`, gesture handlers) and optional explicit state overrides (e.g., `bool? isHovered`, `bool isSelected`) to enable deterministic widget testing and live knob manipulation in the `/example` showcase.
* **Resilient Hover State Getter**: To prevent non-null boolean knobs in Widgetbook (which default to `false`) from blocking live cursor tracking, components must evaluate active hover as: `(widget.isHovered == true) || _internalHovered`.
* **Explicit MouseRegion**: Always wrap interactive button containers with a dedicated `MouseRegion(onEnter: ..., onExit: ...)` with `cursor: SystemMouseCursors.click` to guarantee responsive cursor tracking across Flutter Web and Desktop.
* Use standard transition curves (`Curves.easeOut`, `150ms`) for smooth state animations.

