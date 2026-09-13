import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';
import '../toast_helper.dart';

WidgetbookFolder inputCategory() {
  return WidgetbookFolder(
    name: 'Input',
    children: [
      // 1. InputControl Primitive
      WidgetbookComponent(
        name: 'InputControl',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.stringOrNull(
                label: 'Label (omit to hide label bar)',
                initialValue: 'Label',
              );
              final isRequired = context.knobs.boolean(
                label: 'Is Required (Asterisk beside label)',
                initialValue: false,
              );
              final characterLimit = context.knobs.intOrNull.input(
                label: 'Character Limit (numeric)',
                initialValue: 32,
              );
              final type = context.knobs.object.dropdown(
                label: 'Type (Variant)',
                options: InputControlType.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: InputControlType.gray,
              );
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: 'Input',
              );
              final value = context.knobs.stringOrNull(
                label: 'Value',
                initialValue: null,
              );
              final leftIcon = context.knobs.objectOrNull.dropdown<IconData?>(
                label: 'Left Icon',
                options: const [
                  null,
                  Icons.face_5_outlined,
                  Icons.search_rounded,
                  Icons.lock_outline_rounded,
                  Icons.mail_outline_rounded,
                ],
                labelBuilder: (i) {
                  if (i == null) return 'None';
                  if (i == Icons.face_5_outlined) return 'Face (Default)';
                  if (i == Icons.search_rounded) return 'Search';
                  if (i == Icons.lock_outline_rounded) return 'Lock';
                  if (i == Icons.mail_outline_rounded) return 'Mail';
                  return 'Icon';
                },
                initialOption: Icons.face_5_outlined,
              );
              final prefix = context.knobs.stringOrNull(
                label: 'Prefix',
                initialValue: 'Prefix',
              );
              final suffix = context.knobs.stringOrNull(
                label: 'Suffix',
                initialValue: 'Suffix',
              );
              final hasRightButton = context.knobs.boolean(
                label: 'Has Right Button (ButtonIconGhost)',
                initialValue: true,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final showErrorMessage = context.knobs.boolean(
                label: 'Show Error Message',
                initialValue: true,
              );
              final errorMessage = context.knobs.string(
                label: 'Error Message',
                initialValue: 'Error Message',
              );
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              final readOnly = context.knobs.boolean(
                label: 'Read Only',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: InputControl(
                      key: ValueKey(
                        'input_control_${type.name}_${readOnly}_${isError}_${hasRightButton}_${leftIcon?.codePoint}_${label}_${characterLimit}_$value',
                      ),
                      label: label,
                      isRequired: isRequired,
                      characterLimit: characterLimit,
                      type: type,
                      placeholder: placeholder,
                      value: value,
                      leftIcon: leftIcon,
                      prefix: prefix,
                      suffix: suffix,
                      rightButton: hasRightButton
                          ? ButtonIconGhost(
                              icon: Icons.face_5_outlined,
                              type: ButtonIconGhostType.secondary,
                              onTap: () => showExampleToast(
                                context,
                                'Right ButtonIconGhost tapped',
                              ),
                            )
                          : null,
                      isError: isError,
                      showErrorMessage: showErrorMessage,
                      errorMessage: errorMessage,
                      enabled: enabled,
                      readOnly: readOnly,
                      onChanged: (val) => showExampleToast(
                        context,
                        'Input value changed: "$val"',
                      ),
                      onSubmitted: (val) => showExampleToast(
                        context,
                        'Submitted: "$val"',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'States & Surface Showcase (Gray vs White)',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'GRAY VARIANT (Figma Node 470:436)',
                          style: AlterTypography.h4Bold.copyWith(
                            color: AlterSemanticTokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Default (Empty / Placeholder state)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Populated Input (with character limit 32)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          value: 'Populated text content',
                          characterLimit: 32,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Error State (isError: true, showErrorMessage: true)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          value: 'Invalid value',
                          isError: true,
                          showErrorMessage: true,
                          errorMessage: 'Invalid value entered',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Readonly State (readOnly: true)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          readOnly: true,
                          value: 'Readonly content',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Disabled State (enabled: false, 48% Opacity)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          enabled: false,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'WHITE VARIANT (Figma Node 470:436)',
                          style: AlterTypography.h4Bold.copyWith(
                            color: AlterSemanticTokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const InputControl(
                          type: InputControlType.white,
                          placeholder: 'White surface input...',
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // 2. TextInput Component
      WidgetbookComponent(
        name: 'TextInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.stringOrNull(
                label: 'Label (omit to hide label bar)',
                initialValue: 'Label',
              );
              final isRequired = context.knobs.boolean(
                label: 'Is Required (Asterisk beside label)',
                initialValue: false,
              );
              final characterLimit = context.knobs.intOrNull.input(
                label: 'Character Limit (numeric)',
                initialValue: 32,
              );
              final type = context.knobs.object.dropdown(
                label: 'Type (Variant)',
                options: InputControlType.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: InputControlType.gray,
              );
              final inputMode = context.knobs.object.dropdown(
                label: 'Input Mode',
                options: TextInputMode.values,
                labelBuilder: (m) => m.name,
                initialOption: TextInputMode.all,
              );
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: 'Input',
              );
              final value = context.knobs.stringOrNull(
                label: 'Value',
                initialValue: null,
              );
              final leftIcon = context.knobs.objectOrNull.dropdown<IconData?>(
                label: 'Left Icon',
                options: const [
                  null,
                  Icons.face_5_outlined,
                  Icons.search_rounded,
                  Icons.lock_outline_rounded,
                  Icons.mail_outline_rounded,
                  Icons.phone_outlined,
                ],
                labelBuilder: (i) {
                  if (i == null) return 'None';
                  if (i == Icons.face_5_outlined) return 'Face (Default)';
                  if (i == Icons.search_rounded) return 'Search';
                  if (i == Icons.lock_outline_rounded) return 'Lock';
                  if (i == Icons.mail_outline_rounded) return 'Mail';
                  if (i == Icons.phone_outlined) return 'Phone';
                  return 'Icon';
                },
                initialOption: Icons.face_5_outlined,
              );
              final prefix = context.knobs.stringOrNull(
                label: 'Prefix',
                initialValue: null,
              );
              final suffix = context.knobs.stringOrNull(
                label: 'Suffix',
                initialValue: null,
              );
              final hasRightButton = context.knobs.boolean(
                label: 'Has Right Button (ButtonIconGhost)',
                initialValue: false,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final showErrorMessage = context.knobs.boolean(
                label: 'Show Error Message',
                initialValue: true,
              );
              final errorMessage = context.knobs.string(
                label: 'Error Message',
                initialValue: 'Error Message',
              );
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              final readOnly = context.knobs.boolean(
                label: 'Read Only',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: TextInput(
                      key: ValueKey(
                        'text_input_${type.name}_${readOnly}_${isError}_${hasRightButton}_${leftIcon?.codePoint}_${label}_${characterLimit}_$value',
                      ),
                      label: label,
                      isRequired: isRequired,
                      characterLimit: characterLimit,
                      type: type,
                      inputMode: inputMode,
                      placeholder: placeholder,
                      value: value,
                      leftIcon: leftIcon,
                      prefix: prefix,
                      suffix: suffix,
                      rightButton: hasRightButton
                          ? ButtonIconGhost(
                              icon: Icons.face_5_outlined,
                              type: ButtonIconGhostType.secondary,
                              onTap: () => showExampleToast(
                                context,
                                'TextInput right ButtonIconGhost tapped',
                              ),
                            )
                          : null,
                      isError: isError,
                      showErrorMessage: showErrorMessage,
                      errorMessage: errorMessage,
                      enabled: enabled,
                      readOnly: readOnly,
                      onChanged: (val) => showExampleToast(
                        context,
                        'TextInput value: "$val"',
                      ),
                      onSubmitted: (val) => showExampleToast(
                        context,
                        'Submitted: "$val"',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // 3. SearchInput
      WidgetbookComponent(
        name: 'SearchInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: 'Search products, tags...',
              );
              final value = context.knobs.stringOrNull(
                label: 'Value',
                initialValue: null,
              );
              final label = context.knobs.stringOrNull(
                label: 'Label',
                initialValue: null,
              );
              final isRequired = context.knobs.boolean(
                label: 'Is Required',
                initialValue: false,
              );
              final type = context.knobs.object.dropdown(
                label: 'Type (Variant)',
                options: InputControlType.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: InputControlType.gray,
              );
              final showClear = context.knobs.boolean(
                label: 'Show Clear Button (when text typed)',
                initialValue: true,
              );
              final prefix = context.knobs.stringOrNull(
                label: 'Prefix',
                initialValue: null,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final showErrorMessage = context.knobs.boolean(
                label: 'Show Error Message',
                initialValue: true,
              );
              final errorMessage = context.knobs.string(
                label: 'Error Message',
                initialValue: 'No results found',
              );
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              final readOnly = context.knobs.boolean(
                label: 'Read Only',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: SearchInput(
                      key: ValueKey('search_input_${type.name}_${readOnly}_${label}_$value'),
                      label: label,
                      isRequired: isRequired,
                      type: type,
                      placeholder: placeholder,
                      value: value,
                      prefix: prefix,
                      showClearButton: showClear,
                      isError: isError,
                      showErrorMessage: showErrorMessage,
                      errorMessage: errorMessage,
                      enabled: enabled,
                      readOnly: readOnly,
                      onSearch: (q) => showExampleToast(context, 'Search query: "$q"'),
                      onClear: () => showExampleToast(context, 'Search cleared'),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'States Showcase (Empty vs Populated)',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. Empty Search State (Magnifying Glass only)'),
                        SizedBox(height: 8),
                        SearchInput(placeholder: 'Search...'),
                        SizedBox(height: 24),
                        Text('2. Populated Search State (Clear button active)'),
                        SizedBox(height: 8),
                        SearchInput(value: 'Flutter Components'),
                        SizedBox(height: 24),
                        Text('3. White Variant Search'),
                        SizedBox(height: 8),
                        SearchInput(type: InputControlType.white, value: 'Design Tokens'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // 4. TextArea
      WidgetbookComponent(
        name: 'TextArea',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.stringOrNull(
                label: 'Label',
                initialValue: 'Feedback / Notes',
              );
              final lines = context.knobs.intOrNull.input(
                label: 'Reserved Lines (Height)',
                initialValue: 4,
              ) ?? 4;
              final isRequired = context.knobs.boolean(
                label: 'Is Required (Asterisk beside label)',
                initialValue: false,
              );
              final charLimit = context.knobs.intOrNull.input(
                label: 'Character Limit',
                initialValue: 200,
              );
              final type = context.knobs.object.dropdown(
                label: 'Type (Variant)',
                options: InputControlType.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: InputControlType.gray,
              );
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: 'Enter description...',
              );
              final value = context.knobs.stringOrNull(
                label: 'Value',
                initialValue: null,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final showErrorMessage = context.knobs.boolean(
                label: 'Show Error Message',
                initialValue: true,
              );
              final errorMessage = context.knobs.string(
                label: 'Error Message',
                initialValue: 'Description too short',
              );
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              final readOnly = context.knobs.boolean(
                label: 'Read Only',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: TextArea(
                      key: ValueKey('text_area_${type.name}_${lines}_${readOnly}_${label}_${charLimit}_$value'),
                      label: label,
                      isRequired: isRequired,
                      lines: lines,
                      characterLimit: charLimit,
                      type: type,
                      placeholder: placeholder,
                      value: value,
                      isError: isError,
                      showErrorMessage: showErrorMessage,
                      errorMessage: errorMessage,
                      enabled: enabled,
                      readOnly: readOnly,
                      onChanged: (v) => showExampleToast(context, 'TextArea length: ${v.length}'),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Multiline Height Comparison',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Compact (2 Lines)'),
                        SizedBox(height: 8),
                        TextArea(label: 'Short Bio', lines: 2, placeholder: '2 lines reserved...'),
                        SizedBox(height: 24),
                        Text('Standard (4 Lines)'),
                        SizedBox(height: 8),
                        TextArea(label: 'Detailed Feedback', lines: 4, placeholder: '4 lines reserved...'),
                        SizedBox(height: 24),
                        Text('Expanded (6 Lines)'),
                        SizedBox(height: 8),
                        TextArea(label: 'Release Notes', lines: 6, placeholder: '6 lines reserved...'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // 5. PasswordInput
      WidgetbookComponent(
        name: 'PasswordInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.stringOrNull(
                label: 'Label',
                initialValue: 'Password',
              );
              final isRequired = context.knobs.boolean(
                label: 'Is Required (Asterisk beside label)',
                initialValue: true,
              );
              final type = context.knobs.object.dropdown(
                label: 'Type (Variant)',
                options: InputControlType.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: InputControlType.gray,
              );
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: 'Enter password',
              );
              final value = context.knobs.stringOrNull(
                label: 'Value',
                initialValue: null,
              );
              final showEye = context.knobs.boolean(
                label: 'Show Eye Toggle',
                initialValue: true,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final showErrorMessage = context.knobs.boolean(
                label: 'Show Error Message',
                initialValue: true,
              );
              final errorMessage = context.knobs.string(
                label: 'Error Message',
                initialValue: 'Password must be at least 8 characters',
              );
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              final readOnly = context.knobs.boolean(
                label: 'Read Only',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: PasswordInput(
                      key: ValueKey('password_input_${type.name}_${readOnly}_${label}_$value'),
                      label: label,
                      isRequired: isRequired,
                      type: type,
                      placeholder: placeholder,
                      value: value,
                      showEyeToggle: showEye,
                      isError: isError,
                      showErrorMessage: showErrorMessage,
                      errorMessage: errorMessage,
                      enabled: enabled,
                      readOnly: readOnly,
                      onToggleObscure: (obs) => showExampleToast(
                        context,
                        obs ? 'Password hidden' : 'Password revealed',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'States Showcase (Obscured vs Revealed)',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. Obscured Password (Default)'),
                        SizedBox(height: 8),
                        PasswordInput(
                          label: 'Account Password',
                          value: 'SuperSecret123!',
                          initiallyObscured: true,
                        ),
                        SizedBox(height: 24),
                        Text('2. Revealed Password State'),
                        SizedBox(height: 8),
                        PasswordInput(
                          label: 'Account Password',
                          value: 'SuperSecret123!',
                          initiallyObscured: false,
                        ),
                        SizedBox(height: 24),
                        Text('3. Required Password with Asterisk'),
                        SizedBox(height: 8),
                        PasswordInput(
                          label: 'Master Password',
                          isRequired: true,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // 6. NumericInput
      WidgetbookComponent(
        name: 'NumericInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.stringOrNull(
                label: 'Label',
                initialValue: 'Quantity / Units',
              );
              final isRequired = context.knobs.boolean(
                label: 'Is Required',
                initialValue: false,
              );
              final type = context.knobs.object.dropdown(
                label: 'Type (Variant)',
                options: InputControlType.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: InputControlType.gray,
              );
              final grouping = context.knobs.object.dropdown(
                label: 'Grouping System',
                options: NumberGroupingSystem.values,
                labelBuilder: (g) => g.name.toUpperCase(),
                initialOption: NumberGroupingSystem.international,
              );
              final allowDecimals = context.knobs.boolean(
                label: 'Allow Decimals',
                initialValue: true,
              );
              final allowNegative = context.knobs.boolean(
                label: 'Allow Negative',
                initialValue: false,
              );
              final decimalPlaces = context.knobs.intOrNull.input(
                label: 'Decimal Places (e.g. 2)',
                initialValue: null,
              );
              final showSteppers = context.knobs.boolean(
                label: 'Show Steppers (+ / -)',
                initialValue: true,
              );
              final step = context.knobs.intOrNull.input(
                label: 'Stepper Step',
                initialValue: 1,
              ) ?? 1;
              final minValue = context.knobs.intOrNull.input(
                label: 'Min Value',
                initialValue: null,
              );
              final maxValue = context.knobs.intOrNull.input(
                label: 'Max Value',
                initialValue: null,
              );
              final initialValue = context.knobs.intOrNull.input(
                label: 'Initial Value',
                initialValue: null,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final showErrorMessage = context.knobs.boolean(
                label: 'Show Error Message',
                initialValue: true,
              );
              final errorMessage = context.knobs.string(
                label: 'Error Message',
                initialValue: 'Invalid numeric value',
              );
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              final readOnly = context.knobs.boolean(
                label: 'Read Only',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: NumericInput(
                      key: ValueKey('numeric_input_${type.name}_${readOnly}_${label}_$initialValue'),
                      label: label,
                      isRequired: isRequired,
                      type: type,
                      groupingSystem: grouping,
                      allowDecimals: allowDecimals,
                      allowNegative: allowNegative,
                      decimalPlaces: decimalPlaces,
                      showSteppers: showSteppers,
                      step: step,
                      minValue: minValue,
                      maxValue: maxValue,
                      initialValue: initialValue,
                      isError: isError,
                      showErrorMessage: showErrorMessage,
                      errorMessage: errorMessage,
                      enabled: enabled,
                      readOnly: readOnly,
                      onNumberChanged: (n) => showExampleToast(context, 'Parsed numeric: $n'),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Grouping Systems Showcase',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. International Grouping (1,000,000.50)'),
                        SizedBox(height: 8),
                        NumericInput(
                          label: 'International Number',
                          groupingSystem: NumberGroupingSystem.international,
                          initialValue: 1000000.50,
                        ),
                        SizedBox(height: 24),
                        Text('2. Indian Grouping (10,00,000.50)'),
                        SizedBox(height: 8),
                        NumericInput(
                          label: 'Indian Number',
                          groupingSystem: NumberGroupingSystem.indian,
                          initialValue: 1000000.50,
                        ),
                        SizedBox(height: 24),
                        Text('3. Steppers Enabled (Step: 5)'),
                        SizedBox(height: 8),
                        NumericInput(
                          label: 'Stepper Counter',
                          showSteppers: true,
                          step: 5,
                          initialValue: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // 7. OTPInput
      WidgetbookComponent(
        name: 'OTPInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive (4 vs 6 Digits)',
            builder: (context) {
              final length = context.knobs.object.dropdown(
                label: 'OTP Length',
                options: const [4, 6],
                labelBuilder: (l) => '$l Digits',
                initialOption: 4,
              );
              final type = context.knobs.object.dropdown(
                label: 'Type (Variant)',
                options: InputControlType.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: InputControlType.gray,
              );
              final obscure = context.knobs.boolean(
                label: 'Obscure PIN',
                initialValue: false,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final showErrorMessage = context.knobs.boolean(
                label: 'Show Error Message',
                initialValue: true,
              );
              final errorMessage = context.knobs.string(
                label: 'Error Message',
                initialValue: 'Invalid OTP code',
              );
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              final readOnly = context.knobs.boolean(
                label: 'Read Only',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: OTPInput(
                    key: ValueKey('otp_input_${length}_${type.name}_$obscure'),
                    length: length,
                    type: type,
                    obscureOtp: obscure,
                    isError: isError,
                    showErrorMessage: showErrorMessage,
                    errorMessage: errorMessage,
                    enabled: enabled,
                    readOnly: readOnly,
                    onCompleted: (otp) => showExampleToast(context, 'OTP Completed: "$otp"'),
                    onChanged: (otp) => showExampleToast(context, 'OTP Changed: "$otp"'),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Preset Showcase (4-Digit vs 6-Digit PIN)',
            builder: (context) {
              return const Center(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text('4-Digit Authentication PIN'),
                      SizedBox(height: 12),
                      OTPInput(length: 4),
                      SizedBox(height: 32),
                      Text('6-Digit Bank Verification OTP'),
                      SizedBox(height: 12),
                      OTPInput(length: 6),
                      SizedBox(height: 32),
                      Text('Error State with Validation Message'),
                      SizedBox(height: 12),
                      OTPInput(length: 4, isError: true, errorMessage: 'Incorrect PIN. 2 attempts remaining.'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),

      // 8. CurrencyInput
      WidgetbookComponent(
        name: 'CurrencyInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive (Euro Default & Formatting)',
            builder: (context) {
              final label = context.knobs.stringOrNull(
                label: 'Label',
                initialValue: 'Invoice Amount',
              );
              final isRequired = context.knobs.boolean(
                label: 'Is Required',
                initialValue: false,
              );
              final type = context.knobs.object.dropdown(
                label: 'Type (Variant)',
                options: InputControlType.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: InputControlType.gray,
              );
              final currencySymbol = context.knobs.object.dropdown(
                label: 'Currency Symbol',
                options: const [
                  Icons.euro_rounded,
                  Icons.currency_rupee_rounded,
                  Icons.attach_money_rounded,
                  Icons.currency_pound_rounded,
                ],
                labelBuilder: (icon) {
                  if (icon == Icons.euro_rounded) return 'Euro (€)';
                  if (icon == Icons.currency_rupee_rounded) return 'Rupee (₹)';
                  if (icon == Icons.attach_money_rounded) return 'Dollar (\$)';
                  if (icon == Icons.currency_pound_rounded) return 'Pound (£)';
                  return 'Custom';
                },
                initialOption: Icons.euro_rounded,
              );
              final grouping = context.knobs.object.dropdown(
                label: 'Grouping System',
                options: NumberGroupingSystem.values,
                labelBuilder: (g) => g.name.toUpperCase(),
                initialOption: NumberGroupingSystem.international,
              );
              final decimalPlaces = context.knobs.intOrNull.input(
                label: 'Decimal Places',
                initialValue: 2,
              ) ?? 2;
              final initialValue = context.knobs.doubleOrNull.input(
                label: 'Initial Value',
                initialValue: 1250.50,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final showErrorMessage = context.knobs.boolean(
                label: 'Show Error Message',
                initialValue: true,
              );
              final errorMessage = context.knobs.string(
                label: 'Error Message',
                initialValue: 'Amount cannot be zero',
              );
              final enabled = context.knobs.boolean(
                label: 'Enabled',
                initialValue: true,
              );
              final readOnly = context.knobs.boolean(
                label: 'Read Only',
                initialValue: false,
              );

              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: CurrencyInput(
                      key: ValueKey('currency_input_${type.name}_${currencySymbol.codePoint}_${label}_$initialValue'),
                      label: label,
                      isRequired: isRequired,
                      type: type,
                      leftIcon: currencySymbol,
                      groupingSystem: grouping,
                      decimalPlaces: decimalPlaces,
                      initialValue: initialValue,
                      isError: isError,
                      showErrorMessage: showErrorMessage,
                      errorMessage: errorMessage,
                      enabled: enabled,
                      readOnly: readOnly,
                      onAmountChanged: (amt) => showExampleToast(context, 'Amount: $amt'),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'International vs Indian Currency Showcase',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 384),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1. International Euro (€1,250,000.50)'),
                        SizedBox(height: 8),
                        CurrencyInput(
                          label: 'International Amount',
                          groupingSystem: NumberGroupingSystem.international,
                          initialValue: 1250000.50,
                        ),
                        SizedBox(height: 24),
                        Text('2. Indian Currency Format (₹12,50,000.50)'),
                        SizedBox(height: 8),
                        CurrencyInput(
                          label: 'Indian Amount',
                          leftIcon: Icons.currency_rupee_rounded,
                          groupingSystem: NumberGroupingSystem.indian,
                          initialValue: 1250000.50,
                        ),
                        SizedBox(height: 24),
                        Text('3. US Dollar Currency Format (\$50,000.00)'),
                        SizedBox(height: 8),
                        CurrencyInput(
                          label: 'US Dollar',
                          leftIcon: Icons.attach_money_rounded,
                          initialValue: 50000.00,
                        ),
                      ],
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
