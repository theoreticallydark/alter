import 'package:flutter/material.dart' hide Badge, Divider;
import '../../components/pills/badge.dart';
import '../../components/utilities/divider.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Layout style variants for [BioMarker].
enum BioMarkerType {
  /// Vertical stacked header layout where badges appear beneath title and subtitle.
  tall,

  /// Horizontal header layout where badges appear alongside title and subtitle.
  wide,
}

/// Target device / viewport modes for [BioMarker].
enum BioMarkerDevice {
  /// Automatically responds to layout constraints (< 500px triggers mobile layout) or inherits ambient [AlterDeviceScope] from parent.
  auto,

  /// Forces desktop / web layout with 84x84 logo, h2 typography, and 24px corner radius.
  web,

  /// Forces mobile layout with 48x48 logo, h4 typography, and 12px corner radius.
  mobile,
}

/// A responsive biography and entity marker card for the Alter Design System.
///
/// Figma Specifications (Node `761:7097` - `BioMarker`):
/// - Variants:
///   - `type`: `Tall` | `Wide`
///   - `device`: `Web` (Desktop) | `Mobile`
/// - Left:
///   - `logoContainer`:
///     - Web: 84x84px, 24px border radius, 1px `#F3F4F6` border ([AlterSemanticTokens.stroke100]), `#FFFFFF` fill.
///     - Mobile: 48x48px, 12px border radius, 1px `#F3F4F6` border ([AlterSemanticTokens.stroke100]), `#FFFFFF` fill.
/// - Right / Body:
///   - Header Section:
///     - Title & Subtitle:
///       - Web: Title `Headings/h2` ([AlterTypography.h2Bold]), Subtitle `Body/body-lg` ([AlterTypography.bodyLg]).
///       - Mobile: Title `Headings/h4` ([AlterTypography.h4Bold]), Subtitle `Body/caption` ([AlterTypography.caption]).
///     - Badges:
///       - Reuses [Badge] with [BadgeColor.slate] (#F1F5F9 fill, #1D293D text).
///     - Layout:
///       - `Tall`: Badges placed underneath title & subtitle with 8px vertical gap.
///       - `Wide`: Badges placed beside title & subtitle with 24px horizontal gap.
///   - Bio / Description Section:
///     - Separated by 1px [Divider] ([AlterSemanticTokens.stroke200]).
///     - Web Description: `Body/body-lg` ([AlterTypography.bodyLg], `#4A5565`).
///     - Mobile Description: `Body/body` ([AlterTypography.body], `#4A5565`).
class BioMarker extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.1: Added ambient AlterDeviceScope inheritance so BioMarker derives device mode directly from parent marker/grid rather than judging its own narrow cell width.
  /// v1.0.0: Initial release matching Figma Node 761:7097 (BioMarker: Tall/Wide, Web/Mobile responsive).
  static const String version = '1.0.1';

  /// Variant layout type (`tall` or `wide`).
  final BioMarkerType type;

  /// Viewport mode (`auto` responsive, `web`, or `mobile`).
  final BioMarkerDevice device;

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

  /// Whether the bio / description section is displayed.
  final bool hasDescription;

  /// Bio / description body text.
  final String description;

  /// Custom widget override for description.
  final Widget? descriptionWidget;

  /// Whether the entity logo container is displayed.
  final bool hasLogo;

  /// Image provider for the entity logo.
  final ImageProvider? logo;

  /// Custom widget override for the logo.
  final Widget? logoWidget;

  /// Custom asset path for the logo (defaults to 'assets/alter_logo.png').
  final String? logoAssetPath;

  /// Callback executed when the logo is tapped.
  final VoidCallback? onLogoTap;

  /// Whether the badge bar is displayed.
  final bool hasBadgeBar;

  /// Whether badge 1 is displayed.
  final bool hasBadgeOne;

  /// Label string for badge 1.
  final String badge1Label;

  /// Whether badge 2 is displayed.
  final bool hasBadgeTwo;

  /// Label string for badge 2.
  final String badge2Label;

  /// Whether badge 3 is displayed.
  final bool hasBadgeThree;

  /// Label string for badge 3.
  final String badge3Label;

  /// Custom list of badge widgets (overrides default badges if provided).
  final List<Widget>? badges;

  /// Creates a [BioMarker] instance.
  const BioMarker({
    super.key,
    this.type = BioMarkerType.tall,
    this.device = BioMarkerDevice.auto,
    this.title = 'Title',
    this.titleWidget,
    this.hasSubtitle = true,
    this.subtitle = 'Subtitle',
    this.subtitleWidget,
    this.hasDescription = true,
    this.description = 'Description',
    this.descriptionWidget,
    this.hasLogo = true,
    this.logo,
    this.logoWidget,
    this.logoAssetPath,
    this.onLogoTap,
    this.hasBadgeBar = true,
    this.hasBadgeOne = false,
    this.badge1Label = 'Label',
    this.hasBadgeTwo = true,
    this.badge2Label = 'Label',
    this.hasBadgeThree = true,
    this.badge3Label = 'Label',
    this.badges,
  });

  /// Convenience constructor for a wide-layout [BioMarker].
  const BioMarker.wide({
    super.key,
    this.device = BioMarkerDevice.auto,
    this.title = 'Title',
    this.titleWidget,
    this.hasSubtitle = true,
    this.subtitle = 'Subtitle',
    this.subtitleWidget,
    this.hasDescription = true,
    this.description = 'Description',
    this.descriptionWidget,
    this.hasLogo = true,
    this.logo,
    this.logoWidget,
    this.logoAssetPath,
    this.onLogoTap,
    this.hasBadgeBar = true,
    this.hasBadgeOne = false,
    this.badge1Label = 'Label',
    this.hasBadgeTwo = true,
    this.badge2Label = 'Label',
    this.hasBadgeThree = true,
    this.badge3Label = 'Label',
    this.badges,
  }) : type = BioMarkerType.wide;

  Widget _buildLogo(bool isMobile) {
    final double size = isMobile ? 48.0 : 84.0;
    final double radius = isMobile ? 12.0 : 24.0;

    Widget logoContent;
    if (logoWidget != null) {
      logoContent = logoWidget!;
    } else if (logo != null) {
      logoContent = Image(
        image: logo!,
        width: size,
        height: size,
        fit: BoxFit.contain,
      );
    } else if (logoAssetPath != null) {
      logoContent = Image.asset(
        logoAssetPath!,
        width: size,
        height: size,
        fit: BoxFit.contain,
      );
    } else {
      logoContent = Image.asset(
        'assets/alter_logo.png',
        package: 'alter',
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          'assets/alter_logo.png',
          width: size,
          height: size,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.grid_view_rounded,
            size: isMobile ? 24 : 40,
            color: AlterSemanticTokens.textPrimary,
          ),
        ),
      );
    }

    Widget container = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AlterSemanticTokens.baseWhite,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: AlterSemanticTokens.stroke100,
          width: 1.0,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      alignment: Alignment.center,
      child: logoContent,
    );

    if (onLogoTap != null) {
      container = InkWell(
        onTap: onLogoTap,
        borderRadius: BorderRadius.circular(radius),
        child: container,
      );
    }

    return container;
  }

  Widget _buildBadges() {
    if (!hasBadgeBar) return const SizedBox.shrink();

    if (badges != null && badges!.isNotEmpty) {
      return Wrap(
        spacing: 12,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: badges!,
      );
    }

    final activeBadges = <Widget>[];
    if (hasBadgeOne) {
      activeBadges.add(
        Badge(
          label: badge1Label,
          color: BadgeColor.slate,
          hasAction: false,
          hasLeftIcon: false,
          hasRightIcon: false,
        ),
      );
    }
    if (hasBadgeTwo) {
      activeBadges.add(
        Badge(
          label: badge2Label,
          color: BadgeColor.slate,
          hasAction: false,
          hasLeftIcon: false,
          hasRightIcon: false,
        ),
      );
    }
    if (hasBadgeThree) {
      activeBadges.add(
        Badge(
          label: badge3Label,
          color: BadgeColor.slate,
          hasAction: false,
          hasLeftIcon: false,
          hasRightIcon: false,
        ),
      );
    }

    if (activeBadges.isEmpty) return const SizedBox.shrink();

    return Wrap(
      spacing: 12,
      runSpacing: 8,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: activeBadges,
    );
  }

  Widget _buildTitleSection(bool isMobile) {
    final titleStyle = isMobile
        ? AlterTypography.h4.copyWith(color: AlterSemanticTokens.textPrimary)
        : AlterTypography.h2.copyWith(color: AlterSemanticTokens.textPrimary);

    final subtitleStyle = isMobile
        ? AlterTypography.caption.copyWith(color: AlterSemanticTokens.textPrimary)
        : AlterTypography.bodyLg.copyWith(color: AlterSemanticTokens.textPrimary);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget ??
            Text(
              title,
              style: titleStyle,
            ),
        if (hasSubtitle) ...[
          const SizedBox(height: 4),
          subtitleWidget ??
              Text(
                subtitle,
                style: subtitleStyle,
              ),
        ],
      ],
    );
  }

  Widget _buildHeader(bool isMobile, bool isWide) {
    final titleSection = _buildTitleSection(isMobile);
    final badgeSection = _buildBadges();

    if (isWide) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: titleSection),
          if (hasBadgeBar) ...[
            const SizedBox(width: 24),
            badgeSection,
          ],
        ],
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleSection,
        if (hasBadgeBar) ...[
          const SizedBox(height: 8),
          badgeSection,
        ],
      ],
    );
  }

  Widget _buildBioSection(bool isMobile) {
    if (!hasDescription) return const SizedBox.shrink();

    final descriptionStyle = isMobile
        ? AlterTypography.body.copyWith(color: AlterSemanticTokens.textSecondary)
        : AlterTypography.bodyLg.copyWith(color: AlterSemanticTokens.textSecondary);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          color: AlterSemanticTokens.stroke200,
          thickness: 1.0,
        ),
        const SizedBox(height: 16),
        descriptionWidget ??
            Text(
              description,
              style: descriptionStyle,
            ),
      ],
    );
  }

  Widget _buildContent(bool isMobile) {
    final isWide = type == BioMarkerType.wide;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasLogo) ...[
          _buildLogo(isMobile),
          const SizedBox(width: 16),
        ],
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(isMobile, isWide),
              if (hasDescription) ...[
                const SizedBox(height: 16),
                _buildBioSection(isMobile),
              ],
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (device == BioMarkerDevice.web) {
      return _buildContent(false);
    }
    if (device == BioMarkerDevice.mobile) {
      return _buildContent(true);
    }

    // Auto-responsive mode: First check ambient AlterDeviceScope from parent grid/marker
    final ambientDevice = AlterDeviceScope.maybeOf(context);
    if (ambientDevice != null) {
      return _buildContent(ambientDevice == AlterDevice.mobile);
    }

    // Fallback: Adapt based on available layout width
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;
        return _buildContent(isMobile);
      },
    );
  }
}
