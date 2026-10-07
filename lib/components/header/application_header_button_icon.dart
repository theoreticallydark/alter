import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../utilities/avatar.dart';

/// Style variants for [ApplicationHeaderButtonIcon].
enum ApplicationHeaderButtonIconType {
  /// Default icon action trigger.
  defaultType,

  /// User avatar action trigger.
  avatar,
}

/// A 48x48 action button for application headers supporting icons and user avatars.
///
/// Figma Specifications (Node `542:9072` - `.ApplicationHeaderButtonIcon`):
/// - Variants:
///   - `type=Default`: 48x48 box with centered 24x24 icon glyph.
///   - `type=Avatar`: 48x48 box with centered 32x32 [Avatar] child.
/// - States:
///   - `state=Default`: Background `transparent`.
///   - `state=Hover`: Background `baseActive` (`#E5E7EB`).
///   - `state=Selected`: Background `baseActive` (`#E5E7EB`).
class ApplicationHeaderButtonIcon extends StatefulWidget {
  /// Component version for reference.
  /// v1.0.1: Removed default 12px corner radius (default to sharp/zero radius) strictly matching Figma Node 542:9072.
  /// v1.0.0: Initial release matching Figma Node 542:9072 (.ApplicationHeaderButtonIcon).
  static const String version = '1.0.1';

  /// Variant type of the button icon (icon or avatar).
  final ApplicationHeaderButtonIconType type;

  /// Leading icon glyph data for [ApplicationHeaderButtonIconType.defaultType].
  final IconData? icon;

  /// Custom icon widget override.
  final Widget? iconWidget;

  /// Custom [Avatar] widget override for [ApplicationHeaderButtonIconType.avatar].
  final Widget? avatar;

  /// Image provider for the embedded avatar.
  final ImageProvider? avatarImage;

  /// Image URL string for the embedded avatar.
  final String? avatarImageUrl;

  /// Initials string fallback for the embedded avatar.
  final String? avatarInitials;

  /// Explicit hover state override.
  final bool? isHovered;

  /// Whether the button is currently in the selected active state.
  final bool isSelected;

  /// Corner radius of the button background.
  final BorderRadius? borderRadius;

  /// Overall size (width & height) of the button container.
  final double size;

  /// Callback executed when the button is tapped.
  final VoidCallback? onTap;

  /// Creates an [ApplicationHeaderButtonIcon] instance.
  const ApplicationHeaderButtonIcon({
    super.key,
    this.type = ApplicationHeaderButtonIconType.defaultType,
    this.icon = Icons.face_outlined,
    this.iconWidget,
    this.avatar,
    this.avatarImage,
    this.avatarImageUrl,
    this.avatarInitials,
    this.isHovered,
    this.isSelected = false,
    this.borderRadius,
    this.size = 48.0,
    this.onTap,
  });

  /// Factory for an avatar-based header action button.
  const ApplicationHeaderButtonIcon.avatar({
    super.key,
    this.avatar,
    this.avatarImage,
    this.avatarImageUrl,
    this.avatarInitials,
    this.isHovered,
    this.isSelected = false,
    this.borderRadius,
    this.size = 48.0,
    this.onTap,
  })  : type = ApplicationHeaderButtonIconType.avatar,
        icon = null,
        iconWidget = null;

  @override
  State<ApplicationHeaderButtonIcon> createState() =>
      _ApplicationHeaderButtonIconState();
}

class _ApplicationHeaderButtonIconState
    extends State<ApplicationHeaderButtonIcon> {
  bool _internalHover = false;

  bool get _isActiveHover => widget.isHovered ?? _internalHover;

  bool get _isActive => widget.isSelected || _isActiveHover;

  BorderRadius get _effectiveBorderRadius =>
      widget.borderRadius ?? BorderRadius.zero;

  Color get _effectiveBackgroundColor {
    if (_isActive) {
      return AlterSemanticTokens.baseActive;
    }
    return Colors.transparent;
  }

  Widget _buildContent() {
    if (widget.type == ApplicationHeaderButtonIconType.avatar) {
      if (widget.avatar != null) {
        return Center(child: widget.avatar!);
      }
      return Center(
        child: Avatar(
          type: (widget.avatarImage != null || widget.avatarImageUrl != null)
              ? AvatarType.image
              : AvatarType.placeholder,
          image: widget.avatarImage,
          imageUrl: widget.avatarImageUrl,
          initials: widget.avatarInitials,
          size: 32.0,
        ),
      );
    }

    if (widget.iconWidget != null) {
      return Center(child: widget.iconWidget!);
    }

    if (widget.icon != null) {
      return Center(
        child: Icon(
          widget.icon,
          size: 24.0,
          color: AlterSemanticTokens.textPrimary,
        ),
      );
    }

    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        if (mounted) setState(() => _internalHover = true);
      },
      onExit: (_) {
        if (mounted) setState(() => _internalHover = false);
      },
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: _effectiveBorderRadius,
        splashColor: Colors.transparent,
        highlightColor: AlterSemanticTokens.baseActive.withValues(alpha: 0.3),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.size,
          height: widget.size,
          decoration: BoxDecoration(
            color: _effectiveBackgroundColor,
            borderRadius: _effectiveBorderRadius,
          ),
          child: _buildContent(),
        ),
      ),
    );
  }
}
