import 'package:flutter/material.dart';
import '../../styles/tokens.dart';

/// Supported media payload types for [AlterMediaView].
enum AlterMediaType {
  /// Static image or animated GIF rendered via Flutter's image pipeline.
  image,

  /// Video or rich media rendered via custom widget or media builder.
  video,

  /// Custom widget override / slotted component.
  custom,
}

/// A versatile media presentation widget supporting static images, animated GIFs,
/// and pluggable media slots (such as video players, Lottie, Rive, or custom widgets).
///
/// Designed specifically for Alter Design System Markers and Blocks ([GraphicsBlock], [MobileMockupBlock])
/// to showcase rich multimedia content without control chrome and with full WASM/Web compatibility.
class AlterMediaView extends StatelessWidget {
  /// Component version for reference.
  /// v2.0.0: Transitioned to pluggable media slots and builders (100% WASM/Web compatible, zero dart:io dependencies).
  /// v1.1.0: Added viewport-aware autoplay control with configurable delay.
  /// v1.0.0: Initial release supporting Images, GIFs, and autoplay looping Videos.
  static const String version = '2.0.0';

  /// Image provider for static images or GIFs.
  final ImageProvider? image;

  /// Network URL for image, GIF, or fallback media.
  final String? url;

  /// Local asset path for image, GIF, or fallback media.
  final String? assetPath;

  /// Custom widget override or slot (e.g. VideoPlayer, Lottie, Rive, custom canvas).
  final Widget? customWidget;

  /// Backwards compatibility alias for [customWidget].
  Widget? get slot => customWidget;

  /// Optional builder for responsive or slotted media.
  final Widget Function(BuildContext context)? mediaBuilder;

  /// Explicitly specified media type (if null, automatically inferred).
  final AlterMediaType? mediaType;

  /// How the media should fit inside the container (defaults to [BoxFit.cover]).
  final BoxFit fit;

  /// Corner radius applied to the media container.
  final BorderRadius? borderRadius;

  /// Border applied to the media container.
  final Border? border;

  /// Aspect ratio constraint for the media (e.g. 16/9 for banners, 428/926 for mobile).
  final double? aspectRatio;

  /// Placeholder widget displayed while media is loading or if no media is provided.
  final Widget? placeholder;

  /// Legacy video parameter retained for API compatibility (no-op in v2.0.0+).
  final bool loop;

  /// Legacy video parameter retained for API compatibility (no-op in v2.0.0+).
  final bool autoPlay;

  /// Legacy video parameter retained for API compatibility (no-op in v2.0.0+).
  final bool playInViewportOnly;

  /// Legacy video parameter retained for API compatibility (no-op in v2.0.0+).
  final Duration autoPlayDelay;

  /// Legacy video parameter retained for API compatibility (no-op in v2.0.0+).
  final bool isMuted;

  /// Creates an [AlterMediaView] instance.
  const AlterMediaView({
    super.key,
    this.image,
    this.url,
    this.assetPath,
    this.customWidget,
    this.mediaBuilder,
    this.mediaType,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.border,
    this.aspectRatio,
    this.placeholder,
    this.loop = true,
    this.autoPlay = true,
    this.playInViewportOnly = true,
    this.autoPlayDelay = const Duration(milliseconds: 1200),
    this.isMuted = true,
  });

  AlterMediaType get _resolvedMediaType {
    if (mediaType != null) return mediaType!;
    if (customWidget != null || mediaBuilder != null) return AlterMediaType.custom;

    final target = (url ?? assetPath ?? '').toLowerCase();
    if (target.endsWith('.mp4') ||
        target.endsWith('.webm') ||
        target.endsWith('.mov') ||
        target.endsWith('.m4v') ||
        target.endsWith('.avi')) {
      return AlterMediaType.video;
    }
    return AlterMediaType.image;
  }

  Widget _buildPlaceholder() {
    if (placeholder != null) return placeholder!;

    return Container(
      color: AlterSemanticTokens.stroke100,
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          size: 40,
          color: AlterSemanticTokens.textDisabled,
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (image != null) {
      return Image(
        image: image!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    if (url != null && url!.isNotEmpty) {
      return Image.network(
        url!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    if (assetPath != null && assetPath!.isNotEmpty) {
      return Image.asset(
        assetPath!,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    return _buildPlaceholder();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (mediaBuilder != null) {
      content = mediaBuilder!(context);
    } else if (customWidget != null) {
      content = customWidget!;
    } else {
      content = switch (_resolvedMediaType) {
        AlterMediaType.image => _buildImage(),
        AlterMediaType.video => _buildPlaceholder(),
        AlterMediaType.custom => customWidget ?? _buildPlaceholder(),
      };
    }

    final radius = borderRadius ?? BorderRadius.zero;

    Widget wrapped = ClipRRect(
      borderRadius: radius,
      child: content,
    );

    if (border != null) {
      wrapped = Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: border,
        ),
        child: wrapped,
      );
    }

    if (aspectRatio != null) {
      wrapped = AspectRatio(
        aspectRatio: aspectRatio!,
        child: wrapped,
      );
    }

    return wrapped;
  }
}
