import 'package:flutter/material.dart';
import '../../components/buttons/button_text.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Target device / viewport modes for [HeroBlock].
enum HeroBlockDevice {
  /// Automatically adapts based on parent width (< 500px triggers mobile layout) or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout (80px display title, h2 subtitle, actions with icons).
  pc,

  /// Forces Mobile layout (48px display title, h4 subtitle, compact actions).
  mobile,
}

/// A responsive hero banner section block for landing pages.
///
/// Figma Specifications (Node `761:6375` - `HeroBlock`):
/// - Variants:
///   - `device=PC` (`761:6374`):
///     - Graphic Container: 84x84px with 24px border radius (`BorderRadius.circular(24)`).
///     - Title: 80px Geist SemiBold, lineHeight 1.0 (80px), letterSpacing -0.05em, textPrimary.
///     - Subtitle: 20px Geist SemiBold (Headings/h2), lineHeight 24px, textSecondary.
///     - Actions: Primary + Gray [ButtonText] with leading icons (`hasIcon: true`), 12px gap.
///   - `device=Mobile` (`761:6392`):
///     - Graphic Container: 84x84px with 24px border radius (`BorderRadius.circular(24)`).
///     - Title: 48px Geist SemiBold, lineHeight 1.0 (48px), letterSpacing -0.0833em, textPrimary.
///     - Subtitle: 16px Geist SemiBold (Headings/h4), lineHeight 20px, textSecondary.
///     - Actions: Primary + Gray [ButtonText] without icons (`hasIcon: false`), 12px gap.
/// - Spacing & Structure:
///   - Vertical gap between sections: 24px.
///   - Text alignment: Center aligned.
///   - Sizing: Fills available parent width (or constrained by optional [width]), hugs vertical height.
class HeroBlock extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 761:6375 (HeroBlock: device=PC/Mobile).
  static const String version = '1.0.0';

  /// Optional fixed width constraint for the entire hero block.
  final double? width;

  /// Viewport mode (`auto`, `pc`, or `mobile`).
  final HeroBlockDevice device;

  /// Width threshold below which mobile layout is activated (defaults to 500.0).
  final double breakpoint;

  /// Image provider for the top avatar/graphic container.
  final ImageProvider? avatar;

  /// Network URL for the avatar image.
  final String? avatarUrl;

  /// Local asset path for the avatar image.
  final String? avatarAssetPath;

  /// Custom widget override for the avatar/graphic container.
  final Widget? avatarWidget;

  /// Dimensions (width & height) for the avatar container (defaults to 84.0).
  final double avatarSize;

  /// Corner radius of the avatar container (defaults to 24px).
  final BorderRadius? avatarRadius;

  /// Whether the avatar/graphic container is displayed (defaults to true).
  final bool hasAvatar;

  /// Main headline title text.
  final String title;

  /// Custom widget override for title.
  final Widget? titleWidget;

  /// Whether subtitle is displayed (defaults to true).
  final bool hasSubtitle;

  /// Subtitle descriptive text.
  final String subtitle;

  /// Custom widget override for subtitle.
  final Widget? subtitleWidget;

  /// Whether action buttons bar is displayed (defaults to true).
  final bool hasActions;

  /// Label for primary action button (defaults to 'Book a call').
  final String primaryButtonLabel;

  /// Icon for primary action button (defaults to [Icons.videocam_outlined]).
  final IconData? primaryButtonIcon;

  /// Whether primary button displays an icon. If null, defaults to `true` on PC and `false` on Mobile per Figma.
  final bool? hasPrimaryButtonIcon;

  /// Callback executed when primary action button is tapped.
  final VoidCallback? onPrimaryTap;

  /// Whether primary action button is displayed (defaults to true).
  final bool hasPrimaryButton;

  /// Label for secondary action button (defaults to 'Download CV').
  final String secondaryButtonLabel;

  /// Icon for secondary action button (defaults to [Icons.description_outlined]).
  final IconData? secondaryButtonIcon;

  /// Whether secondary button displays an icon. If null, defaults to `true` on PC and `false` on Mobile per Figma.
  final bool? hasSecondaryButtonIcon;

  /// Callback executed when secondary action button is tapped.
  final VoidCallback? onSecondaryTap;

  /// Whether secondary action button is displayed (defaults to true).
  final bool hasSecondaryButton;

  /// Custom widget list for action buttons bar.
  final List<Widget>? actions;

  /// Creates a [HeroBlock] instance.
  const HeroBlock({
    super.key,
    this.width,
    this.device = HeroBlockDevice.auto,
    this.breakpoint = 500.0,
    this.avatar,
    this.avatarUrl,
    this.avatarAssetPath,
    this.avatarWidget,
    this.avatarSize = 84.0,
    this.avatarRadius,
    this.hasAvatar = true,
    this.title = 'Hi, I am Nayan &\nI build things.',
    this.titleWidget,
    this.hasSubtitle = true,
    this.subtitle = 'Principal UX Designer & Engineer @SIG',
    this.subtitleWidget,
    this.hasActions = true,
    this.primaryButtonLabel = 'Book a call',
    this.primaryButtonIcon = Icons.videocam_outlined,
    this.hasPrimaryButtonIcon,
    this.onPrimaryTap,
    this.hasPrimaryButton = true,
    this.secondaryButtonLabel = 'Download CV',
    this.secondaryButtonIcon = Icons.description_outlined,
    this.hasSecondaryButtonIcon,
    this.onSecondaryTap,
    this.hasSecondaryButton = true,
    this.actions,
  });

  Widget _buildAvatar() {
    if (avatarWidget != null) {
      return SizedBox(
        width: avatarSize,
        height: avatarSize,
        child: avatarWidget,
      );
    }

    final radius = avatarRadius ?? BorderRadius.circular(24.0);

    Widget imageContent;
    if (avatar != null) {
      imageContent = Image(image: avatar!, fit: BoxFit.cover);
    } else if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      imageContent = Image.network(avatarUrl!, fit: BoxFit.cover);
    } else if (avatarAssetPath != null && avatarAssetPath!.isNotEmpty) {
      imageContent = Image.asset(avatarAssetPath!, fit: BoxFit.cover);
    } else {
      imageContent = Container(
        color: AlterSemanticTokens.stroke100,
        child: const Center(
          child: Icon(
            Icons.person_rounded,
            size: 44,
            color: AlterSemanticTokens.textDisabled,
          ),
        ),
      );
    }

    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        borderRadius: radius,
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: imageContent,
      ),
    );
  }

  Widget _buildActions(bool isPc) {
    if (actions != null) {
      return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 12.0,
        runSpacing: 12.0,
        children: actions!,
      );
    }

    final effectiveHasPrimaryIcon = hasPrimaryButtonIcon ?? isPc;
    final effectiveHasSecondaryIcon = hasSecondaryButtonIcon ?? isPc;

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasPrimaryButton)
          ButtonText(
            type: ButtonType.primary,
            size: ButtonSize.normal,
            label: primaryButtonLabel,
            hasIcon: effectiveHasPrimaryIcon,
            icon: primaryButtonIcon,
            onTap: onPrimaryTap,
          ),
        if (hasPrimaryButton && hasSecondaryButton) const SizedBox(width: 12.0),
        if (hasSecondaryButton)
          ButtonText(
            type: ButtonType.gray,
            size: ButtonSize.normal,
            label: secondaryButtonLabel,
            hasIcon: effectiveHasSecondaryIcon,
            icon: secondaryButtonIcon,
            onTap: onSecondaryTap,
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
          HeroBlockDevice.auto => ambient != null
              ? ambient == AlterDevice.pc
              : targetWidth >= breakpoint,
          HeroBlockDevice.pc => true,
          HeroBlockDevice.mobile => false,
        };

        // Typography per Figma specs
        final TextStyle titleStyle = isPc
            ? const TextStyle(
                fontFamily: AlterTypography.geistFont,
                fontWeight: FontWeight.w600,
                fontSize: 80.0,
                height: 1.0,
                letterSpacing: -4.0, // -0.05em * 80px = -4.0px
                color: AlterSemanticTokens.textPrimary,
              )
            : const TextStyle(
                fontFamily: AlterTypography.geistFont,
                fontWeight: FontWeight.w600,
                fontSize: 48.0,
                height: 1.0,
                letterSpacing: -4.0, // -0.0833em * 48px = -4.0px
                color: AlterSemanticTokens.textPrimary,
              );

        final TextStyle subtitleStyle = (isPc
                ? AlterTypography.h2
                : AlterTypography.h4)
            .copyWith(
          color: AlterSemanticTokens.textSecondary,
        );

        final blockContent = AlterDeviceScope(
          device: isPc ? AlterDevice.pc : AlterDevice.mobile,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (hasAvatar) ...[
                _buildAvatar(),
                const SizedBox(height: 24.0),
              ],
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (titleWidget != null)
                    titleWidget!
                  else
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: titleStyle,
                    ),
                  if (hasSubtitle) ...[
                    const SizedBox(height: 24.0),
                    if (subtitleWidget != null)
                      subtitleWidget!
                    else
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: subtitleStyle,
                      ),
                  ],
                  if (hasActions) ...[
                    const SizedBox(height: 24.0),
                    _buildActions(isPc),
                  ],
                ],
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
