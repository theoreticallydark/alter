import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';

WidgetbookFolder navigationCategory() {
  return WidgetbookFolder(
    name: 'Navigation',
    children: [
      WidgetbookComponent(
        name: 'ApplicationHeader',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final showSlot = context.knobs.boolean(
                label: 'Show Search in Slot',
                initialValue: false,
              );

              return Align(
                alignment: Alignment.topCenter,
                child: ApplicationHeader(
                  title: context.knobs.string(
                    label: 'Title',
                    initialValue: 'Alter',
                  ),
                  subtitle: context.knobs.string(
                    label: 'Subtitle',
                    initialValue: 'Design System',
                  ),
                  hasStyleButton: context.knobs.boolean(
                    label: 'Has Streak Button',
                    initialValue: true,
                  ),
                  styleButtonTitle: context.knobs.string(
                    label: 'Streak Title',
                    initialValue: 'STREAK',
                  ),
                  styleButtonSubtitle: context.knobs.string(
                    label: 'Streak Subtitle',
                    initialValue: '7 DAYS',
                  ),
                  hasActionOne: context.knobs.boolean(
                    label: 'Has Action 1 (Search)',
                    initialValue: true,
                  ),
                  hasActionTwo: context.knobs.boolean(
                    label: 'Has Action 2',
                    initialValue: false,
                  ),
                  hasProfileAction: context.knobs.boolean(
                    label: 'Has Profile Action',
                    initialValue: true,
                  ),
                  slot: showSlot
                      ? const Search(
                          hintText: 'Search inside header slot...',
                        )
                      : null,
                ),
              );
            },
          ),
        ],
      ),
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
                  onItemTapped: (index) {},
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
                  onPrimaryActionTap: () {},
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
                  onPrimaryActionTap: () {},
                  onSecondaryActionOneTap: () {},
                  onSecondaryActionTwoTap: () {},
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
