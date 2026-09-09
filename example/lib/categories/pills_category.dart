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
      WidgetbookComponent(
        name: 'AdvancedPill',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Guava, 100g',
              );
              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'ALA 20% • Zinc 10%',
              );
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: AdvancedPillType.values,
                labelBuilder: (t) => t.name,
              );
              final hasLeftSlot = context.knobs.boolean(
                label: 'Has Left Slot',
                initialValue: true,
              );
              final hasRightSlot = context.knobs.boolean(
                label: 'Has Right Slot',
                initialValue: false,
              );

              return Center(
                child: AdvancedPill(
                  title: title,
                  subtitle: subtitle,
                  type: type,
                  hasLeftSlot: hasLeftSlot,
                  leftSlot: hasLeftSlot
                      ? ButtonIconGhost(
                          icon: Icons.add_circle_outline,
                          type: ButtonIconGhostType.secondary,
                          size: 24,
                          onTap: () => showExampleToast(
                            context,
                            'Clicked AdvancedPill Left Action',
                          ),
                        )
                      : null,
                  hasRightSlot: hasRightSlot,
                  rightSlot: hasRightSlot
                      ? ButtonIconGhost(
                          icon: Icons.add_circle_outline,
                          type: ButtonIconGhostType.secondary,
                          size: 24,
                          onTap: () => showExampleToast(
                            context,
                            'Clicked AdvancedPill Right Action',
                          ),
                        )
                      : null,
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
                    spacing: 16,
                    runSpacing: 16,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      AdvancedPill(
                        title: 'Guava, 100g',
                        subtitle: 'ALA 20% • Zinc 10%',
                        type: AdvancedPillType.gray,
                        hasLeftSlot: true,
                        leftSlot: ButtonIconGhost(
                          icon: Icons.add_circle_outline,
                          type: ButtonIconGhostType.secondary,
                          size: 24,
                          onTap: () => showExampleToast(
                            context,
                            'Clicked Gray Left Action: Guava',
                          ),
                        ),
                        hasRightSlot: false,
                      ),
                      AdvancedPill(
                        title: 'Avocado, 150g',
                        subtitle: 'Potassium 15% • Fiber 28%',
                        type: AdvancedPillType.gray,
                        hasLeftSlot: true,
                        leftSlot: ButtonIconGhost(
                          icon: Icons.add_circle_outline,
                          type: ButtonIconGhostType.secondary,
                          size: 24,
                          onTap: () => showExampleToast(
                            context,
                            'Clicked Gray Left Action: Avocado',
                          ),
                        ),
                        hasRightSlot: true,
                        rightSlot: ButtonIconGhost(
                          icon: Icons.add_circle_outline,
                          type: ButtonIconGhostType.secondary,
                          size: 24,
                          onTap: () => showExampleToast(
                            context,
                            'Clicked Gray Right Action: Avocado',
                          ),
                        ),
                      ),
                      AdvancedPill(
                        title: 'Almonds, 50g',
                        subtitle: 'Magnesium 20% • Protein 12%',
                        type: AdvancedPillType.white,
                        hasLeftSlot: true,
                        leftSlot: ButtonIconGhost(
                          icon: Icons.add_circle_outline,
                          type: ButtonIconGhostType.secondary,
                          size: 24,
                          onTap: () => showExampleToast(
                            context,
                            'Clicked White Left Action: Almonds',
                          ),
                        ),
                        hasRightSlot: false,
                      ),
                      AdvancedPill(
                        title: 'Chia Seeds, 30g',
                        subtitle: 'Omega-3 100% • Calcium 18%',
                        type: AdvancedPillType.white,
                        hasLeftSlot: true,
                        leftSlot: ButtonIconGhost(
                          icon: Icons.add_circle_outline,
                          type: ButtonIconGhostType.secondary,
                          size: 24,
                          onTap: () => showExampleToast(
                            context,
                            'Clicked White Left Action: Chia Seeds',
                          ),
                        ),
                        hasRightSlot: true,
                        rightSlot: ButtonIconGhost(
                          icon: Icons.add_circle_outline,
                          type: ButtonIconGhostType.secondary,
                          size: 24,
                          onTap: () => showExampleToast(
                            context,
                            'Clicked White Right Action: Chia Seeds',
                          ),
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
