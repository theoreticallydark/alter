import 'package:flutter/material.dart' hide Badge, Divider;
import 'package:video_player/video_player.dart';
import '../../components/utilities/alter_media_view.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import 'bio_marker.dart';

/// Sizing scale mode for [MobileMarker].
enum MobileMarkerScale {
  /// Width is explicitly constrained/filled; height is auto-deduced from the 428:926 aspect ratio.
  width,

  /// Height is explicitly constrained; width is auto-deduced from the 428:926 aspect ratio.
  height,
}

/// Target device / viewport modes for [MobileMarker].
enum MobileMarkerDevice {
  /// Automatically responds to layout constraints or inherits ambient [AlterDeviceScope] from parent grid.
  auto,

  /// Forces PC / Desktop layout with expanded BioMarker (logo and badge bar).
  pc,

  /// Forces Mobile layout with compact BioMarker.
  mobile,
}

/// A responsive mobile screen showcase and entity card combining an iPhone 14 Plus container (428:926) with an optional [BioMarker].
///
/// Figma Specifications (Node `810:10719` - `MobileMarker`):
/// - Variants:
///   - `scale=Width` (`810:10718`): Width is controlled; height is auto-deduced and hugs content.
///   - `scale=Height` (`810:10720`): Height is controlled; width is auto-deduced and hugs content.
/// - Multimedia Support:
///   - Supports Images, animated GIFs, and muted looping autoplay Videos without controllers rendered via [AlterMediaView].
/// - Sizing & Media Container:
///   - Aspect Ratio: `428 / 926` (iPhone 14 Plus screen ratio ~0.4622).
///   - Border: 1px `#F3F4F6` ([AlterSemanticTokens.stroke100]).
///   - Border Radius: 20px (`BorderRadius.circular(20)`).
/// - Bottom Section:
///   - Optional [BioMarker] (`761:7097`) toggled by [hasBioMarker] (default `true`).
///   - Spacing gap: 16px.
class MobileMarker extends StatelessWidget {
  /// Component version for reference.
  /// v1.2.0: Added viewport-aware autoplay and configurable delay (default 1.2s) support via AlterMediaView.
  /// v1.1.0: Added native multimedia support for animated GIFs and autoplay looping videos without controllers via AlterMediaView.
  /// v1.0.1: Added device parameter and AlterDeviceScope inheritance so MobileMarker and its BioMarker derive device mode directly from parent grids.
  /// v1.0.0: Initial release matching Figma Node 810:10719 (MobileMarker: scale=Width/Height, iPhone 14 Plus 428:926 container + BioMarker).
  static const String version = '1.2.0';

  /// Scale mode: whether width or height drives the auto-deduced sizing.
  final MobileMarkerScale scale;

  /// Viewport device mode (`auto`, `pc`, or `mobile`).
  final MobileMarkerDevice device;

  /// Explicit width constraint when [scale] is [MobileMarkerScale.width] (defaults to fill available width).
  final double? width;

  /// Explicit height constraint when [scale] is [MobileMarkerScale.height] (defaults to 692.34px per Figma).
  final double? height;

  /// Aspect ratio of the mobile container (defaults to `428 / 926`).
  final double aspectRatio;

  /// Image provider for the mobile mockup screen.
  final ImageProvider? image;

  /// Convenience URL string for network mockup images or animated GIFs.
  final String? imageUrl;

  /// Custom asset path for mockup image.
  final String? imageAssetPath;

  /// Network URL for autoplay video inside the mobile screen mockup.
  final String? videoUrl;

  /// Custom asset path for autoplay video inside the mobile screen mockup.
  final String? videoAssetPath;

  /// Optional pre-configured [VideoPlayerController] instance.
  final VideoPlayerController? videoController;

  /// Whether video should start playing automatically (defaults to true).
  final bool autoPlay;

  /// Whether video playback should only occur when the widget is visible in the viewport (defaults to true).
  final bool playInViewportOnly;

  /// Delay before video starts playing once entering the viewport (defaults to 1.2 seconds / 1200ms).
  final Duration autoPlayDelay;

  /// Whether video should loop infinitely (defaults to true).
  final bool loop;

  /// Whether video is muted (defaults to true).
  final bool isMuted;

  /// Custom widget override for the mockup screen container.
  final Widget? imageWidget;

  /// Corner radius of the mobile container (defaults to 20px).
  final BorderRadius? imageBorderRadius;

  /// Callback executed when the mobile mockup is tapped.
  final VoidCallback? onImageTap;

  /// Whether the [BioMarker] is displayed below the mobile container.
  final bool hasBioMarker;

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

  /// Whether description is displayed.
  final bool hasDescription;

  /// Description body text.
  final String description;

  /// Custom widget override for description.
  final Widget? descriptionWidget;

  /// Whether the logo container is displayed.
  final bool hasLogo;

  /// Image provider for the entity logo.
  final ImageProvider? logo;

  /// Custom widget override for the logo.
  final Widget? logoWidget;

  /// Custom asset path for the logo.
  final String? logoAssetPath;

  /// Callback executed when the logo is tapped.
  final VoidCallback? onLogoTap;

  /// Whether the badge bar is displayed.
  final bool hasBadgeBar;

  /// Whether badge 1 is displayed.
  final bool hasBadgeOne;

  /// Label for badge 1.
  final String badge1Label;

  /// Whether badge 2 is displayed.
  final bool hasBadgeTwo;

  /// Label for badge 2.
  final String badge2Label;

  /// Whether badge 3 is displayed.
  final bool hasBadgeThree;

  /// Label for badge 3.
  final String badge3Label;

  /// Custom widget list for badge bar.
  final List<Widget>? badges;

  /// Creates a [MobileMarker] instance.
  const MobileMarker({
    super.key,
    this.scale = MobileMarkerScale.width,
    this.device = MobileMarkerDevice.auto,
    this.width,
    this.height,
    this.aspectRatio = 428 / 926,
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
    this.imageBorderRadius,
    this.onImageTap,
    this.hasBioMarker = true,
    this.title = 'Title',
    this.titleWidget,
    this.hasSubtitle = true,
    this.subtitle = 'Subtitle',
    this.subtitleWidget,
    this.hasDescription = false,
    this.description = 'Description',
    this.descriptionWidget,
    this.hasLogo = false,
    this.logo,
    this.logoWidget,
    this.logoAssetPath,
    this.onLogoTap,
    this.hasBadgeBar = false,
    this.hasBadgeOne = false,
    this.badge1Label = 'Label',
    this.hasBadgeTwo = false,
    this.badge2Label = 'Label',
    this.hasBadgeThree = false,
    this.badge3Label = 'Label',
    this.badges,
  });

  Widget _buildMockupContainer() {
    final mediaContent = AlterMediaView(
      image: image,
      url: videoUrl ?? imageUrl,
      assetPath: videoAssetPath ?? imageAssetPath,
      videoController: videoController,
      customWidget: imageWidget,
      autoPlay: autoPlay,
      playInViewportOnly: playInViewportOnly,
      autoPlayDelay: autoPlayDelay,
      loop: loop,
      isMuted: isMuted,
    );

    final radius = imageBorderRadius ?? BorderRadius.circular(20.0);
    return Container(
      decoration: BoxDecoration(
        borderRadius: radius,
        border: Border.all(
          color: AlterSemanticTokens.stroke100,
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(19.0),
        child: mediaContent,
      ),
    );
  }

  Widget _buildBioSection(bool isPc) {
    return BioMarker(
      type: BioMarkerType.tall,
      device: isPc ? BioMarkerDevice.web : BioMarkerDevice.mobile,
      title: title,
      titleWidget: titleWidget,
      hasSubtitle: hasSubtitle,
      subtitle: subtitle,
      subtitleWidget: subtitleWidget,
      hasDescription: hasDescription,
      description: description,
      descriptionWidget: descriptionWidget,
      hasLogo: hasLogo,
      logo: logo,
      logoWidget: logoWidget,
      logoAssetPath: logoAssetPath,
      onLogoTap: onLogoTap,
      hasBadgeBar: hasBadgeBar,
      hasBadgeOne: hasBadgeOne,
      badge1Label: badge1Label,
      hasBadgeTwo: hasBadgeTwo,
      badge2Label: badge2Label,
      hasBadgeThree: hasBadgeThree,
      badge3Label: badge3Label,
      badges: badges,
    );
  }

  @override
  Widget build(BuildContext context) {
    final ambient = AlterDeviceScope.maybeOf(context);
    final bool isPc = switch (device) {
      MobileMarkerDevice.auto => ambient != null
          ? ambient == AlterDevice.pc
          : (scale == MobileMarkerScale.width ? (width ?? 896) >= 600 : true),
      MobileMarkerDevice.pc => true,
      MobileMarkerDevice.mobile => false,
    };

    if (scale == MobileMarkerScale.height) {
      // Scale = Height: height is fixed/constrained; width is auto-deduced from aspect ratio.
      final targetHeight = height ?? 692.34;
      final targetWidth = targetHeight * aspectRatio;

      Widget containerChild = AspectRatio(
        aspectRatio: aspectRatio,
        child: GestureDetector(
          onTap: onImageTap,
          child: _buildMockupContainer(),
        ),
      );

      final content = AlterDeviceScope(
        device: isPc ? AlterDevice.pc : AlterDevice.mobile,
        child: SizedBox(
          width: targetWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: targetHeight,
                width: targetWidth,
                child: containerChild,
              ),
              if (hasBioMarker) ...[
                const SizedBox(height: 16.0),
                _buildBioSection(isPc),
              ],
            ],
          ),
        ),
      );

      return content;
    }

    // Scale = Width: width is fixed/filled; height is auto-deduced and hugs content.
    Widget mockupWidget = AspectRatio(
      aspectRatio: aspectRatio,
      child: GestureDetector(
        onTap: onImageTap,
        child: _buildMockupContainer(),
      ),
    );

    Widget content = AlterDeviceScope(
      device: isPc ? AlterDevice.pc : AlterDevice.mobile,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          mockupWidget,
          if (hasBioMarker) ...[
            const SizedBox(height: 16.0),
            _buildBioSection(isPc),
          ],
        ],
      ),
    );

    if (width != null) {
      return SizedBox(
        width: width,
        child: content,
      );
    }

    return content;
  }
}
