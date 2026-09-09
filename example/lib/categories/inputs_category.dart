import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder inputsCategory() {
  return WidgetbookFolder(
    name: 'Inputs',
    children: [
      WidgetbookComponent(
        name: 'Search',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Search(
                    hintText: context.knobs.string(
                      label: 'Hint Text',
                      initialValue: 'Search items, tags, collections...',
                    ),
                    enabled: context.knobs.boolean(
                      label: 'Enabled',
                      initialValue: true,
                    ),
                    readOnly: context.knobs.boolean(
                      label: 'Read Only',
                      initialValue: false,
                    ),
                    autofocus: context.knobs.boolean(
                      label: 'Autofocus',
                      initialValue: false,
                    ),
                    onTap: () => showExampleToast(
                      context,
                      'Tapped Search input field',
                    ),
                    onSubmitted: (query) => showExampleToast(
                      context,
                      'Submitted Search: "$query"',
                    ),
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
