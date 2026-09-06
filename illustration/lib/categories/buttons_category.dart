import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';

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
              return Center(
                child: ButtonText(
                  label: context.knobs.string(
                    label: 'Label',
                    initialValue: 'Continue',
                  ),
                  type: context.knobs.object.dropdown(
                    label: 'Type',
                    options: ButtonType.values,
                    labelBuilder: (type) => type.name,
                  ),
                  size: context.knobs.object.dropdown(
                    label: 'Size',
                    options: ButtonSize.values,
                    labelBuilder: (size) => size.name,
                  ),
                  onTap: () {},
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
                            onTap: () {},
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
                            onTap: () {},
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

              return Center(
                child: ButtonIcon(
                  icon: icons[selectedIconKey]!,
                  type: context.knobs.object.dropdown(
                    label: 'Type',
                    options: ButtonIconType.values,
                    labelBuilder: (type) => type.name,
                  ),
                  isSelected: context.knobs.boolean(
                    label: 'Is Selected',
                    initialValue: false,
                  ),
                  size: context.knobs.double.input(
                    label: 'Size',
                    initialValue: 48.0,
                  ),
                  onTap: () {},
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

              return Center(
                child: ButtonIconGhost(
                  icon: icons[selectedIconKey]!,
                  type: context.knobs.object.dropdown(
                    label: 'Type',
                    options: ButtonIconGhostType.values,
                    labelBuilder: (type) => type.name,
                  ),
                  size: context.knobs.double.input(
                    label: 'Size',
                    initialValue: 24.0,
                  ),
                  onTap: () {},
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
              return Center(
                child: ButtonGraphicText(
                  title: context.knobs.string(
                    label: 'Title',
                    initialValue: 'STREAK',
                  ),
                  subtitle: context.knobs.string(
                    label: 'Subtitle',
                    initialValue: '7 DAYS',
                  ),
                  onTap: () {},
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
                  onTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
