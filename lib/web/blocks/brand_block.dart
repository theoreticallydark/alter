import 'package:flutter/material.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Target device / viewport modes for [BrandBlock].
enum BrandBlockDevice {
  /// Automatically adapts based on parent width (< 500px triggers mobile layout) or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout (max width 896px).
  pc,

  /// Forces Mobile layout (max width 316px).
  mobile,
}

/// Data model representing a brand logo or partner tile in [BrandBlock].
class BrandItem {
  /// Optional display title or fallback name for the brand.
  final String? name;

  /// Optional network image URL.
  final String? imageUrl;

  /// Optional image provider.
  final ImageProvider? image;

  /// Optional local asset path.
  final String? assetPath;

  /// Optional custom widget override for the brand tile content.
  final Widget? child;

  /// Optional fixed width. If null, width hugs content or aspect ratio at fixed 64px height.
  final double? width;

  /// Background color of the brand tile container (defaults to [AlterSemanticTokens.bgSubtle]).
  final Color? backgroundColor;

  /// Optional border for the brand tile container.
  final Border? border;

  /// Optional corner radius (defaults to 16px).
  final BorderRadius? borderRadius;

  /// Optional tap callback.
  final VoidCallback? onTap;

  /// Creates a [BrandItem].
  const BrandItem({
    this.name,
    this.imageUrl,
    this.image,
    this.assetPath,
    this.child,
    this.width,
    this.backgroundColor,
    this.border,
    this.borderRadius,
    this.onTap,
  });
}

/// A responsive social proof brand showcase block for landing pages.
///
/// Figma Specifications (Node `761:6543` - `BrandBlock`):
/// - Variants:
///   - `device=PC` (`761:6544`): Width 896px, Column layout, 12px gap, centered.
///   - `device=Mobile` (`761:6552`): Width 316px, Column layout, 12px gap, centered.
/// - Elements:
///   - Text: 14px Geist Regular (Body/body), lineHeight 16px, textSecondary (`#4A5565`).
///   - BrandBar: Wrap row, 12px horizontal and vertical gap, centered.
///   - Brand Items: Fixed 64px height, 16px corner radius, hugging width to maintain source aspect ratio.
class BrandBlock extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 761:6543 (BrandBlock: device=PC/Mobile).
  static const String version = '1.0.0';

  /// Optional fixed width constraint for the block.
  final double? width;

  /// Viewport mode (`auto`, `pc`, or `mobile`).
  final BrandBlockDevice device;

  /// Width threshold below which mobile layout is activated (defaults to 500.0).
  final double breakpoint;

  /// Header title label (defaults to 'I have architected design systems at').
  final String title;

  /// Custom widget override for the title.
  final Widget? titleWidget;

  /// Whether the title is displayed (defaults to true).
  final bool hasTitle;

  /// Fixed height for each brand tile (defaults to 64.0 per Figma specs).
  final double brandHeight;

  /// Corner radius for brand tiles (defaults to 16.0 per Figma specs).
  final BorderRadius? brandRadius;

  /// Spacing between brand tiles in the wrap flow (defaults to 12.0).
  final double spacing;

  /// List of brand items to display in the brand bar.
  /// If null or empty, renders default design system brand placeholders.
  final List<BrandItem>? items;

  /// Creates a [BrandBlock] instance.
  const BrandBlock({
    super.key,
    this.width,
    this.device = BrandBlockDevice.auto,
    this.breakpoint = 500.0,
    this.title = 'I have architected design systems at',
    this.titleWidget,
    this.hasTitle = true,
    this.brandHeight = 64.0,
    this.brandRadius,
    this.spacing = 12.0,
    this.items,
  });

  /// Default placeholder items matching Figma Node 761:6543.
  static List<BrandItem> defaultPlaceholders() {
    return [
      const BrandItem(
        name: 'Element DS',
        width: 64.0,
      ),
      const BrandItem(
        name: 'SIEMENS',
        width: 180.0,
      ),
      const BrandItem(
        name: 'SIG',
        width: 64.0,
      ),
      const BrandItem(
        name: 'iX DS',
        width: 64.0,
      ),
      BrandItem(
        name: 'HeyDoc',
        width: 64.0,
        border: Border.all(color: const Color(0xFFF3F4F6), width: 1.0),
      ),
      const BrandItem(
        name: 'InLabels',
        width: 136.0,
      ),
    ];
  }

  Widget _buildBrandTile(BrandItem item) {
    final radius = item.borderRadius ?? brandRadius ?? BorderRadius.circular(16.0);
    final bgColor = item.backgroundColor ?? AlterSemanticTokens.baseGray;

    Widget content;
    if (item.child != null) {
      content = item.child!;
    } else if (item.image != null) {
      content = Image(
        image: item.image!,
        height: brandHeight,
        fit: BoxFit.fitHeight,
      );
    } else if (item.imageUrl != null && item.imageUrl!.isNotEmpty) {
      content = Image.network(
        item.imageUrl!,
        height: brandHeight,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholderGraphic(item.name),
      );
    } else if (item.assetPath != null && item.assetPath!.isNotEmpty) {
      content = Image.asset(
        item.assetPath!,
        height: brandHeight,
        fit: BoxFit.fitHeight,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholderGraphic(item.name),
      );
    } else {
      content = _buildPlaceholderGraphic(item.name);
    }

    Widget container = Container(
      height: brandHeight,
      width: item.width,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: radius,
        border: item.border ?? Border.all(color: AlterSemanticTokens.stroke100, width: 1.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Center(child: content),
    );

    if (item.onTap != null) {
      return Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: item.onTap,
          child: container,
        ),
      );
    }

    return container;
  }

  Widget _buildPlaceholderGraphic(String? name) {
    if (name == null || name.isEmpty) {
      return const Icon(
        Icons.layers_outlined,
        size: 28,
        color: AlterSemanticTokens.textDisabled,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Text(
        name,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontFamily: AlterTypography.geistFont,
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
          letterSpacing: -0.2,
          color: AlterSemanticTokens.textSecondary,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double parentWidth = constraints.maxWidth;
        final double targetWidth = width ?? parentWidth;
        final ambient = AlterDeviceScope.maybeOf(context);

        final bool isPc = switch (device) {
          BrandBlockDevice.auto => ambient != null
              ? ambient == AlterDevice.pc
              : targetWidth >= breakpoint,
          BrandBlockDevice.pc => true,
          BrandBlockDevice.mobile => false,
        };

        final effectiveItems = items ?? defaultPlaceholders();

        final blockContent = AlterDeviceScope(
          device: isPc ? AlterDevice.pc : AlterDevice.mobile,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (hasTitle) ...[
                if (titleWidget != null)
                  titleWidget!
                else
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AlterTypography.body.copyWith(
                      color: AlterSemanticTokens.textSecondary,
                    ),
                  ),
                SizedBox(height: spacing),
              ],
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: spacing,
                runSpacing: spacing,
                children: effectiveItems.map(_buildBrandTile).toList(),
              ),
            ],
          ),
        );

        if (width != null) {
          return SizedBox(
            width: width,
            child: blockContent,
          );
        }

        return blockContent;
      },
    );
  }
}
