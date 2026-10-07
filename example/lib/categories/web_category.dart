import 'package:flutter/material.dart' hide Badge, Divider;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder webCategory() {
  return WidgetbookFolder(
    name: 'Web (Molecules)',
    children: [
      WidgetbookComponent(
        name: 'BioMarker',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final type = context.knobs.object.dropdown(
                label: 'Layout Type',
                options: BioMarkerType.values,
                labelBuilder: (t) => t.name,
                initialOption: BioMarkerType.tall,
              );

              final device = context.knobs.object.dropdown(
                label: 'Device Adaptation',
                options: BioMarkerDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: BioMarkerDevice.auto,
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
                    child: BioMarker(
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
                        'Tapped BioMarker Logo',
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
                        child: BioMarker(
                          type: BioMarkerType.tall,
                          device: BioMarkerDevice.web,
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
                        child: BioMarker.wide(
                          device: BioMarkerDevice.web,
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
                        child: BioMarker(
                          type: BioMarkerType.tall,
                          device: BioMarkerDevice.mobile,
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
                        child: BioMarker.wide(
                          device: BioMarkerDevice.mobile,
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
        name: 'ProjectMarker',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device',
                options: ProjectMarkerDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: ProjectMarkerDevice.auto,
              );

              final isCarousel = context.knobs.boolean(
                label: 'Is Carousel',
                initialValue: true,
              );

              final pcItemsPerView = context.knobs.int.slider(
                label: 'PC Items Per View',
                initialValue: 2,
                min: 1,
                max: 4,
              );

              final mobileViewportFraction = context.knobs.double.slider(
                label: 'Mobile Viewport Fraction',
                initialValue: 0.86,
                min: 0.5,
                max: 1.0,
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
                    child: ProjectMarker(
                      device: device,
                      isCarousel: isCarousel,
                      pcItemsPerView: pcItemsPerView,
                      mobileViewportFraction: mobileViewportFraction,
                      carouselImageUrls: sampleImages,
                      imageUrl: sampleImages[0],
                      title: title,
                      subtitle: subtitle,
                      hasLogo: hasLogo,
                      hasBadgeBar: hasBadgeBar,
                      onImageTap: (index) {
                        showExampleToast(context, 'Tapped image slide #$index');
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
                'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
              ];

              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PC, Carousel=False (Figma Node 795:3760)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: ProjectMarker(
                          device: ProjectMarkerDevice.pc,
                          isCarousel: false,
                          imageUrl: sampleImages[0],
                          title: 'Design System PC',
                          subtitle: 'Figma to Flutter component engine',
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'PC, Carousel=True (2-Columns - Figma Node 813:12021)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: ProjectMarker(
                          device: ProjectMarkerDevice.pc,
                          isCarousel: true,
                          pcItemsPerView: 2,
                          carouselImageUrls: sampleImages,
                          title: 'Project Showcase (2-Column Carousel)',
                          subtitle: 'Side by side banner view with controls',
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'PC, Carousel=True (3-Columns Configurable)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: ProjectMarker(
                          device: ProjectMarkerDevice.pc,
                          isCarousel: true,
                          pcItemsPerView: 3,
                          carouselImageUrls: sampleImages,
                          title: 'Project Showcase (3-Column Carousel)',
                          subtitle: '3 simultaneous cards with carousel controls',
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'MOBILE, Carousel=False (Figma Node 795:6005)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 316,
                        child: ProjectMarker(
                          device: ProjectMarkerDevice.mobile,
                          isCarousel: false,
                          imageUrl: sampleImages[0],
                          title: 'Mobile Project',
                          subtitle: 'iOS & Android Layout',
                        ),
                      ),
                      const SizedBox(height: 36),
                      Text(
                        'MOBILE, Carousel=True with Peek Cue (Figma Node 819:2595)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 316,
                        child: ProjectMarker(
                          device: ProjectMarkerDevice.mobile,
                          isCarousel: true,
                          mobileViewportFraction: 0.86,
                          carouselImageUrls: sampleImages,
                          title: 'Mobile Project Carousel',
                          subtitle: 'Thumb-swipeable with ~14% / 44px peek affordance',
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
        name: 'MobileMarker',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final scale = context.knobs.object.dropdown(
                label: 'Scale Driver',
                options: MobileMarkerScale.values,
                labelBuilder: (s) => s.name,
                initialOption: MobileMarkerScale.width,
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
                  child: MobileMarker(
                    scale: scale,
                    width: scale == MobileMarkerScale.width ? width : null,
                    height: scale == MobileMarkerScale.height ? height : null,
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
                        child: MobileMarker(
                          scale: MobileMarkerScale.width,
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
                      const MobileMarker(
                        scale: MobileMarkerScale.height,
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


