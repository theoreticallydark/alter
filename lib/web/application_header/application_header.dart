import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import 'application_header_button_icon.dart';
import 'application_header_button_text.dart';

/// A full-width desktop and web application header for the Alter Design System.
///
/// Figma Specifications (Node `706:8794` - `ApplicationHeader` / `device=Web`):
/// - Layout: 48px height horizontal bar, edge-to-edge layout, `#FFFFFF` background, 1px bottom border `#F3F4F6`.
/// - Left Group:
///   - Launcher Button (`hasLauncherButton`, 48x48 [ApplicationHeaderButtonIcon] with `Icons.apps`).
///   - Logo Container (`hasLogo`, 34x34px logo image/widget).
///   - Application Title (`applicationTitle`, [AlterTypography.h4Bold] 16px).
/// - Center Group (Navigation Tab Bar):
///   - Tab List (`hasPages`, centered row of [ApplicationHeaderButtonText] buttons).
/// - Right Group (Actions & Avatar):
///   - Action Buttons 1 to 4 (`showApplicationHeaderButton1..4` via [ApplicationHeaderButtonIcon]).
///   - Avatar Button (`showAvatarButton` via [ApplicationHeaderButtonIcon.avatar]).
class ApplicationHeader extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.1: Default logo uses alter_logo.png asset with full customization support (logo, logoWidget, logoAssetPath).
  /// v1.0.0: Initial release matching Figma Node 706:8794 (ApplicationHeader / device=Web).
  static const String version = '1.0.1';

  // Left Section Properties
  /// Whether the leading application launcher button (apps icon) is displayed.
  final bool hasLauncherButton;

  /// Icon rendered in the launcher button.
  final IconData launcherIcon;

  /// Callback executed when the launcher button is tapped.
  final VoidCallback? onLauncherTap;

  /// Whether the application logo is displayed.
  final bool hasLogo;

  /// Image provider for the application logo.
  final ImageProvider? logo;

  /// Custom widget override for the logo.
  final Widget? logoWidget;

  /// Custom asset path for the logo (defaults to 'assets/alter_logo.png').
  final String? logoAssetPath;

  /// Callback executed when the logo is tapped.
  final VoidCallback? onLogoTap;

  /// Whether the application title is displayed.
  final bool applicationTitle;

  /// Text string for the application title.
  final String title;

  /// Custom widget override for the application title.
  final Widget? titleWidget;

  /// Callback executed when the title is tapped.
  final VoidCallback? onTitleTap;

  // Center Navigation Section
  /// Whether the navigation tab list is displayed.
  final bool hasPages;

  /// List of tab/page string labels displayed in the center navigation bar.
  final List<String> pages;

  /// Currently active page index in the center navigation bar.
  final int selectedPageIndex;

  /// Callback fired when a navigation page item is selected.
  final ValueChanged<int>? onPageSelected;

  /// Custom list of navigation page widgets (overrides [pages] strings if provided).
  final List<Widget>? pageWidgets;

  // Right Actions Section
  /// Whether action button 1 is displayed.
  final bool showApplicationHeaderButton1;

  /// Icon rendered in action button 1.
  final IconData action1Icon;

  /// Custom widget override for action button 1.
  final Widget? action1Widget;

  /// Callback executed when action button 1 is tapped.
  final VoidCallback? onAction1Tap;

  /// Whether action button 2 is displayed.
  final bool showApplicationHeaderButton2;

  /// Icon rendered in action button 2.
  final IconData action2Icon;

  /// Custom widget override for action button 2.
  final Widget? action2Widget;

  /// Callback executed when action button 2 is tapped.
  final VoidCallback? onAction2Tap;

  /// Whether action button 3 is displayed.
  final bool showApplicationHeaderButton3;

  /// Icon rendered in action button 3.
  final IconData action3Icon;

  /// Custom widget override for action button 3.
  final Widget? action3Widget;

  /// Callback executed when action button 3 is tapped.
  final VoidCallback? onAction3Tap;

  /// Whether action button 4 is displayed.
  final bool showApplicationHeaderButton4;

  /// Icon rendered in action button 4.
  final IconData action4Icon;

  /// Custom widget override for action button 4.
  final Widget? action4Widget;

  /// Callback executed when action button 4 is tapped.
  final VoidCallback? onAction4Tap;

  /// Whether the user profile avatar button is displayed.
  final bool showAvatarButton;

  /// Custom avatar widget override.
  final Widget? avatar;

  /// Image provider for the profile avatar.
  final ImageProvider? avatarImage;

  /// Network image URL for the profile avatar.
  final String? avatarImageUrl;

  /// Initials text fallback for the profile avatar (e.g. 'RC').
  final String? avatarInitials;

  /// Callback executed when the avatar button is tapped.
  final VoidCallback? onAvatarTap;

  // Styling & Customization
  /// Background color of the header bar.
  final Color? backgroundColor;

  /// Bottom border color of the header bar.
  final Color? borderColor;

  /// Creates an [ApplicationHeader] instance.
  const ApplicationHeader({
    super.key,
    this.hasLauncherButton = true,
    this.launcherIcon = Icons.apps_rounded,
    this.onLauncherTap,
    this.hasLogo = true,
    this.logo,
    this.logoWidget,
    this.logoAssetPath,
    this.onLogoTap,
    this.applicationTitle = true,
    this.title = 'Application Title',
    this.titleWidget,
    this.onTitleTap,
    this.hasPages = true,
    this.pages = const ['Label', 'Label', 'Label', 'Label', 'Label'],
    this.selectedPageIndex = 0,
    this.onPageSelected,
    this.pageWidgets,
    this.showApplicationHeaderButton1 = true,
    this.action1Icon = Icons.face_outlined,
    this.action1Widget,
    this.onAction1Tap,
    this.showApplicationHeaderButton2 = true,
    this.action2Icon = Icons.face_outlined,
    this.action2Widget,
    this.onAction2Tap,
    this.showApplicationHeaderButton3 = true,
    this.action3Icon = Icons.face_outlined,
    this.action3Widget,
    this.onAction3Tap,
    this.showApplicationHeaderButton4 = true,
    this.action4Icon = Icons.face_outlined,
    this.action4Widget,
    this.onAction4Tap,
    this.showAvatarButton = true,
    this.avatar,
    this.avatarImage,
    this.avatarImageUrl,
    this.avatarInitials,
    this.onAvatarTap,
    this.backgroundColor,
    this.borderColor,
  });

  Widget _buildLogo() {
    if (logoWidget != null) return logoWidget!;
    if (logo != null) {
      return Image(
        image: logo!,
        width: 34,
        height: 34,
        fit: BoxFit.contain,
      );
    }
    if (logoAssetPath != null) {
      return Image.asset(
        logoAssetPath!,
        width: 34,
        height: 34,
        fit: BoxFit.contain,
      );
    }
    // Default: load Alter logo from package asset with fallbacks
    return Image.asset(
      'lib/assets/alter_logo.png',
      package: 'alter',
      width: 34,
      height: 34,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) => Image.asset(
        'assets/alter_logo.png',
        width: 34,
        height: 34,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AlterSemanticTokens.baseGray,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.water_drop_outlined,
            size: 20,
            color: AlterSemanticTokens.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildLeftSection() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (hasLauncherButton)
          ApplicationHeaderButtonIcon(
            icon: launcherIcon,
            onTap: onLauncherTap,
          ),
        if (hasLogo)
          InkWell(
            onTap: onLogoTap,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              alignment: Alignment.center,
              child: _buildLogo(),
            ),
          ),
        if (applicationTitle)
          InkWell(
            onTap: onTitleTap,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              alignment: Alignment.center,
              child: titleWidget ??
                  Text(
                    title,
                    style: AlterTypography.h4Bold.copyWith(
                      color: AlterSemanticTokens.textPrimary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            ),
          ),
      ],
    );
  }

  Widget _buildCenterSection() {
    if (!hasPages) return const Spacer();

    if (pageWidgets != null && pageWidgets!.isNotEmpty) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: pageWidgets!,
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < pages.length; i++)
                  ApplicationHeaderButtonText(
                    label: pages[i],
                    isSelected: i == selectedPageIndex,
                    onTap: () => onPageSelected?.call(i),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRightSection() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showApplicationHeaderButton1)
          action1Widget ??
              ApplicationHeaderButtonIcon(
                icon: action1Icon,
                onTap: onAction1Tap,
              ),
        if (showApplicationHeaderButton2)
          action2Widget ??
              ApplicationHeaderButtonIcon(
                icon: action2Icon,
                onTap: onAction2Tap,
              ),
        if (showApplicationHeaderButton3)
          action3Widget ??
              ApplicationHeaderButtonIcon(
                icon: action3Icon,
                onTap: onAction3Tap,
              ),
        if (showApplicationHeaderButton4)
          action4Widget ??
              ApplicationHeaderButtonIcon(
                icon: action4Icon,
                onTap: onAction4Tap,
              ),
        if (showAvatarButton)
          ApplicationHeaderButtonIcon.avatar(
            avatar: avatar,
            avatarImage: avatarImage,
            avatarImageUrl: avatarImageUrl,
            avatarInitials: avatarInitials,
            onTap: onAvatarTap,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? AlterSemanticTokens.baseWhite,
        border: Border(
          bottom: BorderSide(
            color: borderColor ?? AlterSemanticTokens.baseBorder,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLeftSection(),
          _buildCenterSection(),
          _buildRightSection(),
        ],
      ),
    );
  }
}
