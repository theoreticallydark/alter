import 'package:flutter/material.dart' hide Badge, Divider;
import '../../components/utilities/carousel_control.dart';
import '../../foundations/device_scope.dart';
import '../markers/bio_marker.dart';
import '../markers/mobile_marker.dart';

/// Target device / viewport modes for [MobileGrid].
enum MobileGridDevice {
  /// Automatically adapts based on parent width (< 600px triggers mobile layout) or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout (4-column grid or multi-item sliding carousel).
  pc,

  /// Forces Mobile layout (touch-friendly swipe carousel with viewport peek).
  mobile,
}

/// A responsive grid and carousel component for showcasing mobile screen mockups with associated entity metadata.
///
/// Figma Specifications (Node `810:10819` - `MobileGrid`):
/// - **PC Device Mode**:
///   - User controls container `width`; `height` is hug contents.
///   - Hosts 4 [MobileMarker] cards of variant `scale=Width` filling the width with 24px gaps.
///   - Each card height is auto-deduced based on the `428:926` aspect ratio.
///   - `isCarousel=False` (`810:10818`): Static 4-column row of 4 [MobileMarker] cards.
///   - `isCarousel=True` (`811:11752`): 4-card visible sliding carousel with [CarouselControl] chevrons.
///   - Bottom section: [BioMarker] (`type=Tall, device=Web`) with logo, title, subtitle, and badges.
/// - **Mobile Device Mode**:
///   - Regardless of [isCarousel] (true or false), always renders the single thumb-based scroll carousel (`810:10991`).
///   - Hosts [MobileMarker] cards of variant `scale=Height` (height 480px, width auto-deduced ~221.86px).
///   - Viewport peek cue via [mobileViewportFraction] (default ~`0.78`).
///   - Bottom section: [BioMarker] in mobile compact mode (`hasLogo: false`, `hasBadgeBar: false`).
class MobileGrid extends StatefulWidget {
  /// Component version for reference.
  /// v1.0.5: Added viewport-aware autoplay and configurable delay (default 1.2s) support via AlterMediaView.
  /// v1.0.4: Added videoUrls parameter for seamless multimedia video mockup lists across carousel and grid views.
  /// v1.0.3: Added ambient AlterDeviceScope propagation so child MobileMarkers and bottom BioMarker derive device mode directly from MobileGrid width.
  /// v1.0.2: Fixed PC non-carousel equal card heights by placing gap SizedBoxes between Expandeds, and made mobile layout dynamically hug the auto-deduced height of the mobile cards.
  /// v1.0.1: Standardized PC layout and unified Mobile layout.
  /// v1.0.0: Initial release matching Figma Node 810:10819.
  static const String version = '1.0.5';

  /// Viewport mode (`auto`, `pc`, or `mobile`).
  final MobileGridDevice device;

  /// Whether the items are presented in a horizontally sliding/swiping carousel or a static 4-column grid.
  final bool isCarousel;

  /// Optional fixed width constraint for the entire grid container.
  final double? width;

  /// Width threshold for auto-responsive switching between PC and Mobile layouts (defaults to 600.0).
  final double breakpoint;

  /// Spacing gap between mobile marker items (defaults to 24px per Figma).
  final double gap;

  /// Optional explicit height override of mobile containers in mobile carousel mode (defaults to null, which auto-deduces to hug card height).
  final double? mobileContainerHeight;

  /// Viewport fraction for mobile carousel swipe cue (defaults to 0.78, allowing the next card to peek into view).
  final double mobileViewportFraction;

  /// Number of items visible at once in PC carousel view (defaults to 4 per Figma).
  final int pcItemsPerView;

  /// List of image URLs for the mobile screen mockups.
  final List<String>? imageUrls;

  /// List of video URLs for autoplay looping video mockups.
  final List<String>? videoUrls;

  /// Whether video playback should only occur when the widget is visible in the viewport (defaults to true).
  final bool playInViewportOnly;

  /// Delay before video starts playing once entering the viewport (defaults to 1.2 seconds / 1200ms).
  final Duration autoPlayDelay;

  /// List of pre-constructed widgets to render as mobile screen cards.
  final List<Widget>? items;

  /// Total count of items when using [itemBuilder].
  final int? itemCount;

  /// Builder for generating items dynamically.
  final IndexedWidgetBuilder? itemBuilder;

  /// Callback when a mobile screen item is tapped.
  final ValueChanged<int>? onItemTap;

  // ==========================================
  // BioMarker Entity Metadata Properties
  // ==========================================

  /// Custom widget override for the bottom [BioMarker].
  final Widget? bioMarker;

  /// Title text for the entity metadata.
  final String title;

  /// Custom widget override for title.
  final Widget? titleWidget;

  /// Whether subtitle is displayed (defaults to true).
  final bool hasSubtitle;

  /// Subtitle descriptive text.
  final String subtitle;

  /// Custom widget override for subtitle.
  final Widget? subtitleWidget;

  /// Whether description is displayed (defaults to false).
  final bool hasDescription;

  /// Description body text.
  final String description;

  /// Custom widget override for description.
  final Widget? descriptionWidget;

  /// Whether the logo container is displayed. If null, automatically `true` on PC and `false` on Mobile per Figma.
  final bool? hasLogo;

  /// Image provider for the entity logo.
  final ImageProvider? logo;

  /// Custom widget override for the logo.
  final Widget? logoWidget;

  /// Custom asset path for the logo.
  final String? logoAssetPath;

  /// Callback executed when the logo is tapped.
  final VoidCallback? onLogoTap;

  /// Whether the badge bar is displayed. If null, automatically `true` on PC and `false` on Mobile per Figma.
  final bool? hasBadgeBar;

  /// Whether badge 1 is displayed.
  final bool hasBadgeOne;

  /// Label for badge 1.
  final String badge1Label;

  /// Whether badge 2 is displayed (defaults to true).
  final bool hasBadgeTwo;

  /// Label for badge 2.
  final String badge2Label;

  /// Whether badge 3 is displayed (defaults to true).
  final bool hasBadgeThree;

  /// Label for badge 3.
  final String badge3Label;

  /// Custom widget list for badge bar.
  final List<Widget>? badges;

  /// Creates a [MobileGrid] instance.
  const MobileGrid({
    super.key,
    this.device = MobileGridDevice.auto,
    this.isCarousel = false,
    this.width,
    this.breakpoint = 600.0,
    this.gap = 24.0,
    this.mobileContainerHeight,
    this.mobileViewportFraction = 0.78,
    this.pcItemsPerView = 4,
    this.imageUrls,
    this.videoUrls,
    this.playInViewportOnly = true,
    this.autoPlayDelay = const Duration(milliseconds: 1200),
    this.items,
    this.itemCount,
    this.itemBuilder,
    this.onItemTap,
    this.bioMarker,
    this.title = 'Title',
    this.titleWidget,
    this.hasSubtitle = true,
    this.subtitle = 'Subtitle',
    this.subtitleWidget,
    this.hasDescription = false,
    this.description = 'Description',
    this.descriptionWidget,
    this.hasLogo,
    this.logo,
    this.logoWidget,
    this.logoAssetPath,
    this.onLogoTap,
    this.hasBadgeBar,
    this.hasBadgeOne = false,
    this.badge1Label = 'Label',
    this.hasBadgeTwo = true,
    this.badge2Label = 'Label',
    this.hasBadgeThree = true,
    this.badge3Label = 'Label',
    this.badges,
  });

  /// Convenience builder constructor for dynamic list rendering.
  const MobileGrid.builder({
    super.key,
    this.device = MobileGridDevice.auto,
    this.isCarousel = false,
    this.width,
    this.breakpoint = 600.0,
    this.gap = 24.0,
    this.mobileContainerHeight,
    this.mobileViewportFraction = 0.78,
    this.pcItemsPerView = 4,
    this.playInViewportOnly = true,
    this.autoPlayDelay = const Duration(milliseconds: 1200),
    required int count,
    required IndexedWidgetBuilder builder,
    this.onItemTap,
    this.bioMarker,
    this.title = 'Title',
    this.titleWidget,
    this.hasSubtitle = true,
    this.subtitle = 'Subtitle',
    this.subtitleWidget,
    this.hasDescription = false,
    this.description = 'Description',
    this.descriptionWidget,
    this.hasLogo,
    this.logo,
    this.logoWidget,
    this.logoAssetPath,
    this.onLogoTap,
    this.hasBadgeBar,
    this.hasBadgeOne = false,
    this.badge1Label = 'Label',
    this.hasBadgeTwo = true,
    this.badge2Label = 'Label',
    this.hasBadgeThree = true,
    this.badge3Label = 'Label',
    this.badges,
  })  : imageUrls = null,
        videoUrls = null,
        items = null,
        itemCount = count,
        itemBuilder = builder;

  @override
  State<MobileGrid> createState() => _MobileGridState();
}

class _MobileGridState extends State<MobileGrid> {
  late final PageController _mobilePageController;
  late final ScrollController _pcScrollController;
  int _currentPcIndex = 0;

  @override
  void initState() {
    super.initState();
    _mobilePageController = PageController(
      viewportFraction: widget.mobileViewportFraction,
    );
    _pcScrollController = ScrollController();
  }

  @override
  void didUpdateWidget(covariant MobileGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.mobileViewportFraction != widget.mobileViewportFraction) {
      _mobilePageController.dispose();
      _mobilePageController = PageController(
        viewportFraction: widget.mobileViewportFraction,
      );
    }
  }

  @override
  void dispose() {
    _mobilePageController.dispose();
    _pcScrollController.dispose();
    super.dispose();
  }

  int get _rawItemCount {
    if (widget.videoUrls != null) return widget.videoUrls!.length;
    if (widget.imageUrls != null) return widget.imageUrls!.length;
    if (widget.items != null) return widget.items!.length;
    if (widget.itemCount != null) return widget.itemCount!;
    return 0;
  }

  int _getEffectiveItemCount(bool isPc) {
    final raw = _rawItemCount;
    // On PC when isCarousel is False, count is strictly fixed at 4 per Figma spec (810:10818)
    if (isPc && !widget.isCarousel) {
      return 4;
    }
    return raw > 0 ? raw : 4;
  }

  Widget _buildItemCard(BuildContext context, int index, bool isPc) {
    if (widget.items != null && index < widget.items!.length) {
      return widget.items![index];
    }
    if (widget.itemBuilder != null && widget.itemCount != null && index < widget.itemCount!) {
      return widget.itemBuilder!(context, index);
    }

    String? imageUrl;
    if (widget.imageUrls != null && widget.imageUrls!.isNotEmpty) {
      imageUrl = widget.imageUrls![index % widget.imageUrls!.length];
    }

    String? videoUrl;
    if (widget.videoUrls != null && widget.videoUrls!.isNotEmpty) {
      videoUrl = widget.videoUrls![index % widget.videoUrls!.length];
    }

    return MobileMarker(
      scale: MobileMarkerScale.width,
      imageUrl: imageUrl,
      videoUrl: videoUrl,
      playInViewportOnly: widget.playInViewportOnly,
      autoPlayDelay: widget.autoPlayDelay,
      hasBioMarker: false,
      onImageTap: () => widget.onItemTap?.call(index),
    );
  }

  void _scrollToPcIndex(int newIndex, double itemWidthWithGap) {
    final totalCount = _getEffectiveItemCount(true);
    final maxIndex = (totalCount - widget.pcItemsPerView).clamp(0, totalCount);
    final targetIndex = newIndex.clamp(0, maxIndex);
    setState(() {
      _currentPcIndex = targetIndex;
    });
    if (_pcScrollController.hasClients) {
      _pcScrollController.animateTo(
        targetIndex * itemWidthWithGap,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Widget _buildPcLayout(BuildContext context, double width) {
    final int totalCount = _getEffectiveItemCount(true);
    final int columns = widget.pcItemsPerView;
    final double totalGaps = (columns - 1) * widget.gap;
    final double itemWidth = (width - totalGaps) / columns;
    final double itemWidthWithGap = itemWidth + widget.gap;

    final bool showControls = widget.isCarousel && totalCount > columns;
    final bool canPrev = _currentPcIndex > 0;
    final bool canNext = _currentPcIndex < (totalCount - columns);

    final carouselPosition = canPrev && canNext
        ? CarouselControlPosition.middle
        : canPrev
            ? CarouselControlPosition.end
            : CarouselControlPosition.start;

    final mediaSection = widget.isCarousel
        ? Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: (itemWidth / (428 / 926)),
                child: ListView.separated(
                  controller: _pcScrollController,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: totalCount,
                  separatorBuilder: (context, index) => SizedBox(width: widget.gap),
                  itemBuilder: (context, index) {
                    return SizedBox(
                      width: itemWidth,
                      child: _buildItemCard(context, index, true),
                    );
                  },
                ),
              ),
              if (showControls)
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: CarouselControl(
                      position: carouselPosition,
                      onPrevious: canPrev
                          ? () => _scrollToPcIndex(_currentPcIndex - 1, itemWidthWithGap)
                          : null,
                      onNext: canNext
                          ? () => _scrollToPcIndex(_currentPcIndex + 1, itemWidthWithGap)
                          : null,
                    ),
                  ),
                ),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int index = 0; index < 4; index++) ...[
                if (index > 0) SizedBox(width: widget.gap),
                Expanded(
                  child: _buildItemCard(context, index, true),
                ),
              ],
            ],
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        mediaSection,
        const SizedBox(height: 16),
        _buildBioMarker(context, isPc: true),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, double parentWidth) {
    final int totalCount = _getEffectiveItemCount(false);
    final double cardWidth = (parentWidth * widget.mobileViewportFraction - widget.gap).clamp(50.0, parentWidth);
    final double containerHeight = widget.mobileContainerHeight ?? (cardWidth / (428 / 926));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: containerHeight,
          child: PageView.builder(
            controller: _mobilePageController,
            padEnds: false,
            physics: const BouncingScrollPhysics(),
            itemCount: totalCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: widget.gap),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: cardWidth,
                    height: containerHeight,
                    child: _buildItemCard(context, index, false),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        _buildBioMarker(context, isPc: false),
      ],
    );
  }

  Widget _buildBioMarker(BuildContext context, {required bool isPc}) {
    if (widget.bioMarker != null) {
      return widget.bioMarker!;
    }

    final effectiveHasLogo = widget.hasLogo ?? isPc;
    final effectiveHasBadgeBar = widget.hasBadgeBar ?? isPc;

    return BioMarker(
      type: isPc ? BioMarkerType.tall : BioMarkerType.tall,
      device: isPc ? BioMarkerDevice.web : BioMarkerDevice.mobile,
      title: widget.title,
      titleWidget: widget.titleWidget,
      hasSubtitle: widget.hasSubtitle,
      subtitle: widget.subtitle,
      subtitleWidget: widget.subtitleWidget,
      hasDescription: widget.hasDescription,
      description: widget.description,
      descriptionWidget: widget.descriptionWidget,
      hasLogo: effectiveHasLogo,
      logo: widget.logo,
      logoWidget: widget.logoWidget,
      logoAssetPath: widget.logoAssetPath,
      onLogoTap: widget.onLogoTap,
      hasBadgeBar: effectiveHasBadgeBar,
      hasBadgeOne: widget.hasBadgeOne,
      badge1Label: widget.badge1Label,
      hasBadgeTwo: widget.hasBadgeTwo,
      badge2Label: widget.badge2Label,
      hasBadgeThree: widget.hasBadgeThree,
      badge3Label: widget.badge3Label,
      badges: widget.badges,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double parentWidth = constraints.maxWidth;
        final double targetWidth = widget.width ?? parentWidth;

        final bool isPc = switch (widget.device) {
          MobileGridDevice.auto => targetWidth >= widget.breakpoint,
          MobileGridDevice.pc => true,
          MobileGridDevice.mobile => false,
        };

        final Widget content = isPc
            ? _buildPcLayout(context, targetWidth)
            : _buildMobileLayout(context, targetWidth);

        final Widget wrappedContent = AlterDeviceScope(
          device: isPc ? AlterDevice.pc : AlterDevice.mobile,
          child: content,
        );

        return SizedBox(
          width: widget.width,
          child: wrappedContent,
        );
      },
    );
  }
}
