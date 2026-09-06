import 'package:flutter/material.dart' hide Checkbox;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';

WidgetbookFolder displayCategory() {
  return WidgetbookFolder(
    name: 'Layout & Display',
    children: [
      WidgetbookComponent(
        name: 'ListItem',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ListItem(
                    title: context.knobs.string(
                      label: 'Title',
                      initialValue: 'Main List Item Title',
                    ),
                    subtitle: context.knobs.string(
                      label: 'Subtitle',
                      initialValue: 'Supporting descriptive subtitle',
                    ),
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
                    onTap: () {},
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
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListItem(
                    title: 'Privacy & Security',
                    subtitle: 'Biometrics and passwords',
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListItem(
                    title: 'Display Appearance',
                    subtitle: 'Light and Dark mode settings',
                    onTap: () {},
                  ),
                ],
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'Pill',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              return Center(
                child: Pill(
                  label: context.knobs.string(
                    label: 'Label',
                    initialValue: 'Streak',
                  ),
                  value: context.knobs.string(
                    label: 'Value',
                    initialValue: '12 Days',
                  ),
                  hasLabel: context.knobs.boolean(
                    label: 'Has Label',
                    initialValue: true,
                  ),
                  hasValue: context.knobs.boolean(
                    label: 'Has Value',
                    initialValue: true,
                  ),
                  size: context.knobs.object.dropdown(
                    label: 'Size',
                    options: PillSize.values,
                    labelBuilder: (size) => size.name,
                  ),
                  color: context.knobs.object.dropdown(
                    label: 'Color',
                    options: PillColor.values,
                    labelBuilder: (c) => c.name,
                  ),
                  isSelected: context.knobs.boolean(
                    label: 'Is Selected',
                    initialValue: false,
                  ),
                  isCompleted: context.knobs.boolean(
                    label: 'Is Completed',
                    initialValue: false,
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
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Pill(
                        label: 'Default Gray',
                        value: '10 min',
                        color: PillColor.gray,
                        onTap: () {},
                      ),
                      Pill(
                        label: 'Neutral',
                        value: '20 min',
                        color: PillColor.neutral,
                        onTap: () {},
                      ),
                      Pill(
                        label: 'Selected',
                        value: 'Active',
                        isSelected: true,
                        onTap: () {},
                      ),
                      Pill(
                        label: 'Completed',
                        value: '100%',
                        isCompleted: true,
                        onTap: () {},
                      ),
                      Pill(
                        label: 'Compact',
                        size: PillSize.compact,
                        onTap: () {},
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
