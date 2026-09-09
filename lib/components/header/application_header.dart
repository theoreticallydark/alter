import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_graphic_image.dart';
import '../buttons/button_graphic_text.dart';
import '../buttons/button_icon.dart';
import '../buttons/button_icon_ghost.dart';

class ApplicationHeader extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Added `hasReturnButton`, `onReturnTap`, custom action icons, and `profileImage` matching Figma node 119:5716.
  /// v1.0.2: Dynamically hug action elements with spacing only between adjacent active items, eliminating trailing space when subsequent actions are absent.
  /// v1.0.1: Updated outer layout to 24px padding all around and 16px itemSpacing between headerContainer and Slot as per Figma node 119:5716.
  static const String version = '1.1.0';

  final String title;
  final String subtitle;

  final bool hasReturnButton;
  final VoidCallback? onReturnTap;

  final bool hasStyleButton;
  final String styleButtonTitle;
  final String styleButtonSubtitle;
  final VoidCallback? onStyleButtonTap;

  final bool hasActionOne;
  final IconData actionOneIcon;
  final VoidCallback? onActionOneTap;

  final bool hasActionTwo;
  final IconData actionTwoIcon;
  final VoidCallback? onActionTwoTap;

  final bool hasProfileAction;
  final ImageProvider? profileImage;
  final VoidCallback? onProfileTap;

  final Widget? slot;

  const ApplicationHeader({
    super.key,
    this.title = 'Alter',
    this.subtitle = 'Design System',
    this.hasReturnButton = false,
    this.onReturnTap,
    this.hasStyleButton = true,
    this.styleButtonTitle = 'STREAK',
    this.styleButtonSubtitle = '7 DAYS',
    this.onStyleButtonTap,
    this.hasActionOne = true,
    this.actionOneIcon = Icons.favorite_border,
    this.onActionOneTap,
    this.hasActionTwo = false,
    this.actionTwoIcon = Icons.favorite_border,
    this.onActionTwoTap,
    this.hasProfileAction = true,
    this.profileImage,
    this.onProfileTap,
    this.slot,
  });

  @override
  Widget build(BuildContext context) {
    final actions = <Widget>[
      if (hasStyleButton)
        ButtonGraphicText(
          title: styleButtonTitle,
          subtitle: styleButtonSubtitle,
          onTap: onStyleButtonTap,
        ),
      if (hasActionOne)
        ButtonIcon(
          icon: actionOneIcon,
          type: ButtonIconType.gray,
          size: 48,
          onTap: onActionOneTap,
        ),
      if (hasActionTwo)
        ButtonIcon(
          icon: actionTwoIcon,
          type: ButtonIconType.gray,
          size: 48,
          onTap: onActionTwoTap,
        ),
      if (hasProfileAction)
        ButtonGraphicImage(
          image: profileImage,
          onTap: onProfileTap,
        ),
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AlterSemanticTokens.baseWhite,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Left Group (Return Button + Title/Subtitle)
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (hasReturnButton) ...[
                      ButtonIconGhost(
                        icon: Icons.chevron_left,
                        size: 32,
                        type: ButtonIconGhostType.primary,
                        onTap: onReturnTap,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: AlterTypography.h1Serif.copyWith(
                              color: AlterSemanticTokens.textPrimary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            subtitle,
                            style: AlterTypography.caption.copyWith(
                              color: AlterSemanticTokens.textSecondary,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Right Group (Actions: dynamic hugging without trailing margin)
              if (actions.isNotEmpty) ...[
                const SizedBox(width: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < actions.length; i++) ...[
                      if (i > 0) const SizedBox(width: 8),
                      actions[i],
                    ],
                  ],
                ),
              ],
            ],
          ),

          // Slot Container
          ClipRect(
            child: AnimatedCrossFade(
              alignment: Alignment.topCenter,
              firstChild: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 16),
                  slot ?? const SizedBox.shrink(),
                ],
              ),
              secondChild: const SizedBox(width: double.infinity, height: 0),
              crossFadeState: slot != null
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
              firstCurve: Curves.easeInOutCubic,
              secondCurve: Curves.easeInOutCubic,
              sizeCurve: Curves.easeInOutCubic,
            ),
          ),
        ],
      ),
    );
  }
}
