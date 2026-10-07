import 'package:flutter/material.dart';
import '../../components/buttons/button_icon.dart';
import '../../components/buttons/button_text.dart';
import '../../components/status/toast.dart';
import '../../foundations/device_scope.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Target device / viewport modes for [ProjectHeroBlock].
enum ProjectHeroBlockDevice {
  /// Automatically adapts based on parent width (< 500px triggers mobile layout) or ambient [AlterDeviceScope].
  auto,

  /// Forces PC / Desktop layout (max width 896px).
  pc,

  /// Forces Mobile layout (max width 316px).
  mobile,
}

/// Data model representing a key-value detail pair in [ProjectHeroBlock].
class ProjectDetailItem {
  /// Label descriptor (e.g. 'Client', 'Platform', 'Year', 'Status').
  final String label;

  /// Value text (e.g. 'Siemens', 'Web & Mobile', '2026', 'Shipped').
  final String value;

  /// Creates a [ProjectDetailItem].
  const ProjectDetailItem({
    required this.label,
    required this.value,
  });
}

/// Data model representing an availability action button in [ProjectHeroBlock].
class ProjectHeroAction {
  /// Action button label (used for PC [ButtonText]).
  final String label;

  /// Action icon (used for Mobile [ButtonIcon]).
  final IconData icon;

  /// Tap callback.
  final VoidCallback? onTap;

  /// Button theme type (primary or gray).
  final ButtonType type;

  /// Creates a [ProjectHeroAction].
  const ProjectHeroAction({
    required this.label,
    required this.icon,
    this.onTap,
    this.type = ButtonType.gray,
  });
}

/// A responsive project case study hero block with logo, title, metadata grid, notice banner, tech stack, and action links.
///
/// Figma Specifications (Node `802:8220` - `ProjectHeroBlock`):
/// - Variants:
///   - `device=PC` (`802:8221`): Width 896px, Column layout, 24px gap.
///     - Logo Container: 84x84px, 24px corner radius, `#FFFFFF` bg, 1px `#F3F4F6` stroke.
///     - Title: 40px Geist Bold ([AlterTypography.displayBold]), lineHeight 52px, textPrimary (`#000000`).
///     - Description: 16px Geist Regular ([AlterTypography.bodyLg]), lineHeight 20px, textSecondary (`#4A5565`).
///     - Details: Row, 32px gap, 4 columns (16px label + 20px value).
///     - Notice: [Toast] banner with `status=Caution` (yellow `#FDC700`, 16px radius).
///     - StackBar: Row (64px gap) containing "Built with" tech icons (48x48px, 12px radius) and "Available on" action [ButtonText] buttons.
///   - `device=Mobile` (`802:8605`): Width 316px, Column layout, 24px gap.
///     - Logo Container: 48x48px, 16px corner radius, `#FFFFFF` bg, 1px `#F3F4F6` stroke.
///     - Title: 30px Geist Bold ([AlterTypography.h1Bold]), lineHeight 36px, textPrimary (`#000000`).
///     - Description: 16px Geist Regular ([AlterTypography.bodyLg]), lineHeight 20px, textSecondary (`#4A5565`).
///     - Details: 2x2 Grid, 16px gap (14px label + 18px value).
///     - Notice: [Toast] banner with `status=Caution`.
///     - StackBar: Column (24px gap) containing "Built with" tech icons and "Available on" [ButtonIcon] 48x48px buttons.
class ProjectHeroBlock extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release matching Figma Node 802:8220 (ProjectHeroBlock: device=PC/Mobile).
  static const String version = '1.0.0';

  /// Optional fixed width constraint for the block.
  final double? width;

  /// Viewport mode (`auto`, `pc`, or `mobile`).
  final ProjectHeroBlockDevice device;

  /// Width threshold below which mobile layout is activated (defaults to 500.0).
  final double breakpoint;

  /// Project headline title text.
  final String title;

  /// Custom widget override for the title.
  final Widget? titleWidget;

  /// Project description text.
  final String? description;

  /// Custom widget override for the description.
  final Widget? descriptionWidget;

  /// Whether the description is displayed (defaults to true).
  final bool hasDescription;

  /// Image provider for the project logo.
  final ImageProvider? logo;

  /// Network URL for the project logo.
  final String? logoUrl;

  /// Local asset path for the project logo.
  final String? logoAssetPath;

  /// Custom widget override for the logo.
  final Widget? logoWidget;

  /// Whether the logo container is displayed (defaults to true).
  final bool hasLogo;

  /// List of project metadata key-value items (Client, Platform, Year, Status).
  final List<ProjectDetailItem>? details;

  /// Whether the details metadata section is displayed (defaults to true).
  final bool hasDetails;

  /// Whether the notice / toast banner is displayed (defaults to true).
  final bool hasNotice;

  /// Text for the notice / toast banner.
  final String noticeText;

  /// Status theme for the notice banner (defaults to [ToastStatus.caution]).
  final ToastStatus noticeStatus;

  /// Custom widget override for the notice banner.
  final Widget? noticeWidget;

  /// Section label for the technology stack (defaults to 'Built with').
  final String techStackLabel;

  /// Whether the technology stack is displayed (defaults to true).
  final bool hasTechStack;

  /// List of technology stack logo widgets or icons.
  final List<Widget>? techLogos;

  /// Section label for availability (defaults to 'Available on').
  final String availabilityLabel;

  /// Whether availability actions are displayed (defaults to true).
  final bool hasAvailability;

  /// List of availability actions.
  final List<ProjectHeroAction>? actions;

  /// Custom widget override for the availability action bar.
  final Widget? actionsWidget;

  /// Creates a [ProjectHeroBlock] instance.
  const ProjectHeroBlock({
    super.key,
    this.width,
    this.device = ProjectHeroBlockDevice.auto,
    this.breakpoint = 500.0,
    this.title = 'Title -\nSubtitle',
    this.titleWidget,
    this.description = 'Description of the project',
    this.descriptionWidget,
    this.hasDescription = true,
    this.logo,
    this.logoUrl,
    this.logoAssetPath,
    this.logoWidget,
    this.hasLogo = true,
    this.details,
    this.hasDetails = true,
    this.hasNotice = true,
    this.noticeText = 'Feedback Text',
    this.noticeStatus = ToastStatus.caution,
    this.noticeWidget,
    this.techStackLabel = 'Built with',
    this.hasTechStack = true,
    this.techLogos,
    this.availabilityLabel = 'Available on',
    this.hasAvailability = true,
    this.actions,
    this.actionsWidget,
  });

  /// Default metadata items matching Figma Node 802:8220.
  static List<ProjectDetailItem> defaultDetails() {
    return const [
      ProjectDetailItem(label: 'Client', value: 'Client'),
      ProjectDetailItem(label: 'Platform', value: 'Platform'),
      ProjectDetailItem(label: 'Year', value: 'Year'),
      ProjectDetailItem(label: 'Status', value: 'Status'),
    ];
  }

  /// Default availability actions matching Figma Node 802:8220.
  static List<ProjectHeroAction> defaultActions() {
    return const [
      ProjectHeroAction(
        label: 'Flutter’s Pub.Dev',
        icon: Icons.developer_mode,
        type: ButtonType.primary,
      ),
      ProjectHeroAction(
        label: 'Github',
        icon: Icons.design_services,
        type: ButtonType.gray,
      ),
      ProjectHeroAction(
        label: 'Figma',
        icon: Icons.favorite_border,
        type: ButtonType.gray,
      ),
    ];
  }

  /// Default technology logo tiles matching Figma Node 802:8220.
  static List<Widget> defaultTechLogos() {
    return [
      _buildTechTile(const Icon(Icons.flutter_dash, size: 28, color: Color(0xFF02569B))),
      _buildTechTile(const Icon(Icons.code_rounded, size: 28, color: AlterSemanticTokens.textSecondary)),
    ];
  }

  static Widget _buildTechTile(Widget icon) {
    return Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
        color: AlterSemanticTokens.baseWhite,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AlterSemanticTokens.stroke100, width: 1.0),
      ),
      child: Center(child: icon),
    );
  }

  Widget _buildLogo(bool isPc) {
    final double size = isPc ? 84.0 : 48.0;
    final BorderRadius radius = BorderRadius.circular(isPc ? 24.0 : 16.0);

    if (logoWidget != null) {
      return SizedBox(
        width: size,
        height: size,
        child: logoWidget,
      );
    }

    Widget content;
    if (logo != null) {
      content = Image(image: logo!, fit: BoxFit.contain);
    } else if (logoUrl != null && logoUrl!.isNotEmpty) {
      content = Image.network(logoUrl!, fit: BoxFit.contain);
    } else if (logoAssetPath != null && logoAssetPath!.isNotEmpty) {
      content = Image.asset(logoAssetPath!, fit: BoxFit.contain);
    } else {
      content = Icon(
        Icons.hub_outlined,
        size: isPc ? 44.0 : 28.0,
        color: AlterSemanticTokens.textPrimary,
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AlterSemanticTokens.baseWhite,
        borderRadius: radius,
        border: Border.all(color: AlterSemanticTokens.stroke100, width: 1.0),
      ),
      clipBehavior: Clip.antiAlias,
      child: Center(child: content),
    );
  }

  Widget _buildDetails(bool isPc) {
    final effectiveDetails = details ?? defaultDetails();

    if (isPc) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: effectiveDetails.map((item) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.label,
                  style: AlterTypography.bodyLg.copyWith(
                    color: AlterSemanticTokens.textSecondary,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  item.value,
                  style: AlterTypography.h2.copyWith(
                    color: AlterSemanticTokens.textPrimary,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    }

    // Mobile: 2x2 Grid
    return LayoutBuilder(
      builder: (context, constraints) {
        final double itemWidth = (constraints.maxWidth - 16.0) / 2.0;

        return Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: effectiveDetails.map((item) {
            return SizedBox(
              width: itemWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.label,
                    style: AlterTypography.body.copyWith(
                      color: AlterSemanticTokens.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item.value,
                    style: AlterTypography.h3.copyWith(
                      color: AlterSemanticTokens.textPrimary,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildAvailabilityActions(bool isPc) {
    if (actionsWidget != null) {
      return actionsWidget!;
    }

    final effectiveActions = actions ?? defaultActions();

    if (isPc) {
      return Wrap(
        spacing: 12.0,
        runSpacing: 12.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: effectiveActions.map((act) {
          return ButtonText(
            type: act.type,
            size: ButtonSize.normal,
            label: act.label,
            hasIcon: false,
            onTap: act.onTap,
          );
        }).toList(),
      );
    }

    // Mobile: ButtonIcon 48x48
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: effectiveActions.map((act) {
        return ButtonIcon(
          type: act.type == ButtonType.primary ? ButtonIconType.primary : ButtonIconType.gray,
          icon: act.icon,
          onTap: act.onTap,
        );
      }).toList(),
    );
  }

  Widget _buildStackBar(bool isPc) {
    final effectiveTechLogos = techLogos ?? defaultTechLogos();

    final techStackWidget = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          techStackLabel,
          style: AlterTypography.body.copyWith(
            color: AlterSemanticTokens.textSecondary,
          ),
        ),
        const SizedBox(width: 12.0),
        Wrap(
          spacing: 12.0,
          runSpacing: 12.0,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: effectiveTechLogos,
        ),
      ],
    );

    final availabilityWidget = Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          availabilityLabel,
          style: AlterTypography.body.copyWith(
            color: AlterSemanticTokens.textSecondary,
          ),
        ),
        const SizedBox(width: 12.0),
        _buildAvailabilityActions(isPc),
      ],
    );

    if (isPc) {
      return Wrap(
        spacing: 64.0,
        runSpacing: 24.0,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          if (hasTechStack) techStackWidget,
          if (hasAvailability) availabilityWidget,
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (hasTechStack) techStackWidget,
        if (hasTechStack && hasAvailability) const SizedBox(height: 24.0),
        if (hasAvailability) availabilityWidget,
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
          ProjectHeroBlockDevice.auto => ambient != null
              ? ambient == AlterDevice.pc
              : targetWidth >= breakpoint,
          ProjectHeroBlockDevice.pc => true,
          ProjectHeroBlockDevice.mobile => false,
        };

        final TextStyle titleStyle = isPc
            ? AlterTypography.displayBold.copyWith(
                color: AlterSemanticTokens.textPrimary,
              )
            : AlterTypography.h1Bold.copyWith(
                color: AlterSemanticTokens.textPrimary,
              );

        final blockContent = AlterDeviceScope(
          device: isPc ? AlterDevice.pc : AlterDevice.mobile,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Project Header (Logo + Title)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (hasLogo) ...[
                    _buildLogo(isPc),
                    const SizedBox(height: 24.0),
                  ],
                  if (titleWidget != null)
                    titleWidget!
                  else
                    Text(
                      title,
                      style: titleStyle,
                    ),
                ],
              ),
              const SizedBox(height: 24.0),

              // 2. Description
              if (hasDescription && (description != null || descriptionWidget != null)) ...[
                if (descriptionWidget != null)
                  descriptionWidget!
                else
                  Text(
                    description!,
                    style: AlterTypography.bodyLg.copyWith(
                      color: AlterSemanticTokens.textSecondary,
                    ),
                  ),
                const SizedBox(height: 24.0),
              ],

              // 3. Project Details
              if (hasDetails) ...[
                _buildDetails(isPc),
                const SizedBox(height: 24.0),
              ],

              // 4. Notice / Toast Banner
              if (hasNotice) ...[
                if (noticeWidget != null)
                  noticeWidget!
                else
                  Toast(
                    label: noticeText,
                    status: noticeStatus,
                    width: double.infinity,
                  ),
                const SizedBox(height: 24.0),
              ],

              // 5. StackBar (Tech Stack + Availability)
              if (hasTechStack || hasAvailability) _buildStackBar(isPc),
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
