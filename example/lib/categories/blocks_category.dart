import 'package:flutter/material.dart' hide Badge, Divider;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder blocksCategory() {
  return WidgetbookFolder(
    name: 'Blocks',
    children: [
      WidgetbookComponent(
        name: 'HeroBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device Adaptation',
                options: HeroBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: HeroBlockDevice.auto,
              );

              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Hi, I am Nayan &\nI build things.',
              );

              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'Principal UX Designer & Engineer @SIG',
              );

              final hasSubtitle = context.knobs.boolean(
                label: 'Has Subtitle',
                initialValue: true,
              );

              final hasAvatar = context.knobs.boolean(
                label: 'Has Avatar',
                initialValue: true,
              );

              final hasActions = context.knobs.boolean(
                label: 'Has Actions',
                initialValue: true,
              );

              final primaryLabel = context.knobs.string(
                label: 'Primary Button Label',
                initialValue: 'Book a call',
              );

              final secondaryLabel = context.knobs.string(
                label: 'Secondary Button Label',
                initialValue: 'Download CV',
              );

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: HeroBlock(
                      device: device,
                      avatarUrl:
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300',
                      title: title,
                      subtitle: subtitle,
                      hasSubtitle: hasSubtitle,
                      hasAvatar: hasAvatar,
                      hasActions: hasActions,
                      primaryButtonLabel: primaryLabel,
                      secondaryButtonLabel: secondaryLabel,
                      onPrimaryTap: () =>
                          showExampleToast(context, 'Tapped Primary Action'),
                      onSecondaryTap: () =>
                          showExampleToast(context, 'Tapped Secondary Action'),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              const avatarUrl =
                  'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=300';

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC / DESKTOP (Figma Node 761:6374)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 896,
                        child: HeroBlock(
                          device: HeroBlockDevice.pc,
                          avatarUrl: avatarUrl,
                          title: 'Hi, I am Nayan &\nI build things.',
                          subtitle: 'Principal UX Designer & Engineer @SIG',
                        ),
                      ),
                      const SizedBox(height: 64),
                      Text(
                        'MOBILE (Figma Node 761:6392)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 316,
                        child: HeroBlock(
                          device: HeroBlockDevice.mobile,
                          avatarUrl: avatarUrl,
                          title: 'Hi, I am Nayan &\nI build things.',
                          subtitle: 'Principal UX Designer & Engineer @SIG',
                        ),
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
        name: 'BrandBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device Adaptation',
                options: BrandBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: BrandBlockDevice.auto,
              );

              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'I have architected design systems at',
              );

              final hasTitle = context.knobs.boolean(
                label: 'Has Title',
                initialValue: true,
              );

              final spacing = context.knobs.double.slider(
                label: 'Item Spacing',
                initialValue: 12.0,
                min: 4.0,
                max: 32.0,
              );

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: BrandBlock(
                      device: device,
                      title: title,
                      hasTitle: hasTitle,
                      spacing: spacing,
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC / DESKTOP (Figma Node 761:6544 - 896px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 896,
                        child: BrandBlock(
                          device: BrandBlockDevice.pc,
                        ),
                      ),
                      const SizedBox(height: 64),
                      Text(
                        'MOBILE (Figma Node 761:6552 - 316px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 316,
                        child: BrandBlock(
                          device: BrandBlockDevice.mobile,
                        ),
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
        name: 'HeaderBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device Adaptation',
                options: HeaderBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: HeaderBlockDevice.auto,
              );

              final header = context.knobs.string(
                label: 'Header Text',
                initialValue: 'Experiences',
              );

              final hasDivider = context.knobs.boolean(
                label: 'Has Divider',
                initialValue: true,
              );

              final gap = context.knobs.double.slider(
                label: 'Divider-to-Header Gap',
                initialValue: 48.0,
                min: 12.0,
                max: 96.0,
              );

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: HeaderBlock(
                      device: device,
                      header: header,
                      hasDivider: hasDivider,
                      gap: gap,
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC / DESKTOP (Figma Node 761:6853 - 896px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 896,
                        child: HeaderBlock(
                          device: HeaderBlockDevice.pc,
                          header: 'Experiences',
                        ),
                      ),
                      const SizedBox(height: 64),
                      Text(
                        'MOBILE (Figma Node 761:6861 - 316px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 316,
                        child: HeaderBlock(
                          device: HeaderBlockDevice.mobile,
                          header: 'Experiences',
                        ),
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
        name: 'ProjectHeroBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device Adaptation',
                options: ProjectHeroBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: ProjectHeroBlockDevice.auto,
              );

              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Title -\nSubtitle',
              );

              final description = context.knobs.string(
                label: 'Description',
                initialValue: 'Description of the project',
              );

              final hasDescription = context.knobs.boolean(
                label: 'Has Description',
                initialValue: true,
              );

              final hasLogo = context.knobs.boolean(
                label: 'Has Logo',
                initialValue: true,
              );

              final hasDetails = context.knobs.boolean(
                label: 'Has Details',
                initialValue: true,
              );

              final hasNotice = context.knobs.boolean(
                label: 'Has Notice',
                initialValue: true,
              );

              final noticeText = context.knobs.string(
                label: 'Notice Text',
                initialValue: 'Feedback Text',
              );

              final hasTechStack = context.knobs.boolean(
                label: 'Has Tech Stack',
                initialValue: true,
              );

              final hasAvailability = context.knobs.boolean(
                label: 'Has Availability Actions',
                initialValue: true,
              );

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: ProjectHeroBlock(
                      device: device,
                      title: title,
                      description: description,
                      hasDescription: hasDescription,
                      hasLogo: hasLogo,
                      hasDetails: hasDetails,
                      hasNotice: hasNotice,
                      noticeText: noticeText,
                      hasTechStack: hasTechStack,
                      hasAvailability: hasAvailability,
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC / DESKTOP (Figma Node 802:8221 - 896px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 896,
                        child: ProjectHeroBlock(
                          device: ProjectHeroBlockDevice.pc,
                        ),
                      ),
                      const SizedBox(height: 64),
                      Text(
                        'MOBILE (Figma Node 802:8605 - 316px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 316,
                        child: ProjectHeroBlock(
                          device: ProjectHeroBlockDevice.mobile,
                        ),
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
