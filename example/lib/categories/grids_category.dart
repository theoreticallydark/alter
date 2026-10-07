import 'package:flutter/material.dart' hide Badge, Divider;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder gridsCategory() {
  return WidgetbookFolder(
    name: 'Web (Grids)',
    children: [
      WidgetbookComponent(
        name: 'ProjectGrid',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device',
                options: ProjectGridDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: ProjectGridDevice.auto,
              );

              final count = context.knobs.int.slider(
                label: 'Project Count',
                initialValue: 2,
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
                    child: ProjectGrid.builder(
                      device: device,
                      count: count,
                      builder: (context, index) {
                        return ProjectMarker(
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
                        'PC, Count=Single (Figma Node 795:4012)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: ProjectGrid(
                          device: ProjectGridDevice.pc,
                          projects: [
                            ProjectMarker(
                              imageUrl: sampleImages[0],
                              title: 'Single Featured Project (PC)',
                              subtitle: 'Full width single column with badges & logo',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'PC, Count=Double (Figma Node 795:3694)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 896,
                        child: ProjectGrid(
                          device: ProjectGridDevice.pc,
                          projects: [
                            ProjectMarker(
                              imageUrl: sampleImages[0],
                              title: 'Project Alpha (PC)',
                              subtitle: '2-column grid with badges & logo',
                            ),
                            ProjectMarker(
                              imageUrl: sampleImages[1],
                              title: 'Project Beta (PC)',
                              subtitle: '48px horizontal gap',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'MOBILE, Count=Single (Figma Node 795:4015)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 316,
                        child: ProjectGrid(
                          device: ProjectGridDevice.mobile,
                          projects: [
                            ProjectMarker(
                              imageUrl: sampleImages[0],
                              title: 'Mobile Project Single',
                              subtitle: 'Mobile 1-column layout',
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'MOBILE, Count=Double (Figma Node 795:3702)',
                        style: AlterTypography.h4Bold.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: 316,
                        child: ProjectGrid(
                          device: ProjectGridDevice.mobile,
                          projects: [
                            ProjectMarker(
                              imageUrl: sampleImages[0],
                              title: 'Mobile Project Alpha',
                              subtitle: 'Vertical stacked item 1',
                            ),
                            ProjectMarker(
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
        name: 'MobileGrid',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final device = context.knobs.object.dropdown(
                label: 'Device',
                options: MobileGridDevice.values,
                labelBuilder: (d) => d.name,
                initialOption: MobileGridDevice.auto,
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
                    child: MobileGrid(
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
                        child: MobileGrid(
                          device: MobileGridDevice.pc,
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
                        child: MobileGrid(
                          device: MobileGridDevice.pc,
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
                        child: MobileGrid(
                          device: MobileGridDevice.mobile,
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

