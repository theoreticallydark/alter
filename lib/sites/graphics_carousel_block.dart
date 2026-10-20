import 'package:flutter/material.dart' hide Badge, Divider;
import '../../components/utilities/carousel_control.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import 'biography_block.dart';

/// Target device / viewport modes for [GraphicsCarouselBlock].
enum GraphicsCarouselBlockDevice {
  /// Automatically responds to layout constraints (< 600px triggers mobile layout) or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout (2 items visible with CarouselControl overlaid, width 896px).
  pc,

  /// Forces Mobile layout (horizontal swipe carousel with 272x153px cards and peek, width 316px).
  mobile,
}

/// A responsive carousel component showcasing graphic / project images with navigation controls and an entity biography card.
///
/// Figma Specifications (Node `957:17108` - `GraphicsCarouselBlock`):
/// - Variants:
///   - `device=PC, isCarousel=True` (`957:17115`):
///     - Overall width: 896px (hug vertical).
///     - Container: 2-column grid / row with 24px gap.
///     - Images: 16:9 ratio, border radius 20px, 2px `#F3F4F6` stroke, height ~245.25px.
///     - Overlaid [.CarouselControl] placed at `y: 98.78px` with white 48x48px chevron buttons.
///     - Bottom section: [BiographyBlock] (`type=Tall, device=Web`) with logo, badges, title, and subtitle.
///   - `device=Mobile, isCarousel=True` (`957:17121`):
///     - Overall width: 316px (hug vertical).
///     - Container: Horizontal scroll / swipe carousel of cards (272px width, 153px height, 16:9 ratio, 24px gap).
///     - Bottom section: [BiographyBlock] in compact mobile mode (`hasLogo: false`, `hasBadgeBar: false`).
class GraphicsCarouselBlock extends StatefulWidget {
  /// Component version for reference.
  /// v1.1.0: Added pcItemsPerView property to allow 2 or 3 visible blocks up front in PC mode.
  /// v1.0.0: Initial release matching Figma Node 957:17108.
  static const String version = '1.1.0';

  /// Viewport mode (`auto`, `pc`, or `mobile`).
  final GraphicsCarouselBlockDevice device;

  /// Number of graphic cards visible at once in PC mode (supports 2 or 3, defaults to 2 per Figma).
  final int pcItemsPerView;

  /// Optional fixed width constraint for the entire container (defaults to fill available parent width).
  final double? width;

  /// Width threshold below which mobile layout is activated (defaults to 600.0).
  final double breakpoint;

  /// Spacing gap between graphic items (defaults to 24px per Figma).
  final double gap;

  /// List of image URLs to display in the carousel.
  final List<String>? imageUrls;

  /// List of pre-constructed image widgets.
  final List<Widget>? items;

  /// Total count of items when using [itemBuilder].
  final int? itemCount;

  /// Builder for generating items dynamically.
  final IndexedWidgetBuilder? itemBuilder;

  /// Callback when an item is tapped.
  final ValueChanged<int>? onItemTap;

  // ==========================================
  // Biography Block Properties
  // ==========================================

  /// Custom widget override for the bottom biography block.
  final Widget? biographyWidget;

  /// Title text for the biography card.
  final String title;

  /// Custom widget override for title.
  final Widget? titleWidget;

  /// Subtitle descriptive text.
  final String subtitle;

  /// Custom widget override for subtitle.
  final Widget? subtitleWidget;

  /// Whether subtitle is displayed (defaults to true).
  final bool hasSubtitle;

  /// Description text for the biography card.
  final String? description;

  /// Whether description is displayed (defaults to false).
  final bool hasDescription;

  /// Image provider for the entity logo.
  final ImageProvider? logo;

  /// Asset path for the entity logo.
  final String? logoAssetPath;

  /// Custom widget override for the logo.
  final Widget? logoWidget;

  /// Whether the logo is displayed in PC mode (defaults to true).
  final bool hasLogo;

  /// Whether the badge bar is displayed in PC mode (defaults to true).
  final bool hasBadgeBar;

  /// Labels for badge pills.
  final List<String>? badgeLabels;

  /// Custom badge widgets.
  final List<Widget>? badges;

  /// Creates a [GraphicsCarouselBlock].
  const GraphicsCarouselBlock({
    super.key,
    this.device = GraphicsCarouselBlockDevice.auto,
    this.pcItemsPerView = 2,
    this.width,
    this.breakpoint = 600.0,
    this.gap = 24.0,
    this.imageUrls,
    this.items,
    this.itemCount,
    this.itemBuilder,
    this.onItemTap,
    this.biographyWidget,
    this.title = 'Title',
    this.titleWidget,
    this.subtitle = 'Subtitle',
    this.subtitleWidget,
    this.hasSubtitle = true,
    this.description,
    this.hasDescription = false,
    this.logo,
    this.logoAssetPath,
    this.logoWidget,
    this.hasLogo = true,
    this.hasBadgeBar = true,
    this.badgeLabels,
    this.badges,
  })  : assert(pcItemsPerView == 2 || pcItemsPerView == 3, 'pcItemsPerView must be 2 or 3'),
        assert(
          imageUrls != null || items != null || (itemBuilder != null && itemCount != null),
          'Provide either imageUrls, items, or an itemBuilder with itemCount',
        );

  @override
  State<GraphicsCarouselBlock> createState() => _GraphicsCarouselBlockState();
}

class _GraphicsCarouselBlockState extends State<GraphicsCarouselBlock> {
  int _currentIndex = 0;
  late final PageController _pageController;

  int get _totalItems {
    if (widget.imageUrls != null) return widget.imageUrls!.length;
    if (widget.items != null) return widget.items!.length;
    return widget.itemCount ?? 0;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPrevious() {
    if (_currentIndex > 0) {
      setState(() => _currentIndex--);
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onNext() {
    final maxIndex = (_totalItems - widget.pcItemsPerView).clamp(0, _totalItems - 1);
    if (_currentIndex < maxIndex) {
      setState(() => _currentIndex++);
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildCard(int index, {required double height, double? width}) {
    Widget content;
    if (widget.items != null && index < widget.items!.length) {
      content = widget.items![index];
    } else if (widget.itemBuilder != null) {
      content = widget.itemBuilder!(context, index);
    } else if (widget.imageUrls != null && index < widget.imageUrls!.length) {
      content = Image.network(
        widget.imageUrls![index],
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: AlterSemanticTokens.brand100,
          child: const Center(
            child: Icon(Icons.image, color: AlterSemanticTokens.brand400, size: 36),
          ),
        ),
      );
    } else {
      content = Container(
        color: AlterSemanticTokens.brand100,
        child: const Center(
          child: Icon(Icons.image, color: AlterSemanticTokens.brand400, size: 36),
        ),
      );
    }

    final card = Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AlterSemanticTokens.brand100,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFFF3F4F6),
          width: 2,
        ),
      ),
      child: content,
    );

    if (widget.onItemTap != null) {
      return GestureDetector(
        onTap: () => widget.onItemTap!(index),
        child: card,
      );
    }
    return card;
  }

  Widget _buildPcLayout(double containerWidth) {
    final itemsCount = widget.pcItemsPerView;
    final totalGapsWidth = widget.gap * (itemsCount - 1);
    final cardWidth = (containerWidth - totalGapsWidth) / itemsCount;
    final cardHeight = cardWidth * (9 / 16);

    final maxIndex = (_totalItems - itemsCount).clamp(0, _totalItems - 1);
    final canGoBack = _currentIndex > 0;
    final canGoForward = _currentIndex < maxIndex;

    final rowChildren = <Widget>[];
    for (int i = 0; i < itemsCount; i++) {
      if (i > 0) {
        rowChildren.add(SizedBox(width: widget.gap));
      }
      final itemIndex = _currentIndex + i;
      if (itemIndex < _totalItems) {
        rowChildren.add(
          Expanded(
            child: _buildCard(itemIndex, height: cardHeight),
          ),
        );
      } else {
        rowChildren.add(
          Expanded(
            child: SizedBox(height: cardHeight),
          ),
        );
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Row(children: rowChildren),
            if (_totalItems > itemsCount)
              Positioned(
                left: 0,
                right: 0,
                top: (cardHeight - 48) / 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: CarouselControl(
                    onPrevious: canGoBack ? _onPrevious : null,
                    onNext: canGoForward ? _onNext : null,
                    canPrevious: canGoBack,
                    canNext: canGoForward,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 16),
        _buildBiography(isMobile: false),
      ],
    );
  }

  Widget _buildMobileLayout() {
    const mobileCardWidth = 272.0;
    const mobileCardHeight = 153.0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: mobileCardHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _totalItems,
            separatorBuilder: (_, index) => SizedBox(width: widget.gap),
            itemBuilder: (context, index) {
              return _buildCard(
                index,
                width: mobileCardWidth,
                height: mobileCardHeight,
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        _buildBiography(isMobile: true),
      ],
    );
  }

  Widget _buildBiography({required bool isMobile}) {
    if (widget.biographyWidget != null) return widget.biographyWidget!;

    return BiographyBlock(
      type: BiographyBlockType.tall,
      device: isMobile ? BiographyBlockDevice.mobile : BiographyBlockDevice.web,
      title: widget.title,
      titleWidget: widget.titleWidget,
      subtitle: widget.subtitle,
      subtitleWidget: widget.subtitleWidget,
      hasSubtitle: widget.hasSubtitle,
      description: widget.description ?? 'Description',
      hasDescription: widget.hasDescription,
      hasLogo: isMobile ? false : widget.hasLogo,
      logo: widget.logo,
      logoAssetPath: widget.logoAssetPath,
      logoWidget: widget.logoWidget,
      hasBadgeBar: isMobile ? false : widget.hasBadgeBar,
      hasBadgeOne: false,
      hasBadgeTwo: true,
      hasBadgeThree: true,
      badge2Label: (widget.badgeLabels != null && widget.badgeLabels!.isNotEmpty)
          ? widget.badgeLabels![0]
          : 'Label',
      badge3Label: (widget.badgeLabels != null && widget.badgeLabels!.length > 1)
          ? widget.badgeLabels![1]
          : 'Label',
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final availableWidth = widget.width ??
            (constraints.hasBoundedWidth ? constraints.maxWidth : 896.0);

        final ambientDevice = AlterDeviceScope.maybeOf(context);
        final bool isMobile;
        switch (widget.device) {
          case GraphicsCarouselBlockDevice.mobile:
            isMobile = true;
            break;
          case GraphicsCarouselBlockDevice.pc:
            isMobile = false;
            break;
          case GraphicsCarouselBlockDevice.auto:
            if (ambientDevice != null) {
              isMobile = ambientDevice == AlterDevice.mobile;
            } else {
              isMobile = availableWidth < widget.breakpoint;
            }
            break;
        }

        return Container(
          width: widget.width,
          constraints: BoxConstraints(
            maxWidth: isMobile ? 316.0 : 896.0,
          ),
          child: AlterDeviceScope(
            device: isMobile ? AlterDevice.mobile : AlterDevice.pc,
            child: isMobile
                ? _buildMobileLayout()
                : _buildPcLayout(availableWidth.clamp(316.0, 896.0)),
          ),
        );
      },
    );
  }
}
