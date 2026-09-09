import 'package:flutter/material.dart' hide Checkbox;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder utilitiesCategory() {
  return WidgetbookFolder(
    name: 'Utilities',
    children: [
      WidgetbookComponent(
        name: 'ListItem',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Main List Item Title',
              );
              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'Supporting descriptive subtitle',
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListItem(
                    title: title,
                    subtitle: subtitle,
                    hasSubtitle: context.knobs.boolean(
                      label: 'Has Subtitle',
                      initialValue: true,
                    ),
                    hasLeftSlot: context.knobs.boolean(
                      label: 'Has Left Action Slot',
                      initialValue: true,
                    ),
                    hasRightSlotOne: context.knobs.boolean(
                      label: 'Has Right Checkbox Slot',
                      initialValue: true,
                    ),
                    hasRightSlotTwo: context.knobs.boolean(
                      label: 'Has Right Toggle Favorite Slot',
                      initialValue: true,
                    ),
                    onTap: () => showExampleToast(
                      context,
                      'Clicked ListItem: "$title"',
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Grouped List',
            builder: (context) {
              return ListView(
                padding: const EdgeInsets.all(24),
                children: [
                  ListItem(
                    title: 'System Preferences',
                    subtitle: 'Manage notifications and accounts',
                    onTap: () => showExampleToast(
                      context,
                      'Clicked List Item: "System Preferences"',
                    ),
                  ),
                  const Divider(height: 1),
                  ListItem(
                    title: 'Privacy & Security',
                    subtitle: 'Biometrics and passwords',
                    onTap: () => showExampleToast(
                      context,
                      'Clicked List Item: "Privacy & Security"',
                    ),
                  ),
                  const Divider(height: 1),
                  ListItem(
                    title: 'Display Appearance',
                    subtitle: 'Light and Dark mode settings',
                    onTap: () => showExampleToast(
                      context,
                      'Clicked List Item: "Display Appearance"',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    ],
  );
}
