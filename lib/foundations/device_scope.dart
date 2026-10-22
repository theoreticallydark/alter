import 'package:flutter/widgets.dart';

/// Target device mode propagated down the widget hierarchy.
enum AlterDevice {
  /// Desktop / PC / Web layout mode.
  pc,

  /// Mobile layout mode.
  mobile,
}

/// Target viewport adaptation modes for responsive Alter site blocks.
enum AlterBlockDevice {
  /// Automatically adapts based on parent width constraint or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout.
  pc,

  /// Forces Mobile layout.
  mobile;

  /// Alias for [pc] desktop/web layout.
  static const AlterBlockDevice web = AlterBlockDevice.pc;
}

/// An [InheritedWidget] that propagates the ambient [AlterDevice] mode (PC or Mobile) down the widget tree.
///
/// Responsive grid blocks ([GraphicsGridBlock], [MobileMockupsGridBlock]) and composite blocks ([GraphicsBlock], [MobileMockupBlock])
/// use this scope so that child components ([BiographyBlock], [GraphicsBlock], [MobileMockupBlock]) derive their
/// device mode directly from their parent's resolved layout and not judge their own width independently.
class AlterDeviceScope extends InheritedWidget {
  /// Component version for reference.
  /// v1.1.0: Added AlterBlockDevice enum and updated block references.
  /// v1.0.0: Ambient device propagation scope ensuring child components synchronize with parent grid/block device state.
  static const String version = '1.1.0';

  /// The active device mode for the subtree.
  final AlterDevice device;

  /// Creates an [AlterDeviceScope].
  const AlterDeviceScope({
    super.key,
    required this.device,
    required super.child,
  });

  /// Retrieves the ambient [AlterDevice] if one is provided in the widget hierarchy.
  static AlterDevice? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AlterDeviceScope>()?.device;
  }

  /// Retrieves the ambient [AlterDevice], defaulting to [AlterDevice.pc] if none is found.
  static AlterDevice of(BuildContext context) {
    return maybeOf(context) ?? AlterDevice.pc;
  }

  /// Whether the ambient device is PC.
  bool get isPc => device == AlterDevice.pc;

  /// Whether the ambient device is Mobile.
  bool get isMobile => device == AlterDevice.mobile;

  @override
  bool updateShouldNotify(covariant AlterDeviceScope oldWidget) => device != oldWidget.device;
}
