import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../components/buttons/button_icon.dart';
import '../../components/buttons/button_icon_ghost.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Target device / viewport modes for [FooterBlock].
enum FooterBlockDevice {
  /// Automatically adapts based on parent width (< 500px triggers mobile layout) or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout (max width 896px, horizontal distribution).
  pc,

  /// Forces Mobile layout (max width 316px, vertical stacked distribution).
  mobile,
}

/// Data model representing a social or external link icon button in [FooterBlock].
class FooterSocialLink {
  /// The icon glyph displayed.
  final IconData icon;

  /// Optional tooltip label.
  final String? tooltip;

  /// Callback executed when tapped.
  final VoidCallback? onTap;

  /// Visual button style type (defaults to [ButtonIconType.white]).
  final ButtonIconType type;

  /// Optional custom widget override.
  final Widget? child;

  /// Creates a [FooterSocialLink].
  const FooterSocialLink({
    required this.icon,
    this.tooltip,
    this.onTap,
    this.type = ButtonIconType.white,
    this.child,
  });
}

/// A responsive footer block with contact email, copy-to-clipboard action, and social profile links for landing pages.
///
/// Figma Specifications (Node `922:9277` - `FooterBlock`):
/// - Variants:
///   - `device=PC` (`922:7403`): Width 896px, 24px padding, Row layout with space-between distribution.
///     - Left: Email text (14px Geist Regular `#000000`) + [ButtonIconGhost] copy button (24x24px).
///     - Right: "Find me on " text (14px Geist Regular `#4A5565`) + [ButtonIcon] white buttons (48x48px, 20px radius).
///   - `device=Mobile` (`922:9278`): Width 316px, 24px padding, Column layout with 24px gap.
///     - Top: Email text + [ButtonIconGhost] copy button.
///     - Bottom: "Find me on " text + [ButtonIcon] white buttons.
class FooterBlock extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 922:9277 (FooterBlock: device=PC/Mobile).
  static const String version = '1.0.0';

  /// Optional fixed width constraint for the block.
  final double? width;

  /// Viewport mode (`auto`, `pc`, or `mobile`).
  final FooterBlockDevice device;

  /// Width threshold below which mobile layout is activated (defaults to 500.0).
  final double breakpoint;

  /// Outer padding for the footer container (defaults to 24px).
  final EdgeInsetsGeometry padding;

  /// Contact email address or text.
  final String email;

  /// Custom widget override for the email text.
  final Widget? emailWidget;

  /// Whether the copy-to-clipboard button is displayed (defaults to true).
  final bool hasCopyButton;

  /// Icon data for the copy button (defaults to [Icons.content_copy_outlined]).
  final IconData copyButtonIcon;

  /// Custom tap callback for the copy button. If null, copies [email] to clipboard.
  final VoidCallback? onCopyTap;

  /// Label preceding the social links (defaults to 'Find me on ').
  final String socialLabel;

  /// Custom widget override for the social label.
  final Widget? socialLabelWidget;

  /// Whether the social links section is displayed (defaults to true).
  final bool hasSocial;

  /// List of social links to display.
  final List<FooterSocialLink>? socialLinks;

  /// Creates a [FooterBlock] instance.
  const FooterBlock({
    super.key,
    this.width,
    this.device = FooterBlockDevice.auto,
    this.breakpoint = 500.0,
    this.padding = const EdgeInsets.all(24.0),
    this.email = 'kharkarnayan00@gmail.com',
    this.emailWidget,
    this.hasCopyButton = true,
    this.copyButtonIcon = Icons.content_copy_outlined,
    this.onCopyTap,
    this.socialLabel = 'Find me on ',
    this.socialLabelWidget,
    this.hasSocial = true,
    this.socialLinks,
  });

  /// Default social profile links matching Figma Node 922:9277.
  static List<FooterSocialLink> defaultSocialLinks() {
    return const [
      FooterSocialLink(
        icon: Icons.favorite_border,
        tooltip: 'Favorite',
      ),
      FooterSocialLink(
        icon: Icons.favorite_border,
        tooltip: 'Favorite',
      ),
      FooterSocialLink(
        icon: Icons.favorite_border,
        tooltip: 'Favorite',
      ),
    ];
  }

  void _handleCopy(BuildContext context) {
    if (onCopyTap != null) {
      onCopyTap!();
      return;
    }

    Clipboard.setData(ClipboardData(text: email));
    ScaffoldMessenger.maybeOf(context)?.showSnackBar(
      SnackBar(
        content: Text('Copied "$email" to clipboard'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Widget _buildEmailSection(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (emailWidget != null)
          emailWidget!
        else
          Text(
            email,
            style: AlterTypography.body.copyWith(
              color: AlterSemanticTokens.textPrimary,
            ),
          ),
        if (hasCopyButton) ...[
          const SizedBox(width: 12.0),
          ButtonIconGhost(
            icon: copyButtonIcon,
            size: 24.0,
            type: ButtonIconGhostType.primary,
            onTap: () => _handleCopy(context),
          ),
        ],
      ],
    );
  }

  Widget _buildSocialSection() {
    final effectiveLinks = socialLinks ?? defaultSocialLinks();

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (socialLabelWidget != null)
          socialLabelWidget!
        else
          Text(
            socialLabel,
            style: AlterTypography.body.copyWith(
              color: AlterSemanticTokens.textSecondary,
            ),
          ),
        const SizedBox(width: 12.0),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: effectiveLinks.map((link) {
            if (link.child != null) return link.child!;
            return ButtonIcon(
              type: link.type,
              icon: link.icon,
              size: 48.0,
              iconSize: 28.0,
              onTap: link.onTap,
            );
          }).toList(),
        ),
      ],
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
          FooterBlockDevice.auto => ambient != null
              ? ambient == AlterDevice.pc
              : targetWidth >= breakpoint,
          FooterBlockDevice.pc => true,
          FooterBlockDevice.mobile => false,
        };

        Widget content;
        if (isPc) {
          content = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildEmailSection(context),
              if (hasSocial) _buildSocialSection(),
            ],
          );
        } else {
          content = Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildEmailSection(context),
              if (hasSocial) ...[
                const SizedBox(height: 24.0),
                _buildSocialSection(),
              ],
            ],
          );
        }

        final blockContent = AlterDeviceScope(
          device: isPc ? AlterDevice.pc : AlterDevice.mobile,
          child: Padding(
            padding: padding,
            child: content,
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
