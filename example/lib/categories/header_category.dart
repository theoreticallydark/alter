import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder headerCategory() {
  return WidgetbookFolder(
    name: 'Header',
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
              final title = context.knobs.string(
                label: 'Title',
                initialValue: 'Alter',
              );
              final subtitle = context.knobs.string(
                label: 'Subtitle',
                initialValue: 'Design System',
              );
              final hasReturnButton = context.knobs.boolean(
                label: 'Has Return Button',
                initialValue: false,
              );

              return Align(
                alignment: Alignment.topCenter,
                child: ApplicationHeader(
                  title: title,
                  subtitle: subtitle,
                  hasReturnButton: hasReturnButton,
                  onReturnTap: () => showExampleToast(
                    context,
                    'Clicked ApplicationHeader Return Button',
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
                  onStyleButtonTap: () => showExampleToast(
                    context,
                    'Clicked Streak Button in Header',
                  ),
                  hasActionOne: context.knobs.boolean(
                    label: 'Has Action 1 (Favorite)',
                    initialValue: true,
                  ),
                  onActionOneTap: () => showExampleToast(
                    context,
                    'Clicked Header Action 1 (Favorite)',
                  ),
                  hasActionTwo: context.knobs.boolean(
                    label: 'Has Action 2',
                    initialValue: false,
                  ),
                  onActionTwoTap: () => showExampleToast(
                    context,
                    'Clicked Header Action 2',
                  ),
                  hasProfileAction: context.knobs.boolean(
                    label: 'Has Profile Action',
                    initialValue: true,
                  ),
                  onProfileTap: () => showExampleToast(
                    context,
                    'Clicked Header Profile Avatar',
                  ),
                  slot: showSlot
                      ? Search(
                          hintText: 'Search inside header slot...',
                          onTap: () => showExampleToast(
                            context,
                            'Tapped Header Slot Search',
                          ),
                        )
                      : null,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
