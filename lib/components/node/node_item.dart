import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_icon_ghost.dart';

/// Visual style types for [NodeItem].
enum NodeItemType {
  /// Borderless transparent surface by default; highlights on hover/select.
  ghost,

  /// Subtle gray surface with stroke border by default; highlights on hover/select.
  gray,
}

/// A tree-view navigation and entity node item component for the Alter Design System.
///
/// Figma Specifications (Node `657:1758` - `NodeItem`):
/// - Variants:
///   - `type`: `Ghost`, `Gray`
///   - `state`: `Default`, `Hover`, `Selected`
///   - `isCollapsible`: `True`
///   - `isCollapsed`: `False`, `True`
/// - Properties:
///   - `label`: Label text (defaults to `"Label"`)
///   - `hasIcon`: Toggle leading icon (defaults to `true`)
///   - `hasRightSlot`: Toggle trailing action slot (defaults to `false`)
///   - `hasSpacerOne`: Indentation spacer 1 (20x20px)
///   - `hasSpacerTwo`: Indentation spacer 2 (20x20px)
/// - Geometries:
///   - Padding: Uniform 6px on all sides.
///   - Gap: 4px between elements.
///   - Border Radius: 10px.
///   - Expanded Height: ~32px (6px + 20px + 6px).
///   - Collapsed Dimensions: 32x32px square icon tile.
/// - Tokens:
///   - Text: [AlterTypography.bodyBold] (Geist 14px, 600, line-height 16px).
///   - Foreground: [AlterSemanticTokens.stroke1000] (`#000000`).
///   - Gray Surface: [AlterSemanticTokens.baseGray] (`#F9FAFB`).
///   - Gray Stroke: 1px [AlterSemanticTokens.baseBorder] (`#E5E7EB`).
///   - Active / Hover / Selected Fill: [AlterSemanticTokens.baseActive] (`#E5E7EB`).
class NodeItem extends StatefulWidget {
  /// Component version for reference.
  static const String version =
      '1.1.0'; // Updated optical icon-to-text alignment and fixed height/collapsed 32px constraints per Figma node 657:1758

  /// The visual style variant of the node item.
  final NodeItemType type;

  /// The text label displayed in the node item.
  final String label;

  /// Whether the node is currently in a selected state.
  final bool isSelected;

  /// Optional override for hover state (useful in testing/catalogs).
  final bool? isHovered;

  /// Whether the node item is currently collapsed into a compact icon tile.
  final bool isCollapsed;

  /// Whether the node item supports collapse/expand behavior.
  final bool isCollapsible;

  /// Whether to display the leading icon.
  final bool hasIcon;

  /// Custom icon widget or glyph displayed at the start of the node (20x20px).
  final Widget? icon;

  /// IconData shorthand for leading icon glyph. Used if [icon] is null.
  final IconData? iconData;

  /// Whether to show the trailing action slot.
  final bool hasRightSlot;

  /// Custom widget displayed in the trailing action slot.
  /// Defaults to a [ButtonIconGhost] with `Icons.expand_more` when null and [hasRightSlot] is true.
  final Widget? rightSlot;

  /// Explicit flag to render the first 20px indent spacer.
  final bool hasSpacerOne;

  /// Explicit flag to render the second 20px indent spacer.
  final bool hasSpacerTwo;

  /// Convenience indentation level (`0`, `1`, `2`, ...), automatically setting indent spacers.
  final int indentationLevel;

  /// Primary callback executed when the node item is tapped.
  final VoidCallback? onTap;

  /// Callback executed when toggling collapse or tapping the trailing collapse chevron.
  final VoidCallback? onToggleCollapse;

  /// Callback executed specifically when tapping the default trailing action slot.
  final VoidCallback? onRightSlotTap;

  /// Creates a [NodeItem] instance.
  const NodeItem({
    super.key,
    this.type = NodeItemType.ghost,
    this.label = 'Label',
    this.isSelected = false,
    this.isHovered,
    this.isCollapsed = false,
    this.isCollapsible = true,
    this.hasIcon = true,
    this.icon,
    this.iconData,
    this.hasRightSlot = false,
    this.rightSlot,
    this.hasSpacerOne = false,
    this.hasSpacerTwo = false,
    this.indentationLevel = 0,
    this.onTap,
    this.onToggleCollapse,
    this.onRightSlotTap,
  });

  @override
  State<NodeItem> createState() => _NodeItemState();
}

class _NodeItemState extends State<NodeItem> {
  bool _internalHovered = false;

  bool get _isActiveHover => (widget.isHovered ?? false) || _internalHovered;
  bool get _isHighlighted => widget.isSelected || _isActiveHover;

  Color get _surfaceColor {
    if (_isHighlighted) {
      return AlterSemanticTokens.baseActive;
    }
    switch (widget.type) {
      case NodeItemType.gray:
        return AlterSemanticTokens.baseGray;
      case NodeItemType.ghost:
        return Colors.transparent;
    }
  }

  Border get _border {
    switch (widget.type) {
      case NodeItemType.gray:
        return Border.all(
          color: AlterSemanticTokens.baseBorder,
          width: 1.0,
        );
      case NodeItemType.ghost:
        return Border.all(
          color: Colors.transparent,
          width: 1.0,
        );
    }
  }

  Widget _buildLeadingIcon() {
    if (widget.icon != null) {
      return SizedBox(
        width: 20,
        height: 20,
        child: Center(child: widget.icon),
      );
    }
    return Icon(
      widget.iconData ?? Icons.face_5_outlined,
      size: 20,
      color: AlterSemanticTokens.stroke1000,
    );
  }

  Widget _buildRightSlot() {
    if (widget.rightSlot != null) {
      return SizedBox(
        width: 20,
        height: 20,
        child: Center(child: widget.rightSlot),
      );
    }
    return ButtonIconGhost(
      icon: Icons.expand_more,
      size: 20,
      type: ButtonIconGhostType.secondary,
      onTap: widget.onToggleCollapse ?? widget.onRightSlotTap ?? widget.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveSpacers = widget.indentationLevel > 0
        ? widget.indentationLevel
        : ((widget.hasSpacerOne ? 1 : 0) + (widget.hasSpacerTwo ? 1 : 0));

    // Collapsed Mode: strictly 32x32px square surface matching Figma mainContainer
    if (widget.isCollapsed) {
      return UnconstrainedBox(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => _internalHovered = true),
          onExit: (_) => setState(() => _internalHovered = false),
          child: GestureDetector(
            onTap: widget.onToggleCollapse ?? widget.onTap,
            behavior: HitTestBehavior.opaque,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              width: 32,
              height: 32,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: _surfaceColor,
                border: _border,
                borderRadius: BorderRadius.circular(10),
              ),
              child: widget.hasIcon ? _buildLeadingIcon() : const SizedBox.shrink(),
            ),
          ),
        ),
      );
    }

    // Expanded Mode: Full row with spacers, icon, label, and right slot
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _internalHovered = true),
      onExit: (_) => setState(() => _internalHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
          decoration: BoxDecoration(
            color: _surfaceColor,
            border: _border,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Indentation Spacers (20x20px each)
              for (int i = 0; i < effectiveSpacers; i++)
                const SizedBox(width: 20, height: 20),

              // Leading Icon (20x20px)
              if (widget.hasIcon) ...[
                _buildLeadingIcon(),
                const SizedBox(width: 4),
              ],

              // Label (wrapped in 20px height slot with optical baseline centering)
              Expanded(
                child: SizedBox(
                  height: 20,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.label,
                      style: AlterTypography.bodyBold.copyWith(
                        color: AlterSemanticTokens.stroke1000,
                        height: 1.0,
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),

              // Right Action Slot (20x20px)
              if (widget.hasRightSlot) ...[
                const SizedBox(width: 4),
                _buildRightSlot(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
