import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder navigationCategory() {
  return WidgetbookFolder(
    name: 'Navigation',
    children: [
      WidgetbookComponent(
        name: 'BottomNavigationBar',
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

              return Center(
                child: BottomNavigationButton(
                  icon: Icons.add,
                  type: type,
                  onTap: () => showExampleToast(
                    context,
                    'Clicked BottomNavigationButton (${type.name})',
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
