import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../styles/tokens.dart';

/// Supported media payload types for [AlterMediaView].
enum AlterMediaType {
  /// Static image or animated GIF rendered via Flutter's image pipeline.
  image,

  /// Video stream rendered via [VideoPlayer] with autoplay, looping, and no controls.
  video,

  /// Custom widget override.
  custom,
}

/// A versatile media presentation widget supporting static images, animated GIFs, and muted looping autoplay videos.
///
/// Designed specifically for Alter Design System Markers ([ProjectMarker], [MobileMarker])
/// to showcase rich multimedia content without control chrome with optional viewport-aware autoplay and delay.
class AlterMediaView extends StatefulWidget {
  /// Component version for reference.
  /// v1.1.0: Added viewport-aware autoplay control with configurable delay (default 1.2s) to pause off-screen videos and play when visible.
  /// v1.0.0: Initial release supporting Images, GIFs, and autoplay looping Videos.
  static const String version = '1.1.0';

  /// Image provider for static images or GIFs.
  final ImageProvider? image;

  /// Network URL for image, GIF, or video.
  final String? url;

  /// Local asset path for image, GIF, or video.
  final String? assetPath;

  /// Custom widget override.
  final Widget? customWidget;

  /// Optional pre-configured [VideoPlayerController] instance.
  final VideoPlayerController? videoController;

  /// Explicitly specified media type (if null, automatically inferred from file extension).
  final AlterMediaType? mediaType;

  /// How the media should fit inside the container (defaults to [BoxFit.cover]).
  final BoxFit fit;

  /// Corner radius applied to the media container.
  final BorderRadius? borderRadius;

  /// Border applied to the media container.
  final Border? border;

  /// Whether videos should loop infinitely (defaults to true).
  final bool loop;

  /// Whether videos should start playing automatically (defaults to true).
  final bool autoPlay;

  /// Whether video playback should only occur when the widget is visible in the viewport (defaults to true).
  final bool playInViewportOnly;

  /// Delay before video starts playing once entering the viewport (defaults to 1.2 seconds / 1200ms).
  final Duration autoPlayDelay;

  /// Whether videos should be muted (defaults to true for web/mobile autoplay compliance).
  final bool isMuted;

  /// Aspect ratio constraint for the media (e.g. 16/9 for banners, 428/926 for mobile).
  final double? aspectRatio;

  /// Placeholder widget displayed while media is loading.
  final Widget? placeholder;

  /// Creates an [AlterMediaView] instance.
  const AlterMediaView({
    super.key,
    this.image,
    this.url,
    this.assetPath,
    this.customWidget,
    this.videoController,
    this.mediaType,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.border,
    this.loop = true,
    this.autoPlay = true,
    this.playInViewportOnly = true,
    this.autoPlayDelay = const Duration(milliseconds: 1200),
    this.isMuted = true,
    this.aspectRatio,
    this.placeholder,
  });

  @override
  State<AlterMediaView> createState() => _AlterMediaViewState();
}

class _AlterMediaViewState extends State<AlterMediaView> {
  VideoPlayerController? _controller;
  bool _isControllerOwned = false;
  bool _isInitialized = false;
  bool _hasError = false;

  Timer? _playTimer;
  ScrollPosition? _scrollPosition;
  bool _isInViewport = false;

  @override
  void initState() {
    super.initState();
    _initVideoIfApplicable();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _attachScrollListener();
  }

  @override
  void didUpdateWidget(covariant AlterMediaView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.url != widget.url ||
        oldWidget.assetPath != widget.assetPath ||
        oldWidget.videoController != widget.videoController) {
      _disposeOwnedController();
      _initVideoIfApplicable();
    }
  }

  void _attachScrollListener() {
    final newScrollPosition = Scrollable.maybeOf(context)?.position;
    if (newScrollPosition != _scrollPosition) {
      _scrollPosition?.removeListener(_onScrollChanged);
      _scrollPosition = newScrollPosition;
      _scrollPosition?.addListener(_onScrollChanged);
    }
  }

  void _onScrollChanged() {
    _checkViewportVisibility();
  }

  AlterMediaType get _resolvedMediaType {
    if (widget.mediaType != null) return widget.mediaType!;
    if (widget.videoController != null) return AlterMediaType.video;
    if (widget.customWidget != null) return AlterMediaType.custom;

    final target = (widget.url ?? widget.assetPath ?? '').toLowerCase();
    if (target.endsWith('.mp4') ||
        target.endsWith('.webm') ||
        target.endsWith('.mov') ||
        target.endsWith('.m4v') ||
        target.endsWith('.avi')) {
      return AlterMediaType.video;
    }
    return AlterMediaType.image;
  }

  void _initVideoIfApplicable() {
    if (_resolvedMediaType != AlterMediaType.video) return;

    if (widget.videoController != null) {
      _controller = widget.videoController;
      _isControllerOwned = false;
      _isInitialized = _controller!.value.isInitialized;
      _setupController();
    } else if (widget.url != null && widget.url!.isNotEmpty) {
      final uri = Uri.tryParse(widget.url!);
      if (uri != null) {
        _controller = VideoPlayerController.networkUrl(uri);
        _isControllerOwned = true;
        _setupController();
      }
    } else if (widget.assetPath != null && widget.assetPath!.isNotEmpty) {
      _controller = VideoPlayerController.asset(widget.assetPath!);
      _isControllerOwned = true;
      _setupController();
    }
  }

  void _setupController() {
    if (_controller == null) return;

    _controller!.setLooping(widget.loop);
    if (widget.isMuted) {
      _controller!.setVolume(0.0);
    }

    if (!_controller!.value.isInitialized) {
      _controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {
          _isInitialized = true;
        });
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _checkViewportVisibility(forceInitial: true);
        });
      }).catchError((_) {
        if (!mounted) return;
        setState(() {
          _hasError = true;
        });
      });
    } else {
      setState(() {
        _isInitialized = true;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _checkViewportVisibility(forceInitial: true);
      });
    }
  }

  bool _isRenderedInViewport() {
    if (!mounted) return false;
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize || !renderObject.attached) {
      return false;
    }
    final size = renderObject.size;
    if (size.width <= 0 || size.height <= 0) return false;

    try {
      final position = renderObject.localToGlobal(Offset.zero);
      final mediaQuery = MediaQuery.maybeOf(context);
      final screenSize = mediaQuery?.size ?? const Size(double.infinity, double.infinity);
      final screenRect = Offset.zero & screenSize;
      final widgetRect = position & size;
      return screenRect.overlaps(widgetRect);
    } catch (_) {
      return true;
    }
  }

  void _checkViewportVisibility({bool forceInitial = false}) {
    if (!mounted || _controller == null || !_isInitialized) return;

    if (!widget.playInViewportOnly) {
      if (widget.autoPlay && !_controller!.value.isPlaying) {
        _schedulePlay(widget.autoPlayDelay);
      }
      return;
    }

    final isVisible = _isRenderedInViewport();
    if (isVisible != _isInViewport || forceInitial) {
      _isInViewport = isVisible;
      if (_isInViewport) {
        if (widget.autoPlay) {
          _schedulePlay(widget.autoPlayDelay);
        }
      } else {
        _playTimer?.cancel();
        if (_controller!.value.isPlaying) {
          _controller!.pause();
        }
      }
    }
  }

  void _schedulePlay(Duration delay) {
    _playTimer?.cancel();
    if (delay == Duration.zero) {
      if (mounted && _controller != null && _isInitialized && !_controller!.value.isPlaying) {
        _controller!.play();
      }
    } else {
      _playTimer = Timer(delay, () {
        if (mounted &&
            _controller != null &&
            _isInitialized &&
            (!widget.playInViewportOnly || _isInViewport) &&
            widget.autoPlay &&
            !_controller!.value.isPlaying) {
          _controller!.play();
        }
      });
    }
  }

  void _disposeOwnedController() {
    _playTimer?.cancel();
    if (_isControllerOwned && _controller != null) {
      _controller!.dispose();
      _controller = null;
      _isInitialized = false;
      _hasError = false;
    }
  }

  @override
  void dispose() {
    _playTimer?.cancel();
    _scrollPosition?.removeListener(_onScrollChanged);
    _disposeOwnedController();
    super.dispose();
  }

  Widget _buildPlaceholder() {
    if (widget.placeholder != null) return widget.placeholder!;

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

  Widget _buildVideo() {
    if (_hasError || _controller == null || !_isInitialized) {
      return _buildPlaceholder();
    }

    return FittedBox(
      fit: widget.fit,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: _controller!.value.size.width > 0 ? _controller!.value.size.width : 16,
        height: _controller!.value.size.height > 0 ? _controller!.value.size.height : 9,
        child: VideoPlayer(_controller!),
      ),
    );
  }

  Widget _buildImage() {
    if (widget.image != null) {
      return Image(
        image: widget.image!,
        fit: widget.fit,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    if (widget.url != null && widget.url!.isNotEmpty) {
      return Image.network(
        widget.url!,
        fit: widget.fit,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    if (widget.assetPath != null && widget.assetPath!.isNotEmpty) {
      return Image.asset(
        widget.assetPath!,
        fit: widget.fit,
        errorBuilder: (context, error, stackTrace) => _buildPlaceholder(),
      );
    }

    return _buildPlaceholder();
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (widget.customWidget != null) {
      content = widget.customWidget!;
    } else {
      content = switch (_resolvedMediaType) {
        AlterMediaType.video => _buildVideo(),
        AlterMediaType.image => _buildImage(),
        AlterMediaType.custom => widget.customWidget ?? _buildPlaceholder(),
      };
    }

    final radius = widget.borderRadius ?? BorderRadius.zero;

    Widget wrapped = ClipRRect(
      borderRadius: radius,
      child: content,
    );

    if (widget.border != null) {
      wrapped = Container(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: widget.border,
        ),
        child: wrapped,
      );
    }

    if (widget.aspectRatio != null) {
      wrapped = AspectRatio(
        aspectRatio: widget.aspectRatio!,
        child: wrapped,
      );
    }

    return wrapped;
  }
}
