import 'package:flutter/material.dart' hide Checkbox, Radio, Switch;
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder selectsCategory() {
  return WidgetbookFolder(
    name: 'Selects',
    children: [
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
        name: 'Radio',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive State',
            builder: (context) {
              final size = context.knobs.double.input(
                label: 'Size',
                initialValue: 24.0,
              );
              return Center(
                child: _InteractiveRadioDemo(size: size),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Radio Group',
            builder: (context) {
              final size = context.knobs.double.input(
                label: 'Size',
                initialValue: 24.0,
              );
              return Center(
                child: _RadioGroupDemo(size: size),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All States & Sizes Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'States at Default Size (24px)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                isSelected: false,
                                onSelectedChanged: (_) => showExampleToast(
                                  context,
                                  'Clicked Unselected Radio',
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('Unchecked', style: AlterTypography.caption),
                            ],
                          ),
                          const SizedBox(width: 32),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Radio(
                                isSelected: true,
                                onSelectedChanged: (_) => showExampleToast(
                                  context,
                                  'Clicked Selected Radio',
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('Checked', style: AlterTypography.caption),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Size Scaling (16px, 24px, 32px, 48px)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (final s in [16.0, 24.0, 32.0, 48.0]) ...[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio(
                                  isSelected: true,
                                  size: s,
                                  onSelectedChanged: (_) => showExampleToast(
                                    context,
                                    'Clicked Radio size ${s.toInt()}px',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text('${s.toInt()}px', style: AlterTypography.caption),
                              ],
                            ),
                            const SizedBox(width: 24),
                          ],
                        ],
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
        name: 'Switch',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive State',
            builder: (context) {
              final size = context.knobs.double.input(
                label: 'Size',
                initialValue: 24.0,
              );
              return Center(
                child: _InteractiveSwitchDemo(size: size),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All States & Sizes Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'States at Default Size (24px)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Switch(
                                isSelected: false,
                                onChanged: (_) => showExampleToast(
                                  context,
                                  'Clicked OFF Switch',
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('OFF (toggle_off)', style: AlterTypography.caption),
                            ],
                          ),
                          const SizedBox(width: 32),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Switch(
                                isSelected: true,
                                onChanged: (_) => showExampleToast(
                                  context,
                                  'Clicked ON Switch',
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('ON (toggle_on)', style: AlterTypography.caption),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Size Scaling (16px, 24px, 32px, 48px)',
                        style: AlterTypography.captionBold.copyWith(
                          color: AlterSemanticTokens.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          for (final s in [16.0, 24.0, 32.0, 48.0]) ...[
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Switch(
                                  isSelected: true,
                                  size: s,
                                  onChanged: (_) => showExampleToast(
                                    context,
                                    'Clicked Switch size ${s.toInt()}px',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text('${s.toInt()}px', style: AlterTypography.caption),
                              ],
                            ),
                            const SizedBox(width: 24),
                          ],
                        ],
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

class _InteractiveRadioDemo extends StatefulWidget {
  final double size;
  const _InteractiveRadioDemo({required this.size});

  @override
  State<_InteractiveRadioDemo> createState() => _InteractiveRadioDemoState();
}

class _InteractiveRadioDemoState extends State<_InteractiveRadioDemo> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Radio(
      isSelected: _isSelected,
      size: widget.size,
      onSelectedChanged: (val) {
        setState(() {
          _isSelected = val;
        });
        showExampleToast(
          context,
          'Radio toggled to: ${_isSelected ? "CHECKED" : "UNCHECKED"}',
        );
      },
    );
  }
}

class _InteractiveSwitchDemo extends StatefulWidget {
  final double size;
  const _InteractiveSwitchDemo({required this.size});

  @override
  State<_InteractiveSwitchDemo> createState() => _InteractiveSwitchDemoState();
}

class _InteractiveSwitchDemoState extends State<_InteractiveSwitchDemo> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      isSelected: _isSelected,
      size: widget.size,
      onChanged: (val) {
        setState(() {
          _isSelected = val;
        });
        showExampleToast(
          context,
          'Switch toggled to: ${_isSelected ? "ON" : "OFF"}',
        );
      },
    );
  }
}

class _RadioGroupDemo extends StatefulWidget {
  final double size;
  const _RadioGroupDemo({required this.size});

  @override
  State<_RadioGroupDemo> createState() => _RadioGroupDemoState();
}

class _RadioGroupDemoState extends State<_RadioGroupDemo> {
  int _selectedGroup = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 1; i <= 3; i++) ...[
          InkWell(
            onTap: () {
              setState(() => _selectedGroup = i);
              showExampleToast(context, 'Selected Option $i');
            },
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Radio<int>(
                    value: i,
                    groupValue: _selectedGroup,
                    size: widget.size,
                    onChanged: (val) {
                      setState(() => _selectedGroup = val!);
                      showExampleToast(context, 'Selected Option $val');
                    },
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Option $i',
                    style: AlterTypography.bodyLg.copyWith(
                      color: AlterSemanticTokens.textPrimary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
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
