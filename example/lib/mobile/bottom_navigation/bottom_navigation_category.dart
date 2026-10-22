import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import 'package:alter/mobile/bottom_navigation/bottom_navigation_item.dart';
import '../../toast_helper.dart';

WidgetbookFolder bottomNavigationCategory() {
  return WidgetbookFolder(
    name: 'BottomNavigation',
    children: [
      WidgetbookComponent(
        name: 'AlterBottomNavigationBar',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final selectedIndex = context.knobs.object.dropdown(
                label: 'Selected Tab Index',
                options: [0, 1, 2],
                labelBuilder: (idx) => 'Tab $idx',
              );

              return Center(
                child: AlterBottomNavigationBar(
                  selectedIndex: selectedIndex,
                  onItemTapped: (index) => showExampleToast(
                    context,
                    'Clicked Bottom Navigation Tab $index',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'BottomNavigationItem',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Home',
              );
              final isSelected = context.knobs.boolean(
                label: 'Is Selected',
                initialValue: true,
              );

              return Center(
                child: BottomNavigationItem(
                  label: label,
                  icon: Icons.home_outlined,
                  isSelected: isSelected,
                  onTap: () => showExampleToast(
                    context,
                    'Clicked BottomNavigationItem: $label',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'BottomNavigationBarAction',
        useCases: [
          WidgetbookUseCase(
            name: 'Default Action Type',
            builder: (context) {
              final selectedIndex = context.knobs.object.dropdown(
                label: 'Selected Tab Index',
                options: [0, 1, 2],
                labelBuilder: (idx) => 'Tab $idx',
              );

              return Center(
                child: BottomNavigationBarAction(
                  type: BottomNavigationBarActionType.defaultAction,
                  selectedIndex: selectedIndex,
                  primaryActionIcon: Icons.add,
                  onPrimaryActionTap: () => showExampleToast(
                    context,
                    'Clicked Primary Action (Add) Button',
                  ),
                  onItemTapped: (index) => showExampleToast(
                    context,
                    'Clicked Navigation Tab $index',
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Buttons Action Type',
            builder: (context) {
              return Center(
                child: BottomNavigationBarAction(
                  type: BottomNavigationBarActionType.buttons,
                  primaryActionIcon: Icons.check,
                  onPrimaryActionTap: () => showExampleToast(
                    context,
                    'Clicked Primary Action (Check) Button',
                  ),
                  onSecondaryActionOneTap: () => showExampleToast(
                    context,
                    'Clicked Secondary Action 1 Button',
                  ),
                  onSecondaryActionTwoTap: () => showExampleToast(
                    context,
                    'Clicked Secondary Action 2 Button',
                  ),
                  onItemTapped: (index) => showExampleToast(
                    context,
                    'Clicked Navigation Tab $index',
                  ),
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'BottomNavigationButton',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final type = context.knobs.object.dropdown(
                label: 'Type',
                options: BottomNavigationButtonType.values,
                labelBuilder: (t) => t.name,
              );
              final iconMap = {
                'add': Icons.add,
                'check': Icons.check,
                'close': Icons.close,
                'arrow_forward': Icons.arrow_forward,
                'favorite': Icons.favorite_border,
                'edit': Icons.edit_outlined,
              };
              final iconKey = context.knobs.object.dropdown(
                label: 'Icon Choice',
                options: iconMap.keys.toList(),
              );

              return Center(
                child: BottomNavigationButton(
                  icon: iconMap[iconKey] ?? Icons.add,
                  type: type,
                  onTap: () => showExampleToast(
                    context,
                    'Clicked BottomNavigationButton (${type.name}, icon: $iconKey)',
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All Variants Matrix',
            builder: (context) {
              return SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Type Variants', style: AlterTypography.h3),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: BottomNavigationButtonType.values.map((type) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BottomNavigationButton(
                              icon: type == BottomNavigationButtonType.primary
                                  ? Icons.check
                                  : Icons.add,
                              type: type,
                              onTap: () => showExampleToast(
                                context,
                                'Clicked ${type.name.toUpperCase()} BottomNavigationButton',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              type.name.toUpperCase(),
                              style: AlterTypography.caption,
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
