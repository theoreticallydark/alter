import 'package:flutter/material.dart';
import '../buttons/button_icon.dart';

/// Position state variants for [CarouselControl].
enum CarouselControlPosition {
  /// Start position: previous button is hidden (opacity 0) and next button is active.
  start,

  /// Middle position: both previous and next buttons are visible and active.
  middle,

  /// End position: previous button is active and next button is hidden (opacity 0).
  end,
}

/// A carousel navigation overlay control bar for switching between slides.
///
/// Figma Specifications (Node `811:11843` - `.CarouselControl`):
/// - Layout: Horizontal bar, `padding: EdgeInsets.symmetric(horizontal: 24)`, `MainAxisAlignment.spaceBetween`.
/// - Variants:
///   - `Position=Start` (`811:11844`): Left button hidden (`opacity: 0`), Right button visible.
///   - `Position=Middle` (`811:11847`): Left button visible, Right button visible.
///   - `Position=End` (`811:11850`): Left button visible, Right button hidden (`opacity: 0`).
/// - Buttons:
///   - Reuses [ButtonIcon] (`130:8371`, `ButtonIconType.white`, 48x48px, 20px radius, 1px border).
///   - Icons: `chevron_left` and `chevron_right` (28x28px glyph size).
class CarouselControl extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.1: Encapsulated internal ButtonIcon configurations strictly adhering to Figma Node 811:11843 without leaking child button properties.
  /// v1.0.0: Initial release matching Figma Node 811:11843 (.CarouselControl: Start, Middle, End variants).
  static const String version = '1.0.1';

  /// Navigation position state of the carousel.
  final CarouselControlPosition position;

  /// Callback executed when the previous slide button is tapped.
  final VoidCallback? onPrevious;

  /// Callback executed when the next slide button is tapped.
  final VoidCallback? onNext;

  /// Whether the previous button is enabled/visible (overrides [position] if specified).
  final bool? canPrevious;

  /// Whether the next button is enabled/visible (overrides [position] if specified).
  final bool? canNext;

  /// Outer padding of the control bar (defaults to 24px horizontal).
  final EdgeInsetsGeometry padding;

  /// Creates a [CarouselControl] instance.
  const CarouselControl({
    super.key,
    this.position = CarouselControlPosition.middle,
    this.onPrevious,
    this.onNext,
    this.canPrevious,
    this.canNext,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  });

  /// Convenience constructor for carousel at the start position.
  const CarouselControl.start({
    super.key,
    this.onNext,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  })  : position = CarouselControlPosition.start,
        onPrevious = null,
        canPrevious = false,
        canNext = true;

  /// Convenience constructor for carousel at the middle position.
  const CarouselControl.middle({
    super.key,
    this.onPrevious,
    this.onNext,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  })  : position = CarouselControlPosition.middle,
        canPrevious = true,
        canNext = true;

  /// Convenience constructor for carousel at the end position.
  const CarouselControl.end({
    super.key,
    this.onPrevious,
    this.padding = const EdgeInsets.symmetric(horizontal: 24.0),
  })  : position = CarouselControlPosition.end,
        onNext = null,
        canPrevious = true,
        canNext = false;

  bool get _effectiveCanPrevious {
    if (canPrevious != null) return canPrevious!;
    return position != CarouselControlPosition.start;
  }

  bool get _effectiveCanNext {
    if (canNext != null) return canNext!;
    return position != CarouselControlPosition.end;
  }

  Widget _buildPreviousButton() {
    return ButtonIcon(
      icon: Icons.chevron_left,
      type: ButtonIconType.white,
      size: 48.0,
      iconSize: 28.0,
      onTap: _effectiveCanPrevious ? onPrevious : null,
    );
  }

  Widget _buildNextButton() {
    return ButtonIcon(
      icon: Icons.chevron_right,
      type: ButtonIconType.white,
      size: 48.0,
      iconSize: 28.0,
      onTap: _effectiveCanNext ? onNext : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _effectiveCanPrevious ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: IgnorePointer(
              ignoring: !_effectiveCanPrevious,
              child: _buildPreviousButton(),
            ),
          ),
          AnimatedOpacity(
            opacity: _effectiveCanNext ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: IgnorePointer(
              ignoring: !_effectiveCanNext,
              child: _buildNextButton(),
            ),
          ),
        ],
      ),
    );
  }
}
