import 'package:flutter/material.dart' hide Badge, Divider;
import 'package:video_player/video_player.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder sitesCategory() {
  return WidgetbookFolder(
    name: 'Sites',
    children: [
WidgetbookComponent(
        name: 'BiographyBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final type = context.knobs.object.dropdown(
                label: 'Layout Type',
                options: BiographyBlockType.values,
                labelBuilder: (t) => t.name,
                initialOption: BiographyBlockType.tall,
              );

              final device = context.knobs.object.dropdown(
                label: 'Device Adaptation',
                options: BiographyBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: BiographyBlockDevice.auto,
              );

              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Alter Design System',
              );

              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'Component Library & Foundation',
              );

              final description = context.knobs.string(
                label: 'Description',
                initialValue:
                    'A modular, high-fidelity Flutter design system crafted from Figma specifications with curated Geist typography and semantic tokens.',
              );

              final hasLogo = context.knobs.boolean(
                label: 'Has Logo',
                initialValue: true,
              );

              final hasSubtitle = context.knobs.boolean(
                label: 'Has Subtitle',
                initialValue: true,
              );

              final hasBadgeBar = context.knobs.boolean(
                label: 'Has Badge Bar',
                initialValue: true,
              );

              final hasBadgeOne = context.knobs.boolean(
                label: 'Has Badge 1',
                initialValue: false,
              );

              final badge1Label = context.knobs.string(
                label: 'Badge 1 Label',
                initialValue: 'Lead',
              );

              final hasBadgeTwo = context.knobs.boolean(
                label: 'Has Badge 2',
                initialValue: true,
              );

              final badge2Label = context.knobs.string(
                label: 'Badge 2 Label',
                initialValue: 'Flutter 3.x',
              );

              final hasBadgeThree = context.knobs.boolean(
                label: 'Has Badge 3',
                initialValue: true,
              );

              final badge3Label = context.knobs.string(
                label: 'Badge 3 Label',
                initialValue: 'Active',
              );

              final hasDescription = context.knobs.boolean(
                label: 'Has Description',
                initialValue: true,
              );

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: BiographyBlock(
                      type: type,
                      device: device,
                      title: title,
                      subtitle: subtitle,
                      description: description,
                      hasLogo: hasLogo,
                      hasSubtitle: hasSubtitle,
                      hasBadgeBar: hasBadgeBar,
                      hasBadgeOne: hasBadgeOne,
                      badge1Label: badge1Label,
                      hasBadgeTwo: hasBadgeTwo,
                      badge2Label: badge2Label,
                      hasBadgeThree: hasBadgeThree,
                      badge3Label: badge3Label,
                      hasDescription: hasDescription,
                      onLogoTap: () => showExampleToast(
                        context,
                        'Tapped BiographyBlock Logo',
                      ),
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
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DESKTOP TALL (Figma Node 761:7096)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 896,
                        child: BiographyBlock(
                          type: BiographyBlockType.tall,
                          device: BiographyBlockDevice.web,
                          title: 'Alter Design System',
                          subtitle: 'Component Library & Foundation',
                          description:
                              'A modular, high-fidelity Flutter design system crafted from Figma specifications.',
                          badge2Label: 'Flutter 3.x',
                          badge3Label: 'Active',
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'DESKTOP WIDE (Figma Node 761:7210)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 896,
                        child: BiographyBlock.wide(
                          device: BiographyBlockDevice.web,
                          title: 'Roberta Casas',
                          subtitle: 'Senior Product Designer',
                          description:
                              'Designing intuitive user interfaces and scalable design tokens for cross-platform apps.',
                          hasBadgeOne: true,
                          badge1Label: 'Design Lead',
                          badge2Label: 'Figma',
                          badge3Label: 'Full-time',
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'MOBILE TALL (Figma Node 761:7357)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 320,
                        child: BiographyBlock(
                          type: BiographyBlockType.tall,
                          device: BiographyBlockDevice.mobile,
                          title: 'Alter Mobile',
                          subtitle: 'iOS & Android',
                          description:
                              'Optimized mobile UI components with touch-friendly targets.',
                          badge2Label: 'Mobile',
                          badge3Label: 'v1.0.0',
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'MOBILE WIDE (Figma Node 761:7372)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 320,
                        child: BiographyBlock.wide(
                          device: BiographyBlockDevice.mobile,
                          title: 'Roberta Casas',
                          subtitle: 'Design Lead',
                          description: 'Product designer focusing on mobile systems.',
                          hasBadgeOne: false,
                          badge2Label: 'Staff',
                          badge3Label: 'Design',
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
        name: 'GraphicsBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device',
                options: GraphicsBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: GraphicsBlockDevice.auto,
              );

              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Project Alter',
              );

              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'Design System for Flutter',
              );

              final hasLogo = context.knobs.boolean(
                label: 'Has Logo',
                initialValue: true,
              );

              final hasBadgeBar = context.knobs.boolean(
                label: 'Has Badge Bar',
                initialValue: true,
              );

              final mediaType = context.knobs.object.dropdown<String>(
                label: 'Media Type',
                options: const ['Image', 'Stock Video'],
                initialOption: 'Image',
              );

              const sampleImage =
                  'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800';
              const stockVideoUrl =
                  'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4';

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: GraphicsBlock(
                      device: device,
                      imageUrl: mediaType == 'Image' ? sampleImage : null,
                      mediaBuilder: mediaType == 'Stock Video'
                          ? (context) => const _ExampleVideoPlayer(url: stockVideoUrl)
                          : null,
                      title: title,
                      subtitle: subtitle,
                      hasLogo: hasLogo,
                      hasBadgeBar: hasBadgeBar,
                      onImageTap: (_) {
                        showExampleToast(context, 'Tapped GraphicsBlock');
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              const sampleImage =
                  'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800';

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC (Figma Node 795:3760 - 896px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 896,
                        child: GraphicsBlock(
                          device: GraphicsBlockDevice.pc,
                          imageUrl: sampleImage,
                          title: 'Design System PC',
                          subtitle: 'Figma to Flutter component engine',
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'MOBILE (Figma Node 795:6005 - 316px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 316,
                        child: GraphicsBlock(
                          device: GraphicsBlockDevice.mobile,
                          imageUrl: sampleImage,
                          title: 'Mobile Project',
                          subtitle: 'iOS & Android Layout',
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
        name: 'MobileMockupBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final scale = context.knobs.object.dropdown(
                label: 'Scale Driver',
                options: MobileMockupBlockScale.values,
                labelBuilder: (s) => s.name,
                initialOption: MobileMockupBlockScale.width,
              );

              final width = context.knobs.double.slider(
                label: 'Width (when scale=width)',
                initialValue: 320,
                min: 200,
                max: 500,
              );

              final height = context.knobs.double.slider(
                label: 'Height (when scale=height)',
                initialValue: 692,
                min: 400,
                max: 900,
              );

              final hasBioMarker = context.knobs.boolean(
                label: 'Has BioMarker',
                initialValue: true,
              );

              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Alter Mobile App',
              );

              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'iOS & Android Screen',
              );

              final description = context.knobs.string(
                label: 'Description',
                initialValue:
                    'High-fidelity mobile application interface rendering inside a pixel-accurate iPhone 14 Plus container.',
              );

              const sampleImage =
                  'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=800';

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: MobileMockupBlock(
                    scale: scale,
                    width: scale == MobileMockupBlockScale.width ? width : null,
                    height: scale == MobileMockupBlockScale.height ? height : null,
                    imageUrl: sampleImage,
                    hasBioMarker: hasBioMarker,
                    title: title,
                    subtitle: subtitle,
                    description: description,
                    onImageTap: () {
                      showExampleToast(context, 'Tapped mobile mockup screen');
                    },
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              const sampleImage =
                  'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=800';

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SCALE = WIDTH (Figma Node 810:10718)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const SizedBox(
                        width: 320,
                        child: MobileMockupBlock(
                          scale: MobileMockupBlockScale.width,
                          width: 320,
                          imageUrl: sampleImage,
                          title: 'Mobile App Scale=Width',
                          subtitle: 'Width=320, Height auto-deduced',
                          description:
                              'Container width is controlled; height is auto-deduced based on 428:926 aspect ratio.',
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'SCALE = HEIGHT (Figma Node 810:10720)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const MobileMockupBlock(
                        scale: MobileMockupBlockScale.height,
                        height: 550,
                        imageUrl: sampleImage,
                        title: 'Mobile App Scale=Height',
                        subtitle: 'Height=550, Width auto-deduced',
                        description:
                            'Container height is controlled; width is auto-deduced based on 428:926 aspect ratio.',
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
        name: 'HeroProjectsBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device Adaptation',
                options: HeroProjectsBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: HeroProjectsBlockDevice.auto,
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
                    child: HeroProjectsBlock(
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
                        child: HeroProjectsBlock(
                          device: HeroProjectsBlockDevice.pc,
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
                        child: HeroProjectsBlock(
                          device: HeroProjectsBlockDevice.mobile,
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
        name: 'GraphicsCarouselBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device',
                options: GraphicsCarouselBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: GraphicsCarouselBlockDevice.auto,
              );

              final pcItemsPerView = context.knobs.object.dropdown(
                label: 'PC Items Per View',
                options: [2, 3],
                labelBuilder: (c) => '$c Items',
                initialOption: 2,
              );

              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Featured Graphic Showcase',
              );

              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'Brand & Visual Identity',
              );

              final sampleImages = [
                'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800',
                'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=800',
                'https://images.unsplash.com/photo-1550684848-fac1c5b4e853?w=800',
                'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
              ];

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: GraphicsCarouselBlock(
                      device: device,
                      pcItemsPerView: pcItemsPerView,
                      imageUrls: sampleImages,
                      title: title,
                      subtitle: subtitle,
                      badgeLabels: const ['Brand', 'Design'],
                      onItemTap: (index) {
                        showExampleToast(context, 'Tapped image #${index + 1}');
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              final sampleImages = [
                'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800',
                'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=800',
                'https://images.unsplash.com/photo-1550684848-fac1c5b4e853?w=800',
              ];

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC, 2 Items Per View (Figma Node 957:17115 - 896px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 896,
                        child: GraphicsCarouselBlock(
                          device: GraphicsCarouselBlockDevice.pc,
                          pcItemsPerView: 2,
                          imageUrls: sampleImages,
                          title: 'Brand Portfolio',
                          subtitle: 'Design System & Motion',
                          badgeLabels: const ['Showcase', '2026'],
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'PC, 3 Items Per View (896px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 896,
                        child: GraphicsCarouselBlock(
                          device: GraphicsCarouselBlockDevice.pc,
                          pcItemsPerView: 3,
                          imageUrls: [
                            ...sampleImages,
                            'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
                          ],
                          title: 'Digital Products',
                          subtitle: 'Multi-screen overview',
                          badgeLabels: const ['Product', 'UI/UX'],
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'MOBILE (Figma Node 957:17121 - 316px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 316,
                        child: GraphicsCarouselBlock(
                          device: GraphicsCarouselBlockDevice.mobile,
                          imageUrls: sampleImages,
                          title: 'Mobile Projects',
                          subtitle: 'Swipe horizontally',
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
        name: 'FooterBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device Adaptation',
                options: FooterBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: FooterBlockDevice.auto,
              );

              final email = context.knobs.string(
                label: 'Email Address',
                initialValue: 'kharkarnayan00@gmail.com',
              );

              final hasCopy = context.knobs.boolean(
                label: 'Has Copy Button',
                initialValue: true,
              );

              final socialLabel = context.knobs.string(
                label: 'Social Label',
                initialValue: 'Find me on ',
              );

              final hasSocial = context.knobs.boolean(
                label: 'Has Social Links',
                initialValue: true,
              );

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  child: FooterBlock(
                    device: device,
                    email: email,
                    hasCopyButton: hasCopy,
                    socialLabel: socialLabel,
                    hasSocial: hasSocial,
                    onCopyTap: () =>
                        showExampleToast(context, 'Copied $email'),
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
                        'PC / DESKTOP (Figma Node 922:7403 - 896px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 896,
                        child: FooterBlock(
                          device: FooterBlockDevice.pc,
                        ),
                      ),
                      const SizedBox(height: 64),
                      Text(
                        'MOBILE (Figma Node 922:9278 - 316px)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const SizedBox(
                        width: 316,
                        child: FooterBlock(
                          device: FooterBlockDevice.mobile,
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
        name: 'GraphicsGridBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device',
                options: GraphicsGridBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: GraphicsGridBlockDevice.auto,
              );

              final count = context.knobs.int.slider(
                label: 'Project Count',
                initialValue: 4,
                min: 1,
                max: 6,
              );

              final sampleImages = [
                'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800',
                'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=800',
                'https://images.unsplash.com/photo-1550684848-fac1c5b4e853?w=800',
                'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
              ];

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: GraphicsGridBlock.builder(
                      device: device,
                      count: count,
                      builder: (context, index) {
                        return GraphicsBlock(
                          imageUrl: sampleImages[index % sampleImages.length],
                          title: 'Project #${index + 1}',
                          subtitle: 'Design System Showcase',
                          onImageTap: (_) {
                            showExampleToast(context, 'Tapped project #${index + 1}');
                          },
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              final sampleImages = [
                'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800',
                'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?w=800',
              ];

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC, Single Column Full Width',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: GraphicsGridBlock(
                          device: GraphicsGridBlockDevice.pc,
                          projects: [
                            GraphicsBlock(
                              imageUrl: sampleImages[0],
                              title: 'Single Featured Project (PC)',
                              subtitle: 'Full width single column with badges & logo',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'PC, 2-Column Grid (Figma Node 795:3694)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: GraphicsGridBlock(
                          device: GraphicsGridBlockDevice.pc,
                          projects: [
                            GraphicsBlock(
                              imageUrl: sampleImages[0],
                              title: 'Project Alpha (PC)',
                              subtitle: '2-column grid with badges & logo',
                            ),
                            GraphicsBlock(
                              imageUrl: sampleImages[1],
                              title: 'Project Beta (PC)',
                              subtitle: '48px horizontal gap',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'MOBILE, 1-Column Stack (Figma Node 795:3702)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 316,
                        child: GraphicsGridBlock(
                          device: GraphicsGridBlockDevice.mobile,
                          projects: [
                            GraphicsBlock(
                              imageUrl: sampleImages[0],
                              title: 'Mobile Project Alpha',
                              subtitle: 'Vertical stacked item 1',
                            ),
                            GraphicsBlock(
                              imageUrl: sampleImages[1],
                              title: 'Mobile Project Beta',
                              subtitle: 'Vertical stacked item 2 (48px gap)',
                            ),
                          ],
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
        name: 'MobileMockupsGridBlock',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device',
                options: MobileMockupsGridBlockDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: MobileMockupsGridBlockDevice.auto,
              );

              final isCarousel = context.knobs.boolean(
                label: 'isCarousel',
                initialValue: false,
              );

              final fraction = context.knobs.double.slider(
                label: 'Mobile Viewport Fraction',
                initialValue: 0.78,
                min: 0.5,
                max: 1.0,
                divisions: 50,
              );

              final sampleScreens = [
                'https://images.unsplash.com/photo-1555774698-0b77e0d5fac6?w=800',
                'https://images.unsplash.com/photo-1616469829941-c7200edec809?w=800',
                'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=800',
                'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800',
                'https://images.unsplash.com/photo-1526470608268-f674ce90ebd4?w=800',
                'https://images.unsplash.com/photo-1563986768609-322da13575f3?w=800',
              ];

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: MobileMockupsGridBlock(
                      device: device,
                      isCarousel: isCarousel,
                      mobileViewportFraction: fraction,
                      imageUrls: sampleScreens,
                      title: 'Interactive Mobile Grid',
                      subtitle: isCarousel ? 'Swipeable Carousel Mode' : 'Fixed 4-Column Grid Mode',
                      hasBadgeTwo: true,
                      badge2Label: isCarousel ? 'Carousel' : 'Fixed 4',
                      hasBadgeThree: true,
                      badge3Label: device.name.toUpperCase(),
                      onItemTap: (index) {
                        showExampleToast(context, 'Tapped screen #${index + 1}');
                      },
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Showcase',
            builder: (context) {
              final sampleScreens = [
                'https://images.unsplash.com/photo-1555774698-0b77e0d5fac6?w=800',
                'https://images.unsplash.com/photo-1616469829941-c7200edec809?w=800',
                'https://images.unsplash.com/photo-1512941937669-90a1b58e7e9c?w=800',
                'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=800',
                'https://images.unsplash.com/photo-1526470608268-f674ce90ebd4?w=800',
                'https://images.unsplash.com/photo-1563986768609-322da13575f3?w=800',
              ];

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC, isCarousel=False (Figma Node 810:10818)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: MobileMockupsGridBlock(
                          device: MobileMockupsGridBlockDevice.pc,
                          isCarousel: false,
                          imageUrls: sampleScreens,
                          title: 'Fintech Mobile App Ecosystem',
                          subtitle: '4 Fixed Columns Desktop Layout',
                          hasBadgeTwo: true,
                          badge2Label: 'iOS App',
                          hasBadgeThree: true,
                          badge3Label: 'Android App',
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'PC, isCarousel=True (Figma Node 811:11752)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: MobileMockupsGridBlock(
                          device: MobileMockupsGridBlockDevice.pc,
                          isCarousel: true,
                          imageUrls: sampleScreens,
                          title: 'Banking & Investing Suite',
                          subtitle: 'Sliding Desktop Carousel with Overlay Controls',
                          hasBadgeTwo: true,
                          badge2Label: 'Portfolio',
                          hasBadgeThree: true,
                          badge3Label: 'Interactive',
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'MOBILE, isCarousel=True with Peek Cue (Figma Node 810:10991)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 316,
                        child: MobileMockupsGridBlock(
                          device: MobileMockupsGridBlockDevice.mobile,
                          isCarousel: true,
                          mobileViewportFraction: 0.78,
                          imageUrls: sampleScreens,
                          title: 'Mobile Wallet Experience',
                          subtitle: 'Touch Swipe Carousel with Viewport Fraction Peek',
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

class _ExampleVideoPlayer extends StatefulWidget {
  final String url;
  const _ExampleVideoPlayer({required this.url});

  @override
  State<_ExampleVideoPlayer> createState() => _ExampleVideoPlayerState();
}

class _ExampleVideoPlayerState extends State<_ExampleVideoPlayer> {
  late VideoPlayerController _controller;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.url))
      ..setLooping(true)
      ..setVolume(0.0)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _initialized = true;
          });
          _controller.play();
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return Container(
        color: AlterSemanticTokens.stroke100,
        child: const Center(
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      );
    }
    return FittedBox(
      fit: BoxFit.cover,
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: _controller.value.size.width > 0 ? _controller.value.size.width : 16,
        height: _controller.value.size.height > 0 ? _controller.value.size.height : 9,
        child: VideoPlayer(_controller),
      ),
    );
  }
}