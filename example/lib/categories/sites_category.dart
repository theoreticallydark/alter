import 'package:flutter/material.dart' hide Badge, Divider;
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

              const sampleImage =
                  'https://images.unsplash.com/photo-1579546929518-9e396f3cc809?w=800';

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 896),
                    child: GraphicsBlock(
                      device: device,
                      imageUrl: sampleImage,
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
    ],
  );
}


