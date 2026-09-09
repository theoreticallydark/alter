import 'package:flutter/material.dart' hide Checkbox;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder inputsCategory() {
  return WidgetbookFolder(
    name: 'Inputs & Selects',
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
      WidgetbookComponent(
        name: 'Checkbox',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive State',
            builder: (context) {
              return Center(
                child: _InteractiveCheckboxDemo(
                  size: context.knobs.double.input(
                    label: 'Size',
                    initialValue: 24.0,
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All States Matrix',
            builder: (context) {
              return Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          state: CheckboxState.unchecked,
                          onChanged: (_) => showExampleToast(
                            context,
                            'Clicked Unchecked Checkbox',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Unchecked', style: AlterTypography.caption),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          state: CheckboxState.intermediate,
                          onChanged: (_) => showExampleToast(
                            context,
                            'Clicked Intermediate Checkbox',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Intermediate', style: AlterTypography.caption),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          state: CheckboxState.checked,
                          onChanged: (_) => showExampleToast(
                            context,
                            'Clicked Checked Checkbox',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Checked', style: AlterTypography.caption),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'ToggleIcon',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive State',
            builder: (context) {
              return Center(
                child: _InteractiveToggleIconDemo(
                  size: context.knobs.double.input(
                    label: 'Size',
                    initialValue: 24.0,
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All States Matrix',
            builder: (context) {
              return Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ToggleIcon(
                          state: ToggleIconState.unchecked,
                          onChanged: (_) => showExampleToast(
                            context,
                            'Clicked Unchecked ToggleIcon',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Unchecked', style: AlterTypography.caption),
                      ],
                    ),
                    const SizedBox(width: 24),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ToggleIcon(
                          state: ToggleIconState.checked,
                          onChanged: (_) => showExampleToast(
                            context,
                            'Clicked Checked ToggleIcon',
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text('Checked', style: AlterTypography.caption),
                      ],
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

class _InteractiveCheckboxDemo extends StatefulWidget {
  final double size;
  const _InteractiveCheckboxDemo({required this.size});

  @override
  State<_InteractiveCheckboxDemo> createState() => _InteractiveCheckboxDemoState();
}

class _InteractiveCheckboxDemoState extends State<_InteractiveCheckboxDemo> {
  CheckboxState _state = CheckboxState.unchecked;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      state: _state,
      size: widget.size,
      onChanged: (newState) {
        setState(() {
          _state = newState;
        });
        showExampleToast(
          context,
          'Checkbox toggled to: ${newState.name.toUpperCase()}',
        );
      },
    );
  }
}

class _InteractiveToggleIconDemo extends StatefulWidget {
  final double size;
  const _InteractiveToggleIconDemo({required this.size});

  @override
  State<_InteractiveToggleIconDemo> createState() => _InteractiveToggleIconDemoState();
}

class _InteractiveToggleIconDemoState extends State<_InteractiveToggleIconDemo> {
  ToggleIconState _state = ToggleIconState.unchecked;

  @override
  Widget build(BuildContext context) {
    return ToggleIcon(
      state: _state,
      size: widget.size,
      onChanged: (newState) {
        setState(() {
          _state = newState;
        });
        showExampleToast(
          context,
          'ToggleIcon changed to: ${newState.name.toUpperCase()}',
        );
      },
    );
  }
}
