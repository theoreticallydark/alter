# AlterDeviceScope

> Current Version: `v1.1.0`  
> [Launch in Widgetbook ↗](https://theoreticallydark.github.io/alter/#/foundations/alterdevicescope)

## Overview
`AlterDeviceScope` is an [InheritedWidget] that propagates the ambient [AlterDevice] mode (`pc` or `mobile`) down the widget tree. Responsive grid blocks ([GraphicsGridBlock], [MobileMockupsGridBlock]) and composite blocks ([GraphicsBlock], [MobileMockupBlock]) consume this scope so that child components derive their device mode directly from their parent's resolved layout and do not make redundant independent viewport queries.

## Design Specifications
* **Inherited Scope**: Provides `AlterDeviceScope.of(context)` and `AlterDeviceScope.maybeOf(context)`.
* **Modes**:
  * `AlterDevice.pc`: Desktop, PC, or wide web layout mode.
  * `AlterDevice.mobile`: Compact mobile layout mode.
* **Block Adaptation**: Works hand-in-hand with `AlterBlockDevice` (`auto`, `pc`, `mobile`), where `auto` resolves first against `AlterDeviceScope.maybeOf(context)`.

## Usage

```dart
import 'package:alter/alter.dart';

// Wrap layout tree with an ambient device mode
AlterDeviceScope(
  device: AlterDevice.pc,
  child: const GraphicsGridBlock(
    // Child blocks automatically inherit AlterDevice.pc layout
  ),
)

// Inside a child widget:
final isMobile = AlterDeviceScope.of(context) == AlterDevice.mobile;
```

## Properties

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `device` | `AlterDevice` | **required** | The active device mode for the subtree (`pc` or `mobile`). |
| `child` | `Widget` | **required** | The subtree receiving device propagation. |

---

## Changelog

### 1.1.0
- Added `AlterBlockDevice` enum (`auto`, `pc`, `mobile`) and unified responsive site block references.

### 1.0.0
- Initial release: ambient device propagation scope ensuring child components synchronize with parent grid and block layout state.
