import 'package:flutter/material.dart' hide Badge;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder pillsCategory() {
  return WidgetbookFolder(
    name: 'Pills',
    children: [
      WidgetbookComponent(
        name: 'Pill',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Streak',
              );
              final value = context.knobs.string(
                label: 'Value',
                initialValue: '12 Days',
              );
              final size = context.knobs.object.dropdown(
                label: 'Size',
                options: PillSize.values,
                labelBuilder: (size) => size.name,
              );
              final color = context.knobs.object.dropdown(
                label: 'Color',
                options: PillColor.values,
                labelBuilder: (c) => c.name,
              );

              return Center(
                child: Pill(
                  label: label,
                  value: value,
                  hasLabel: context.knobs.boolean(
                    label: 'Has Label',
                    initialValue: true,
                  ),
                  hasValue: context.knobs.boolean(
                    label: 'Has Value',
                    initialValue: true,
                  ),
                  size: size,
                  color: color,
                  isSelected: context.knobs.boolean(
                    label: 'Is Selected',
                    initialValue: false,
                  ),
                  isCompleted: context.knobs.boolean(
                    label: 'Is Completed',
                    initialValue: false,
                  ),
                  onTap: () => showExampleToast(
                    context,
                    'Clicked Pill: "$label ($value)" (${color.name}, ${size.name})',
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
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Pill(
                        label: 'Default Gray',
                        value: '10 min',
                        color: PillColor.gray,
                        onTap: () => showExampleToast(
                          context,
                          'Clicked Pill: Default Gray (10 min)',
                        ),
                      ),
                      Pill(
                        label: 'Neutral',
                        value: '20 min',
                        color: PillColor.neutral,
                        onTap: () => showExampleToast(
                          context,
                          'Clicked Pill: Neutral (20 min)',
                        ),
                      ),
                      Pill(
                        label: 'Selected',
                        value: 'Active',
                        isSelected: true,
                        onTap: () => showExampleToast(
                          context,
                          'Clicked Pill: Selected (Active)',
                        ),
                      ),
                      Pill(
                        label: 'Completed',
                        value: '100%',
                        isCompleted: true,
                        onTap: () => showExampleToast(
                          context,
                          'Clicked Pill: Completed (100%)',
                        ),
                      ),
                      Pill(
                        label: 'Compact',
                        size: PillSize.compact,
                        onTap: () => showExampleToast(
                          context,
                          'Clicked Pill: Compact',
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
        name: 'Badge',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Label',
              );
              final color = context.knobs.object.dropdown(
                label: 'Color',
                options: BadgeColor.values,
                labelBuilder: (c) => c.name,
                initialOption: BadgeColor.gray,
              );
              final hasAction = context.knobs.boolean(
                label: 'Has Action',
                initialValue: true,
              );

              return Center(
                child: Badge(
                  label: label,
                  color: color,
                  hasLeftIcon: context.knobs.boolean(
                    label: 'Has Left Icon',
                    initialValue: true,
                  ),
                  hasRightIcon: context.knobs.boolean(
                    label: 'Has Right Icon',
                    initialValue: true,
                  ),
                  hasAction: hasAction,
                  onActionTap: () => showExampleToast(
                    context,
                    'Clicked Badge Action (Dismiss): "$label" (${color.name})',
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All 18 Colors Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: BadgeColor.values.map((color) {
                      final name = color.name[0].toUpperCase() + color.name.substring(1);
                      return Badge(
                        label: name,
                        color: color,
                        hasLeftIcon: true,
                        hasAction: true,
                        onActionTap: () => showExampleToast(
                          context,
                          'Clicked Badge Action (Dismiss): $name',
                        ),
                      );
                    }).toList(),
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
