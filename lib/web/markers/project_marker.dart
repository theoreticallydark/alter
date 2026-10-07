import 'dart:ui';
import 'package:flutter/material.dart' hide Badge, Divider;
import 'package:video_player/video_player.dart';
import '../../components/utilities/alter_media_view.dart';
import '../../components/utilities/carousel_control.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import 'bio_marker.dart';

/// Target device / viewport modes for [ProjectMarker].
enum ProjectMarkerDevice {
  /// Automatically responds to layout constraints or inherits ambient [AlterDeviceScope] from parent grid.
  auto,

  /// Forces PC / Desktop layout with multi-column carousel or full-width banner and expanded BioMarker.
  pc,

  /// Forces Mobile layout with thumb-swipeable peek carousel or compact banner and compact BioMarker.
  mobile,
}

/// A responsive project and portfolio card molecule combining banner media / carousel and an entity [BioMarker].
///
/// Figma Specifications (Node `795:6004` - `ProjectMarker`):
/// - Variants:
///   - `device=PC, isCarousel=False` (`795:3760`): Single 16:9 banner media + BioMarker with logo and badge bar.
///   - `device=Mobile, isCarousel=False` (`795:6005`): Single 16:9 banner media + compact BioMarker (no logo, no badge bar).
///   - `device=PC, isCarousel=True` (`813:12021`): Multi-column side-by-side carousel with smooth animated sliding and [CarouselControl] overlay.
///   - `device=Mobile, isCarousel=True` (`819:2595`): Thumb-swipeable carousel with peek cue (default ~86% viewport fraction) without chevrons.
/// - Multimedia Support:
///   - Supports Images, animated GIFs, and muted looping autoplay Videos without controllers across single media and carousel modes.
/// - Sizing:
///   - Width: Fills available container width (or constrained by optional [width]).
///   - Height: Hugs content (`MainAxisSize.min`).
///   - Media container aspect ratio: 16 / 9 for images/videos with 20px radius and 2px `#F3F4F6` border.
/// - Child components:
///   - Reuses [BioMarker] (`761:7097`) for metadata, title, subtitle, and badges.
///   - Reuses [CarouselControl] (`811:11843`) for carousel navigation buttons on PC.
///   - Reuses [AlterMediaView] for all multimedia rendering.
class ProjectMarker extends StatefulWidget {
  /// Component version for reference.
  /// v1.4.0: Added viewport-aware autoplay and configurable delay (default 1.2s) support via AlterMediaView.
  /// v1.3.0: Added native multimedia support for animated GIFs and autoplay looping videos without controllers via AlterMediaView across both single media and carousel modes.
  /// v1.2.2: Added ambient AlterDeviceScope inheritance so ProjectMarker derives device mode directly from parent ProjectGrid without judging its own narrow cell width, and propagates device mode to BioMarker.
  /// v1.2.1: Adjusted auto-responsive breakpoint to 380.0 (and made configurable via breakpoint property).
  /// v1.2.0: Implemented smooth hardware-accelerated animated sliding for PC carousel navigation via ScrollController with easeInOutCubic curve.
  /// v1.1.0: Added configurable pcItemsPerView (default 2), mobileViewportFraction (default 0.86 with peek cue), and native touch-first PageView for mobile carousels.
  /// v1.0.0: Initial release matching Figma Node 795:6004 (ProjectMarker: PC/Mobile, Single/Carousel variants).
  static const String version = '1.4.0';

  /// Optional fixed width for the overall [ProjectMarker] (defaults to fill available parent width).
  final double? width;

  /// Viewport mode (`auto` responsive, `pc`, or `mobile`).
  final ProjectMarkerDevice device;

  /// Viewport width breakpoint below which mobile layout is activated (defaults to 380.0).
  final double breakpoint;

  /// Whether the media section operates in carousel mode.
  final bool isCarousel;

  /// Number of simultaneous cards visible in PC carousel mode (defaults to 2 per Figma, configurable to 3, etc.).
  final int pcItemsPerView;

  /// Viewport fraction occupied by the active card in mobile carousel mode (defaults to 0.86 for 44px peek cue per Figma).
  final double mobileViewportFraction;

  /// Spacing gap between adjacent media items in carousel mode (defaults to 24px).
  final double carouselGap;

  /// Duration of the sliding animation on PC carousel navigation (defaults to 350ms).
  final Duration animationDuration;

  /// Animation curve for PC carousel sliding (defaults to [Curves.easeInOutCubic]).
  final Curve animationCurve;

  /// Single image provider (used when [isCarousel] is `false` or as fallback).
  final ImageProvider? image;

  /// Convenience URL string for a single network image or animated GIF.
  final String? imageUrl;

  /// Custom asset path for a single banner image or GIF.
  final String? imageAssetPath;

  /// Network URL for single banner video.
  final String? videoUrl;

  /// Custom asset path for single banner video.
  final String? videoAssetPath;

  /// Optional pre-configured [VideoPlayerController] instance for single banner.
  final VideoPlayerController? videoController;

  /// Whether video should start playing automatically (defaults to true).
  final bool autoPlay;

  /// Whether video playback should only occur when the widget is visible in the viewport (defaults to true).
  final bool playInViewportOnly;

  /// Delay before video starts playing once entering the viewport (defaults to 1.2 seconds / 1200ms).
  final Duration autoPlayDelay;

  /// Whether video should loop infinitely (defaults to true).
  final bool loop;

  /// Whether video is muted (defaults to true for web autoplay compliance).
  final bool isMuted;

  /// Custom widget override for single banner media.
  final Widget? imageWidget;

  /// List of image providers for carousel mode.
  final List<ImageProvider>? carouselImages;

  /// List of image URLs for carousel mode.
  final List<String>? carouselImageUrls;

  /// List of asset paths for carousel mode.
  final List<String>? carouselImageAssetPaths;

  /// List of video URLs for carousel mode.
  final List<String>? carouselVideoUrls;

  /// List of video asset paths for carousel mode.
  final List<String>? carouselVideoAssetPaths;

  /// List of pre-configured [AlterMediaView] items for carousel mode.
  final List<AlterMediaView>? carouselMediaViews;

  /// Custom widget items for carousel mode.
  final List<Widget>? carouselItems;

  /// Active carousel page index.
  final int carouselIndex;

  /// Callback triggered when carousel page index changes.
  final ValueChanged<int>? onCarouselIndexChanged;

  /// Callback for previous slide action.
  final VoidCallback? onPrevious;

  /// Callback for next slide action.
  final VoidCallback? onNext;

  /// Aspect ratio for banner images/videos (defaults to 16 / 9).
  final double aspectRatio;

  /// Corner radius of the banner media container (defaults to 20px).
  final BorderRadius? imageBorderRadius;

  /// Callback executed when the banner media is tapped.
  final ValueChanged<int>? onImageTap;

  // ==========================================
  // BioMarker Properties
  // ==========================================

  /// Main entity title text.
  final String title;

  /// Custom widget override for title.
  final Widget? titleWidget;

  /// Whether subtitle is displayed.
  final bool hasSubtitle;

  /// Subtitle descriptive text.
  final String subtitle;

  /// Custom widget override for subtitle.
  final Widget? subtitleWidget;

  /// Explicit control for entity logo visibility (defaults to `true` on PC, `false` on Mobile).
  final bool? hasLogo;

  /// Image provider for the entity logo.
  final ImageProvider? logo;

  /// Custom widget override for the logo.
  final Widget? logoWidget;

  /// Custom asset path for the logo.
  final String? logoAssetPath;

  /// Callback executed when the logo is tapped.
  final VoidCallback? onLogoTap;

  /// Explicit control for badge bar visibility (defaults to `true` on PC, `false` on Mobile).
  final bool? hasBadgeBar;

  /// Whether badge 1 is displayed.
  final bool hasBadgeOne;

  /// Label for badge 1.
  final String badgeOneLabel;

  /// Custom widget override for badge 1.
  final Widget? badgeOneWidget;

  /// Whether badge 2 is displayed (defaults to `true`).
  final bool hasBadgeTwo;

  /// Label for badge 2.
  final String badgeTwoLabel;

  /// Custom widget override for badge 2.
  final Widget? badgeTwoWidget;

  /// Whether badge 3 is displayed (defaults to `true`).
  final bool hasBadgeThree;

  /// Label for badge 3.
  final String badgeThreeLabel;

  /// Custom widget override for badge 3.
  final Widget? badgeThreeWidget;

  /// Custom widget list for badge bar.
  final List<Widget>? badges;

  /// Whether description text is displayed.
  final bool hasDescription;

  /// Description text.
  final String description;

  /// Custom widget override for description.
  final Widget? descriptionWidget;

  /// Creates a [ProjectMarker] instance.
  const ProjectMarker({
    super.key,
    this.width,
    this.device = ProjectMarkerDevice.auto,
    this.breakpoint = 380.0,
    this.isCarousel = false,
    this.pcItemsPerView = 2,
    this.mobileViewportFraction = 0.86,
    this.carouselGap = 24.0,
    this.animationDuration = const Duration(milliseconds: 350),
    this.animationCurve = Curves.easeInOutCubic,
    this.image,
    this.imageUrl,
    this.imageAssetPath,
    this.videoUrl,
    this.videoAssetPath,
    this.videoController,
    this.autoPlay = true,
    this.playInViewportOnly = true,
    this.autoPlayDelay = const Duration(milliseconds: 1200),
    this.loop = true,
    this.isMuted = true,
    this.imageWidget,
    this.carouselImages,
    this.carouselImageUrls,
    this.carouselImageAssetPaths,
    this.carouselVideoUrls,
    this.carouselVideoAssetPaths,
    this.carouselMediaViews,
    this.carouselItems,
    this.carouselIndex = 0,
    this.onCarouselIndexChanged,
    this.onPrevious,
    this.onNext,
    this.aspectRatio = 16 / 9,
    this.imageBorderRadius,
    this.onImageTap,
    this.title = 'Title',
    this.titleWidget,
    this.hasSubtitle = true,
    this.subtitle = 'Subtitle',
    this.subtitleWidget,
    this.hasLogo,
    this.logo,
    this.logoWidget,
    this.logoAssetPath,
    this.onLogoTap,
    this.hasBadgeBar,
    this.hasBadgeOne = false,
    this.badgeOneLabel = 'Label',
    this.badgeOneWidget,
    this.hasBadgeTwo = true,
    this.badgeTwoLabel = 'Label',
    this.badgeTwoWidget,
    this.hasBadgeThree = true,
    this.badgeThreeLabel = 'Label',
    this.badgeThreeWidget,
    this.badges,
    this.hasDescription = false,
    this.description = 'Description',
    this.descriptionWidget,
  }) : assert(pcItemsPerView >= 1, 'pcItemsPerView must be at least 1');

  @override
  State<ProjectMarker> createState() => _ProjectMarkerState();
}

class _ProjectMarkerState extends State<ProjectMarker> {
  late int _currentIndex;
  ScrollController? _pcScrollController;
  PageController? _mobilePageController;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.carouselIndex;
    _initControllers();
  }

  void _initControllers() {
    _pcScrollController = ScrollController();
    _mobilePageController = PageController(
      initialPage: _currentIndex,
      viewportFraction: widget.mobileViewportFraction.clamp(0.1, 1.0),
    );
  }

  @override
  void didUpdateWidget(covariant ProjectMarker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.carouselIndex != widget.carouselIndex) {
      _currentIndex = widget.carouselIndex;
      if (_mobilePageController?.hasClients == true) {
        _mobilePageController!.jumpToPage(_currentIndex);
      }
    }
    if (oldWidget.mobileViewportFraction != widget.mobileViewportFraction) {
      _mobilePageController?.dispose();
      _mobilePageController = PageController(
        initialPage: _currentIndex,
        viewportFraction: widget.mobileViewportFraction.clamp(0.1, 1.0),
      );
    }
  }

  @override
  void dispose() {
    _pcScrollController?.dispose();
    _mobilePageController?.dispose();
    super.dispose();
  }

  List<Widget> _resolvedMediaItems() {
    if (widget.carouselItems != null && widget.carouselItems!.isNotEmpty) {
      return widget.carouselItems!;
    }
    if (widget.carouselMediaViews != null && widget.carouselMediaViews!.isNotEmpty) {
      return widget.carouselMediaViews!
          .map((mv) => _buildMediaFrame(mv))
          .toList();
    }
    if (widget.carouselVideoUrls != null && widget.carouselVideoUrls!.isNotEmpty) {
      return widget.carouselVideoUrls!
          .map((url) => _buildMediaFrame(AlterMediaView(
                url: url,
                mediaType: AlterMediaType.video,
                autoPlay: widget.autoPlay,
                playInViewportOnly: widget.playInViewportOnly,
                autoPlayDelay: widget.autoPlayDelay,
                loop: widget.loop,
                isMuted: widget.isMuted,
              )))
          .toList();
    }
    if (widget.carouselVideoAssetPaths != null && widget.carouselVideoAssetPaths!.isNotEmpty) {
      return widget.carouselVideoAssetPaths!
          .map((path) => _buildMediaFrame(AlterMediaView(
                assetPath: path,
                mediaType: AlterMediaType.video,
                autoPlay: widget.autoPlay,
                playInViewportOnly: widget.playInViewportOnly,
                autoPlayDelay: widget.autoPlayDelay,
                loop: widget.loop,
                isMuted: widget.isMuted,
              )))
          .toList();
    }
    if (widget.carouselImageUrls != null && widget.carouselImageUrls!.isNotEmpty) {
      return widget.carouselImageUrls!
          .map((url) => _buildMediaFrame(AlterMediaView(
                url: url,
                autoPlay: widget.autoPlay,
                playInViewportOnly: widget.playInViewportOnly,
                autoPlayDelay: widget.autoPlayDelay,
                loop: widget.loop,
                isMuted: widget.isMuted,
              )))
          .toList();
    }
    if (widget.carouselImages != null && widget.carouselImages!.isNotEmpty) {
      return widget.carouselImages!
          .map((img) => _buildMediaFrame(AlterMediaView(
                image: img,
                autoPlay: widget.autoPlay,
                playInViewportOnly: widget.playInViewportOnly,
                autoPlayDelay: widget.autoPlayDelay,
                loop: widget.loop,
                isMuted: widget.isMuted,
              )))
          .toList();
    }
    if (widget.carouselImageAssetPaths != null && widget.carouselImageAssetPaths!.isNotEmpty) {
      return widget.carouselImageAssetPaths!
          .map((path) => _buildMediaFrame(AlterMediaView(
                assetPath: path,
                autoPlay: widget.autoPlay,
                playInViewportOnly: widget.playInViewportOnly,
                autoPlayDelay: widget.autoPlayDelay,
                loop: widget.loop,
                isMuted: widget.isMuted,
              )))
          .toList();
    }

    // Fallback single item
    return [_buildSingleImage()];
  }

  Widget _buildSingleImage() {
    final mediaContent = AlterMediaView(
      image: widget.image,
      url: widget.videoUrl ?? widget.imageUrl,
      assetPath: widget.videoAssetPath ?? widget.imageAssetPath,
      videoController: widget.videoController,
      customWidget: widget.imageWidget,
      autoPlay: widget.autoPlay,
      playInViewportOnly: widget.playInViewportOnly,
      autoPlayDelay: widget.autoPlayDelay,
      loop: widget.loop,
      isMuted: widget.isMuted,
    );

    return _buildMediaFrame(mediaContent);
  }

  Widget _buildMediaFrame(Widget mediaChild) {
    final radius = widget.imageBorderRadius ?? BorderRadius.circular(20.0);
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: AlterSemanticTokens.stroke100,
          width: 2.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18.0),
        child: mediaChild,
      ),
    );
  }

  void _animateToPcIndex(double itemStride) {
    if (_pcScrollController?.hasClients == true) {
      final maxScroll = _pcScrollController!.position.maxScrollExtent;
      final targetOffset = (_currentIndex * itemStride).clamp(0.0, maxScroll);
      _pcScrollController!.animateTo(
        targetOffset,
        duration: widget.animationDuration,
        curve: widget.animationCurve,
      );
    }
  }

  void _handlePrevious(int totalCount, int visibleCount, double itemStride) {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
      });
      _animateToPcIndex(itemStride);
      widget.onCarouselIndexChanged?.call(_currentIndex);
    }
    widget.onPrevious?.call();
  }

  void _handleNext(int totalCount, int visibleCount, double itemStride) {
    final maxIndex = (totalCount - visibleCount).clamp(0, totalCount);
    if (_currentIndex < maxIndex) {
      setState(() {
        _currentIndex++;
      });
      _animateToPcIndex(itemStride);
      widget.onCarouselIndexChanged?.call(_currentIndex);
    }
    widget.onNext?.call();
  }

  Widget _buildCarouselSection(bool isPc, double containerWidth) {
    final items = _resolvedMediaItems();
    final totalCount = items.length;

    if (isPc) {
      final visibleCount = widget.pcItemsPerView.clamp(1, totalCount > 0 ? totalCount : 1);
      final maxIndex = (totalCount - visibleCount).clamp(0, totalCount);

      final canPrevious = _currentIndex > 0;
      final canNext = _currentIndex < maxIndex;

      CarouselControlPosition position;
      if (!canPrevious && canNext) {
        position = CarouselControlPosition.start;
      } else if (canPrevious && !canNext) {
        position = CarouselControlPosition.end;
      } else {
        position = CarouselControlPosition.middle;
      }

      final totalGaps = (visibleCount - 1) * widget.carouselGap;
      final cardWidth = (containerWidth - totalGaps) / visibleCount;
      final cardHeight = cardWidth / widget.aspectRatio;
      final itemStride = cardWidth + widget.carouselGap;

      final track = SizedBox(
        height: cardHeight,
        child: SingleChildScrollView(
          controller: _pcScrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < totalCount; i++) ...[
                if (i > 0) SizedBox(width: widget.carouselGap),
                SizedBox(
                  width: cardWidth,
                  height: cardHeight,
                  child: GestureDetector(
                    onTap: () => widget.onImageTap?.call(i),
                    child: items[i],
                  ),
                ),
              ],
            ],
          ),
        ),
      );

      return Stack(
        alignment: Alignment.center,
        children: [
          track,
          if (totalCount > visibleCount)
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: CarouselControl(
                  position: position,
                  canPrevious: canPrevious,
                  canNext: canNext,
                  onPrevious: () => _handlePrevious(totalCount, visibleCount, itemStride),
                  onNext: () => _handleNext(totalCount, visibleCount, itemStride),
                ),
              ),
            ),
        ],
      );
    } else {
      // Mobile: Touch-first swipeable PageView with peek cue
      final fraction = widget.mobileViewportFraction.clamp(0.1, 1.0);
      final cardWidth = containerWidth * fraction;
      final cardHeight = cardWidth / widget.aspectRatio;

      return SizedBox(
        height: cardHeight,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.stylus,
            },
          ),
          child: PageView.builder(
            controller: _mobilePageController,
            itemCount: totalCount,
            padEnds: false,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
              widget.onCarouselIndexChanged?.call(index);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(
                  right: index == totalCount - 1 ? 0.0 : widget.carouselGap / 2,
                ),
                child: GestureDetector(
                  onTap: () => widget.onImageTap?.call(index),
                  child: items[index],
                ),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double parentWidth = constraints.maxWidth;
        final double targetWidth = widget.width ?? parentWidth;
        final ambient = AlterDeviceScope.maybeOf(context);

        final bool isPc = switch (widget.device) {
          ProjectMarkerDevice.auto => ambient != null
              ? ambient == AlterDevice.pc
              : targetWidth >= widget.breakpoint,
          ProjectMarkerDevice.pc => true,
          ProjectMarkerDevice.mobile => false,
        };

        final effectiveHasLogo = widget.hasLogo ?? isPc;
        final effectiveHasBadgeBar = widget.hasBadgeBar ?? isPc;

        final Widget mediaSection = widget.isCarousel
            ? _buildCarouselSection(isPc, targetWidth)
            : AspectRatio(
                aspectRatio: widget.aspectRatio,
                child: GestureDetector(
                  onTap: () => widget.onImageTap?.call(0),
                  child: _buildSingleImage(),
                ),
              );

        final Widget bioSection = BioMarker(
          type: BioMarkerType.tall,
          device: isPc ? BioMarkerDevice.web : BioMarkerDevice.mobile,
          title: widget.title,
          titleWidget: widget.titleWidget,
          hasSubtitle: widget.hasSubtitle,
          subtitle: widget.subtitle,
          subtitleWidget: widget.subtitleWidget,
          hasLogo: effectiveHasLogo,
          logo: widget.logo,
          logoWidget: widget.logoWidget,
          logoAssetPath: widget.logoAssetPath,
          onLogoTap: widget.onLogoTap,
          hasBadgeBar: effectiveHasBadgeBar,
          hasBadgeOne: widget.hasBadgeOne,
          badge1Label: widget.badgeOneLabel,
          hasBadgeTwo: widget.hasBadgeTwo,
          badge2Label: widget.badgeTwoLabel,
          hasBadgeThree: widget.hasBadgeThree,
          badge3Label: widget.badgeThreeLabel,
          badges: widget.badges,
          hasDescription: widget.hasDescription,
          description: widget.description,
          descriptionWidget: widget.descriptionWidget,
        );

        final cardContent = AlterDeviceScope(
          device: isPc ? AlterDevice.pc : AlterDevice.mobile,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              mediaSection,
              const SizedBox(height: 16.0),
              bioSection,
            ],
          ),
        );

        if (widget.width != null) {
          return SizedBox(
            width: widget.width,
            child: cardContent,
          );
        }

        return cardContent;
      },
    );
  }
}
