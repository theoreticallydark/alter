import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import 'package:alter/components/header/application_header_button_icon.dart';
import 'package:alter/components/header/application_header_button_text.dart';
import '../toast_helper.dart';

WidgetbookFolder headerCategory() {
  return WidgetbookFolder(
    name: 'Header',
    children: [
      WidgetbookComponent(
        name: 'ApplicationHeader',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive (Web & Desktop)',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Application Title',
              );

              final applicationTitle = context.knobs.boolean(
                label: 'Show Title',
                initialValue: true,
              );

              final hasLauncherButton = context.knobs.boolean(
                label: 'Has Launcher Button',
                initialValue: true,
              );

              final hasLogo = context.knobs.boolean(
                label: 'Has Logo',
                initialValue: true,
              );

              final hasPages = context.knobs.boolean(
                label: 'Has Pages',
                initialValue: true,
              );

              final showAction1 = context.knobs.boolean(
                label: 'Show Action Button 1',
                initialValue: true,
              );

              final showAction2 = context.knobs.boolean(
                label: 'Show Action Button 2',
                initialValue: true,
              );

              final showAction3 = context.knobs.boolean(
                label: 'Show Action Button 3',
                initialValue: true,
              );

              final showAction4 = context.knobs.boolean(
                label: 'Show Action Button 4',
                initialValue: true,
              );

              final showAvatar = context.knobs.boolean(
                label: 'Show Avatar Button',
                initialValue: true,
              );

              return _StatefulApplicationHeaderPreview(
                title: title,
                applicationTitle: applicationTitle,
                hasLauncherButton: hasLauncherButton,
                hasLogo: hasLogo,
                hasPages: hasPages,
                showAction1: showAction1,
                showAction2: showAction2,
                showAction3: showAction3,
                showAction4: showAction4,
                showAvatar: showAvatar,
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FULL WEB HEADER (Figma Node 706:8794)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const _StatefulApplicationHeaderPreview(
                        title: 'Application Title',
                        hasLauncherButton: true,
                        hasLogo: true,
                        hasPages: true,
                        showAction1: true,
                        showAction2: true,
                        showAction3: true,
                        showAction4: true,
                        showAvatar: true,
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'MINIMAL LOGO & TITLE ONLY',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const ApplicationHeader(
                        title: 'Workspace',
                        hasPages: false,
                        showApplicationHeaderButton1: false,
                        showApplicationHeaderButton2: false,
                        showApplicationHeaderButton3: false,
                        showApplicationHeaderButton4: false,
                        showAvatarButton: true,
                        avatarInitials: 'JD',
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'MobileApplicationHeader',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive (Mobile)',
            builder: (context) {
              final showSlot = context.knobs.boolean(
                label: 'Show Search in Slot',
                initialValue: false,
              );
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Alter',
              );
              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'Design System',
              );
              final hasReturnButton = context.knobs.boolean(
                label: 'Has Return Button',
                initialValue: false,
              );

              return Align(
                alignment: Alignment.topCenter,
                child: MobileApplicationHeader(
                  title: title,
                  subtitle: subtitle,
                  hasReturnButton: hasReturnButton,
                  onReturnTap: () => showExampleToast(
                    context,
                    'Clicked MobileApplicationHeader Return Button',
                  ),
                  hasStyleButton: context.knobs.boolean(
                    label: 'Has Streak Button',
                    initialValue: true,
                  ),
                  styleButtonTitle: context.knobs.string(
                    label: 'Streak Title',
                    initialValue: 'STREAK',
                  ),
                  styleButtonSubtitle: context.knobs.string(
                    label: 'Streak Subtitle',
                    initialValue: '7 DAYS',
                  ),
                  onStyleButtonTap: () => showExampleToast(
                    context,
                    'Clicked Streak Button in Header',
                  ),
                  hasActionOne: context.knobs.boolean(
                    label: 'Has Action 1 (Favorite)',
                    initialValue: true,
                  ),
                  onActionOneTap: () => showExampleToast(
                    context,
                    'Clicked Header Action 1 (Favorite)',
                  ),
                  hasActionTwo: context.knobs.boolean(
                    label: 'Has Action 2',
                    initialValue: false,
                  ),
                  onActionTwoTap: () => showExampleToast(
                    context,
                    'Clicked Header Action 2',
                  ),
                  hasProfileAction: context.knobs.boolean(
                    label: 'Has Profile Action',
                    initialValue: true,
                  ),
                  onProfileTap: () => showExampleToast(
                    context,
                    'Clicked Header Profile Avatar',
                  ),
                  slot: showSlot
                      ? SearchInput(
                          placeholder: 'Search inside header slot...',
                          onTap: () => showExampleToast(
                            context,
                            'Tapped Header Slot Search',
                          ),
                        )
                      : null,
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'ApplicationHeaderButtonIcon',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: ApplicationHeaderButtonIconType.values,
                labelBuilder: (t) => t.name,
                initialOption: ApplicationHeaderButtonIconType.defaultType,
              );

              final isSelected = context.knobs.boolean(
                label: 'Is Selected / Active',
                initialValue: false,
              );

              final icon = context.knobs.objectOrNull.dropdown<IconData?>(
                label: 'Icon (Type=Default)',
                options: const [
                  Icons.face_outlined,
                  Icons.search_rounded,
                  Icons.favorite_border_rounded,
                  Icons.notifications_none_rounded,
                  Icons.settings_outlined,
                ],
                labelBuilder: (i) {
                  if (i == Icons.face_outlined) return 'Face (Default)';
                  if (i == Icons.search_rounded) return 'Search';
                  if (i == Icons.favorite_border_rounded) return 'Favorite';
                  if (i == Icons.notifications_none_rounded) return 'Notifications';
                  if (i == Icons.settings_outlined) return 'Settings';
                  return 'Custom';
                },
                initialOption: Icons.face_outlined,
              );

              final avatarInitials = context.knobs.stringOrNull(
                label: 'Avatar Initials (Type=Avatar)',
                initialValue: 'RC',
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ApplicationHeaderButtonIcon(
                    type: type,
                    icon: icon,
                    avatarInitials: avatarInitials,
                    isSelected: isSelected,
                    onTap: () => showExampleToast(
                      context,
                      'ApplicationHeaderButtonIcon tapped (${type.name})',
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ICON VARIANTS (Figma Node 542:9072)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Wrap(
                        spacing: 16,
                        children: [
                          ApplicationHeaderButtonIcon(
                            icon: Icons.face_outlined,
                            isSelected: false,
                          ),
                          ApplicationHeaderButtonIcon(
                            icon: Icons.face_outlined,
                            isHovered: true,
                          ),
                          ApplicationHeaderButtonIcon(
                            icon: Icons.search_rounded,
                            isSelected: true,
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'AVATAR VARIANTS',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Wrap(
                        spacing: 16,
                        children: [
                          ApplicationHeaderButtonIcon.avatar(
                            avatarInitials: 'RC',
                            isSelected: false,
                          ),
                          ApplicationHeaderButtonIcon.avatar(
                            avatarInitials: 'RC',
                            isHovered: true,
                          ),
                          ApplicationHeaderButtonIcon.avatar(
                            avatarImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
                            isSelected: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'ApplicationHeaderButtonText',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Label',
              );

              final isSelected = context.knobs.boolean(
                label: 'Is Selected / Active',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: ApplicationHeaderButtonText(
                    label: label,
                    isSelected: isSelected,
                    onTap: () => showExampleToast(
                      context,
                      'ApplicationHeaderButtonText tapped: "$label"',
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TEXT VARIANTS (Figma Node 760:3612)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Wrap(
                        spacing: 16,
                        children: [
                          ApplicationHeaderButtonText(
                            label: 'Default State',
                            isSelected: false,
                          ),
                          ApplicationHeaderButtonText(
                            label: 'Hover State',
                            isHovered: true,
                          ),
                          ApplicationHeaderButtonText(
                            label: 'Selected State',
                            isSelected: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}

class _StatefulApplicationHeaderPreview extends StatefulWidget {
  final String title;
  final bool applicationTitle;
  final bool hasLauncherButton;
  final bool hasLogo;
  final bool hasPages;
  final bool showAction1;
  final bool showAction2;
  final bool showAction3;
  final bool showAction4;
  final bool showAvatar;

  const _StatefulApplicationHeaderPreview({
    required this.title,
    this.applicationTitle = true,
    this.hasLauncherButton = true,
    this.hasLogo = true,
    this.hasPages = true,
    this.showAction1 = true,
    this.showAction2 = true,
    this.showAction3 = true,
    this.showAction4 = true,
    this.showAvatar = true,
  });

  @override
  State<_StatefulApplicationHeaderPreview> createState() =>
      _StatefulApplicationHeaderPreviewState();
}

class _StatefulApplicationHeaderPreviewState
    extends State<_StatefulApplicationHeaderPreview> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ApplicationHeader(
      title: widget.title,
      applicationTitle: widget.applicationTitle,
      hasLauncherButton: widget.hasLauncherButton,
      onLauncherTap: () => showExampleToast(context, 'Launcher button tapped'),
      hasLogo: widget.hasLogo,
      onLogoTap: () => showExampleToast(context, 'Logo tapped'),
      onTitleTap: () => showExampleToast(context, 'Title tapped: "${widget.title}"'),
      hasPages: widget.hasPages,
      pages: const ['Overview', 'Projects', 'Analytics', 'Reports', 'Settings'],
      selectedPageIndex: _selectedPageIndex,
      onPageSelected: (idx) {
        setState(() => _selectedPageIndex = idx);
        showExampleToast(context, 'Selected page tab $idx');
      },
      showApplicationHeaderButton1: widget.showAction1,
      onAction1Tap: () => showExampleToast(context, 'Action 1 tapped'),
      showApplicationHeaderButton2: widget.showAction2,
      onAction2Tap: () => showExampleToast(context, 'Action 2 tapped'),
      showApplicationHeaderButton3: widget.showAction3,
      onAction3Tap: () => showExampleToast(context, 'Action 3 tapped'),
      showApplicationHeaderButton4: widget.showAction4,
      onAction4Tap: () => showExampleToast(context, 'Action 4 tapped'),
      showAvatarButton: widget.showAvatar,
      avatarInitials: 'RC',
      onAvatarTap: () => showExampleToast(context, 'Avatar tapped (Roberta Casas)'),
    );
  }
}
