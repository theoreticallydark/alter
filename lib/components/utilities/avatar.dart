import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Style variants for [Avatar].
enum AvatarType {
  /// Renders an image avatar.
  image,

  /// Renders a placeholder avatar with an icon or initials.
  placeholder,
}

/// A compact user/entity avatar component for the Alter Design System.
///
/// Figma Specifications (Node `655:11313` - `Avatar`):
/// - Variants:
///   - `type=Image` (`655:11312`): 32x32px, 12px border radius, fills image with cover fit.
///   - `type=Placeholder` (`655:11314`): 32x32px, 12px border radius, `#FFFFFF` background, centered 24x24 `face` icon.
/// - Dimensions: Default 32x32px, `BorderRadius.circular(12)`.
/// - Children: `face` icon (`Icons.face_5_outlined`) or custom widget/image/initials.
class Avatar extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 655:11313 (Avatar: Image and Placeholder variants).
  static const String version = '1.0.0';

  /// Variant type of the avatar.
  final AvatarType type;

  /// Image provider for [AvatarType.image].
  final ImageProvider? image;

  /// Convenience URL string for network images.
  final String? imageUrl;

  /// Initials text fallback (e.g. 'RC' or 'JD').
  final String? initials;

  /// Leading icon for [AvatarType.placeholder].
  final IconData? icon;

  /// Custom icon/placeholder widget override.
  final Widget? iconWidget;

  /// Width and height dimension of the avatar.
  final double size;

  /// Corner border radius of the avatar container.
  final BorderRadius? borderRadius;

  /// Background color of the avatar.
  final Color? backgroundColor;

  /// Foreground icon/initials color.
  final Color? foregroundColor;

  /// Optional border outline color.
  final Color? borderColor;

  /// Optional border stroke width.
  final double borderWidth;

  /// Optional tap callback.
  final VoidCallback? onTap;

  /// Semantic accessibility label.
  final String? semanticLabel;

  /// Creates an [Avatar] instance.
  const Avatar({
    super.key,
    this.type = AvatarType.placeholder,
    this.image,
    this.imageUrl,
    this.initials,
    this.icon = Icons.face_5_outlined,
    this.iconWidget,
    this.size = 32.0,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
    this.semanticLabel,
  });

  /// Factory for an image-based avatar.
  const Avatar.image({
    super.key,
    required this.image,
    this.size = 32.0,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
    this.semanticLabel,
  })  : type = AvatarType.image,
        imageUrl = null,
        initials = null,
        icon = null,
        iconWidget = null,
        backgroundColor = null,
        foregroundColor = null;

  /// Factory for a network image avatar.
  const Avatar.network({
    super.key,
    required String url,
    this.size = 32.0,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
    this.semanticLabel,
  })  : type = AvatarType.image,
        image = null,
        imageUrl = url,
        initials = null,
        icon = null,
        iconWidget = null,
        backgroundColor = null,
        foregroundColor = null;

  /// Factory for a placeholder icon avatar.
  const Avatar.placeholder({
    super.key,
    this.icon = Icons.face_5_outlined,
    this.iconWidget,
    this.size = 32.0,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
    this.semanticLabel,
  })  : type = AvatarType.placeholder,
        image = null,
        imageUrl = null,
        initials = null;

  /// Factory for an initials-based avatar.
  const Avatar.initials({
    super.key,
    required this.initials,
    this.size = 32.0,
    this.borderRadius,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    this.borderWidth = 1.0,
    this.onTap,
    this.semanticLabel,
  })  : type = AvatarType.placeholder,
        image = null,
        imageUrl = null,
        icon = null,
        iconWidget = null;

  BorderRadius get _effectiveBorderRadius {
    return borderRadius ?? BorderRadius.circular(size * (12.0 / 32.0));
  }

  Color get _effectiveBackgroundColor {
    if (backgroundColor != null) return backgroundColor!;
    switch (type) {
      case AvatarType.image:
        return AlterSemanticTokens.baseGray;
      case AvatarType.placeholder:
        return AlterSemanticTokens.baseWhite;
    }
  }

  Color get _effectiveForegroundColor {
    return foregroundColor ?? AlterSemanticTokens.textPrimary;
  }

  ImageProvider? get _effectiveImageProvider {
    if (image != null) return image;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return NetworkImage(imageUrl!);
    }
    return null;
  }

  Widget _buildPlaceholderContent() {
    if (iconWidget != null) {
      return Center(
        child: IconTheme(
          data: IconThemeData(
            color: _effectiveForegroundColor,
            size: size * (24.0 / 32.0),
          ),
          child: iconWidget!,
        ),
      );
    }

    if (initials != null && initials!.isNotEmpty) {
      final fontSize = (size * 0.4).clamp(10.0, 24.0);
      return Center(
        child: Text(
          initials!,
          style: AlterTypography.captionBold.copyWith(
            fontSize: fontSize,
            color: _effectiveForegroundColor,
            height: 1.0,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
      );
    }

    if (icon != null) {
      return Center(
        child: Icon(
          icon,
          size: size * (24.0 / 32.0),
          color: _effectiveForegroundColor,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = _effectiveImageProvider;
    final isImage = type == AvatarType.image && imageProvider != null;

    Widget avatarContent = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: _effectiveBackgroundColor,
        borderRadius: _effectiveBorderRadius,
        border: borderColor != null
            ? Border.all(
                color: borderColor!,
                width: borderWidth,
              )
            : null,
        image: isImage
            ? DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: isImage ? null : _buildPlaceholderContent(),
    );

    if (semanticLabel != null) {
      avatarContent = Semantics(
        label: semanticLabel,
        child: avatarContent,
      );
    }

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: _effectiveBorderRadius,
        splashColor: Colors.transparent,
        highlightColor: AlterSemanticTokens.baseActive.withValues(alpha: 0.3),
        child: avatarContent,
      );
    }

    return avatarContent;
  }
}
