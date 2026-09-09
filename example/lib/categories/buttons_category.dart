import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder buttonsCategory() {
  return WidgetbookFolder(
    name: 'Buttons',
    children: [
      WidgetbookComponent(
        name: 'ButtonText',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Continue',
              );
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: ButtonType.values,
                labelBuilder: (type) => type.name,
              );
              final size = context.knobs.object.dropdown(
                label: 'Size',
                options: ButtonSize.values,
                labelBuilder: (size) => size.name,
              );

              return Center(
                child: ButtonText(
                  label: label,
                  type: type,
                  size: size,
                  onTap: () => showExampleToast(
                    context,
                    'Clicked ButtonText: "$label" (${type.name}, ${size.name})',
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
                      const Text('Normal Size', style: AlterTypography.h3),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: ButtonType.values.map((type) {
                          return ButtonText(
                            label: type.name.toUpperCase(),
                            type: type,
                            size: ButtonSize.normal,
                            onTap: () => showExampleToast(
                              context,
                              'Clicked Normal ButtonText: ${type.name.toUpperCase()}',
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 32),
                      const Text('Large Size', style: AlterTypography.h3),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: ButtonType.values.map((type) {
                          return ButtonText(
                            label: '${type.name.toUpperCase()} LARGE',
                            type: type,
                            size: ButtonSize.large,
                            onTap: () => showExampleToast(
                              context,
                              'Clicked Large ButtonText: ${type.name.toUpperCase()}',
                            ),
                          );
                        }).toList(),
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
        name: 'ButtonIcon',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final icons = {
                'Favorite': Icons.favorite_border,
                'Add': Icons.add,
                'Bookmark': Icons.bookmark_border,
                'Search': Icons.search,
                'Check': Icons.check,
              };

              final selectedIconKey = context.knobs.object.dropdown(
                label: 'Icon',
                options: icons.keys.toList(),
              );
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: ButtonIconType.values,
                labelBuilder: (type) => type.name,
              );
              final isSelected = context.knobs.boolean(
                label: 'Is Selected',
                initialValue: false,
              );
              final size = context.knobs.double.input(
                label: 'Size',
                initialValue: 48.0,
              );

              return Center(
                child: ButtonIcon(
                  icon: icons[selectedIconKey]!,
                  type: type,
                  isSelected: isSelected,
                  size: size,
                  onTap: () => showExampleToast(
                    context,
                    'Clicked ButtonIcon: $selectedIconKey (${type.name}, size: ${size.toInt()}px)',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'ButtonIconGhost',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final icons = {
                'Close': Icons.close,
                'Chevron Right': Icons.chevron_right,
                'Delete': Icons.delete_outline,
                'More Vert': Icons.more_vert,
              };

              final selectedIconKey = context.knobs.object.dropdown(
                label: 'Icon',
                options: icons.keys.toList(),
              );
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: ButtonIconGhostType.values,
                labelBuilder: (type) => type.name,
              );
              final size = context.knobs.double.input(
                label: 'Size',
                initialValue: 24.0,
              );

              return Center(
                child: ButtonIconGhost(
                  icon: icons[selectedIconKey]!,
                  type: type,
                  size: size,
                  onTap: () => showExampleToast(
                    context,
                    'Clicked ButtonIconGhost: $selectedIconKey (${type.name}, size: ${size.toInt()}px)',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'ButtonGraphicText',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'STREAK',
              );
              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: '7 DAYS',
              );

              return Center(
                child: ButtonGraphicText(
                  title: title,
                  subtitle: subtitle,
                  onTap: () => showExampleToast(
                    context,
                    'Clicked ButtonGraphicText: "$title - $subtitle"',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'ButtonGraphicImage',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              return Center(
                child: ButtonGraphicImage(
                  onTap: () => showExampleToast(
                    context,
                    'Clicked ButtonGraphicImage (Profile Avatar)',
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
