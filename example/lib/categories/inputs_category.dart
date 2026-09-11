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
              final hintText = context.knobs.string(
                label: 'Hint Text',
                initialValue: 'Search items, tags, collections...',
              );
              final initialValue = context.knobs.stringOrNull(
                label: 'Initial Value',
                initialValue: null,
              );
              final type = context.knobs.object.dropdown(
                label: 'Variant',
                options: TextInputVariant.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: TextInputVariant.gray,
              );
              final hasIcon = context.knobs.boolean(
                label: 'Has Search Icon',
                initialValue: true,
              );
              final hasClear = context.knobs.boolean(
                label: 'Has Clear Button',
                initialValue: true,
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
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: Search(
                      key: ValueKey('search_${type.name}_${readOnly}_$initialValue'),
                      hintText: hintText,
                      initialValue: initialValue,
                      type: type,
                      hasIcon: hasIcon,
                      hasClear: hasClear,
                      enabled: enabled,
                      readOnly: readOnly,
                      onChanged: (val) => showExampleToast(
                        context,
                        'Search query: "$val"',
                      ),
                      onSubmitted: (query) => showExampleToast(
                        context,
                        'Submitted Search: "$query"',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All States Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Default State (Gray)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Search(
                          hintText: 'Search...',
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Filled / Typing State (With Clear Button)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Search(
                          initialValue: 'Design System Components',
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Read Only State',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Search(
                          initialValue: 'Static query',
                          readOnly: true,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Disabled State (48% Opacity)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Search(
                          hintText: 'Search disabled...',
                          enabled: false,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'White Variant',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AlterSemanticTokens.baseGray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              Search(
                                hintText: 'Search in white card...',
                                type: TextInputVariant.white,
                              ),
                            ],
                          ),
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
      WidgetbookComponent(
        name: 'TextInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Label',
              );
              final hasLabelBar = context.knobs.boolean(
                label: 'Has Label Bar',
                initialValue: true,
              );
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: 'Input',
              );
              final type = context.knobs.object.dropdown(
                label: 'Variant',
                options: TextInputVariant.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: TextInputVariant.gray,
              );
              final inputMode = context.knobs.object.dropdown(
                label: 'Input Mode',
                options: TextInputMode.values,
                labelBuilder: (m) => m.name,
                initialOption: TextInputMode.all,
              );
              final hasIcon = context.knobs.boolean(
                label: 'Has Leading Icon',
                initialValue: true,
              );
              final hasSuffix = context.knobs.boolean(
                label: 'Has Suffix',
                initialValue: false,
              );
              final suffix = context.knobs.string(
                label: 'Suffix Text',
                initialValue: 'suffix',
              );
              final hasClear = context.knobs.boolean(
                label: 'Has Clear Button',
                initialValue: true,
              );
              final hasCharacterLimit = context.knobs.boolean(
                label: 'Has Character Limit',
                initialValue: false,
              );
              final characterLimit = context.knobs.int.input(
                label: 'Character Limit',
                initialValue: 20,
              );
              final showCharacterLimit = context.knobs.boolean(
                label: 'Show Character Limit',
                initialValue: true,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final hasFeedback = context.knobs.boolean(
                label: 'Has Feedback on Error',
                initialValue: true,
              );
              final errorText = context.knobs.string(
                label: 'Error Text',
                initialValue: 'Feedback Text',
              );
              final initialValue = context.knobs.stringOrNull(
                label: 'Initial Value',
                initialValue: null,
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
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: TextInput(
                      key: ValueKey('${type.name}_${readOnly}_$initialValue'),
                      label: label,
                      hasLabelBar: hasLabelBar,
                      placeholder: placeholder,
                      initialValue: initialValue,
                      type: type,
                      inputMode: inputMode,
                      hasIcon: hasIcon,
                      hasSuffix: hasSuffix,
                      suffix: suffix,
                      hasClear: hasClear,
                      hasCharacterLimit: hasCharacterLimit,
                      characterLimit: characterLimit,
                      showCharacterLimit: showCharacterLimit,
                      isError: isError,
                      hasFeedback: hasFeedback,
                      errorText: errorText,
                      enabled: enabled,
                      readOnly: readOnly,
                      onChanged: (val) => showExampleToast(
                        context,
                        'TextInput changed: "$val"',
                      ),
                      onSubmitted: (val) => showExampleToast(
                        context,
                        'TextInput submitted: "$val"',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'Input Modes & Limits',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextInput(
                          label: 'Only Numbers (Digits Only)',
                          placeholder: '123456',
                          inputMode: TextInputMode.onlyNumbers,
                          icon: Icons.numbers,
                          hasClear: true,
                        ),
                        const SizedBox(height: 24),
                        const TextInput(
                          label: 'Only Alphabets',
                          placeholder: 'John Doe',
                          inputMode: TextInputMode.onlyAlphabets,
                          icon: Icons.person_outline,
                          hasClear: true,
                        ),
                        const SizedBox(height: 24),
                        const TextInput(
                          label: 'With Character Limit (Max 10 chars)',
                          placeholder: 'Max 10 chars',
                          hasCharacterLimit: true,
                          characterLimit: 10,
                          hasClear: true,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All States Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Default State (Gray)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          placeholder: 'Input',
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Filled State (Gray)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          initialValue: 'Filled text input',
                          type: TextInputVariant.gray,
                          hasClear: true,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Error State with FeedbackText (Gray)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          initialValue: 'Invalid input',
                          isError: true,
                          hasFeedback: true,
                          errorText: 'Feedback Text',
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Read Only State (Gray)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          initialValue: 'Read only text input',
                          readOnly: true,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Disabled State (48% Opacity)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          placeholder: 'Disabled input',
                          enabled: false,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'White Variant (Default, Read Only & Error)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AlterSemanticTokens.baseGray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              TextInput(
                                label: 'Label',
                                placeholder: 'Input',
                                type: TextInputVariant.white,
                              ),
                              SizedBox(height: 16),
                              TextInput(
                                label: 'Label',
                                initialValue: 'Read only text input',
                                readOnly: true,
                                type: TextInputVariant.white,
                              ),
                              SizedBox(height: 16),
                              TextInput(
                                label: 'Label',
                                initialValue: 'Wrong value',
                                isError: true,
                                hasFeedback: true,
                                errorText: 'Feedback Text',
                                type: TextInputVariant.white,
                              ),
                            ],
                          ),
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
      WidgetbookComponent(
        name: 'PasswordInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Password',
              );
              final hasLabelBar = context.knobs.boolean(
                label: 'Has Label Bar',
                initialValue: true,
              );
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: 'Enter password',
              );
              final type = context.knobs.object.dropdown(
                label: 'Variant',
                options: TextInputVariant.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: TextInputVariant.gray,
              );
              final hasCharacterLimit = context.knobs.boolean(
                label: 'Has Character Limit',
                initialValue: false,
              );
              final characterLimit = context.knobs.int.input(
                label: 'Character Limit',
                initialValue: 20,
              );
              final showCharacterLimit = context.knobs.boolean(
                label: 'Show Character Limit',
                initialValue: true,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final hasFeedback = context.knobs.boolean(
                label: 'Has Feedback on Error',
                initialValue: true,
              );
              final errorText = context.knobs.string(
                label: 'Error Text',
                initialValue: 'Password is required',
              );
              final initialValue = context.knobs.stringOrNull(
                label: 'Initial Value',
                initialValue: 'SecretP@ss123',
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
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: PasswordInput(
                      key: ValueKey('pw_${type.name}_${readOnly}_$initialValue'),
                      label: label,
                      hasLabelBar: hasLabelBar,
                      placeholder: placeholder,
                      initialValue: initialValue,
                      type: type,
                      hasCharacterLimit: hasCharacterLimit,
                      characterLimit: characterLimit,
                      showCharacterLimit: showCharacterLimit,
                      isError: isError,
                      hasFeedback: hasFeedback,
                      errorText: errorText,
                      enabled: enabled,
                      readOnly: readOnly,
                      onChanged: (val) => showExampleToast(
                        context,
                        'Password changed (len: ${val.length})',
                      ),
                      onSubmitted: (val) => showExampleToast(
                        context,
                        'Password submitted',
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All States Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Default State (Gray)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const PasswordInput(
                          label: 'Password',
                          placeholder: 'Enter password',
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Filled / Typing State (With Eye Toggle)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const PasswordInput(
                          label: 'Password',
                          initialValue: 'SuperSecret123!',
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Error State with FeedbackText',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const PasswordInput(
                          label: 'Password',
                          initialValue: 'weak',
                          isError: true,
                          hasFeedback: true,
                          errorText: 'Password must be at least 8 characters',
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Read Only State',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const PasswordInput(
                          label: 'Password',
                          initialValue: 'NonEditablePassword',
                          readOnly: true,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Disabled State (48% Opacity)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const PasswordInput(
                          label: 'Password',
                          placeholder: 'Disabled password input',
                          enabled: false,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'White Variant (Default, Filled & Error)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AlterSemanticTokens.baseGray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              PasswordInput(
                                label: 'Password',
                                placeholder: 'Enter password',
                                type: TextInputVariant.white,
                              ),
                              SizedBox(height: 16),
                              PasswordInput(
                                label: 'Password',
                                initialValue: 'MySecretToken456',
                                type: TextInputVariant.white,
                              ),
                              SizedBox(height: 16),
                              PasswordInput(
                                label: 'Password',
                                initialValue: 'bad',
                                isError: true,
                                hasFeedback: true,
                                errorText: 'Invalid credentials',
                                type: TextInputVariant.white,
                              ),
                            ],
                          ),
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
      WidgetbookComponent(
        name: 'NumericInput',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Amount',
              );
              final hasLabelBar = context.knobs.boolean(
                label: 'Has Label Bar',
                initialValue: true,
              );
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: '0.00',
              );
              final type = context.knobs.object.dropdown(
                label: 'Variant',
                options: TextInputVariant.values,
                labelBuilder: (v) => v.name.toUpperCase(),
                initialOption: TextInputVariant.gray,
              );
              final groupingSystem = context.knobs.object.dropdown(
                label: 'Grouping System',
                options: NumberGroupingSystem.values,
                labelBuilder: (g) => g.name.toUpperCase(),
                initialOption: NumberGroupingSystem.indian,
              );
              final allowDecimals = context.knobs.boolean(
                label: 'Allow Decimals',
                initialValue: true,
              );
              final decimalPlaces = context.knobs.int.input(
                label: 'Decimal Places',
                initialValue: 2,
              );
              final allowNegative = context.knobs.boolean(
                label: 'Allow Negative',
                initialValue: false,
              );
              final hasIcon = context.knobs.boolean(
                label: 'Has Leading Icon',
                initialValue: true,
              );
              final hasSuffix = context.knobs.boolean(
                label: 'Has Suffix',
                initialValue: false,
              );
              final suffix = context.knobs.string(
                label: 'Suffix Text',
                initialValue: 'INR',
              );
              final hasClear = context.knobs.boolean(
                label: 'Has Clear Button',
                initialValue: true,
              );
              final minValue = context.knobs.intOrNull.input(
                label: 'Min Value',
                initialValue: null,
              );
              final maxValue = context.knobs.intOrNull.input(
                label: 'Max Value',
                initialValue: 10000000,
              );
              final hasCharacterLimit = context.knobs.boolean(
                label: 'Has Character Limit',
                initialValue: false,
              );
              final characterLimit = context.knobs.int.input(
                label: 'Character Limit',
                initialValue: 15,
              );
              final showCharacterLimit = context.knobs.boolean(
                label: 'Show Character Limit',
                initialValue: true,
              );
              final isError = context.knobs.boolean(
                label: 'Is Error',
                initialValue: false,
              );
              final hasFeedback = context.knobs.boolean(
                label: 'Has Feedback on Error',
                initialValue: true,
              );
              final errorText = context.knobs.string(
                label: 'Error Text',
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
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: NumericInput(
                      key: ValueKey('num_${type.name}_${groupingSystem.name}_$readOnly'),
                      label: label,
                      hasLabelBar: hasLabelBar,
                      placeholder: placeholder,
                      type: type,
                      groupingSystem: groupingSystem,
                      allowDecimals: allowDecimals,
                      decimalPlaces: decimalPlaces > 0 ? decimalPlaces : null,
                      allowNegative: allowNegative,
                      minValue: minValue,
                      maxValue: maxValue,
                      hasCharacterLimit: hasCharacterLimit,
                      characterLimit: characterLimit,
                      showCharacterLimit: showCharacterLimit,
                      hasIcon: hasIcon,
                      icon: groupingSystem == NumberGroupingSystem.indian
                          ? Icons.currency_rupee
                          : Icons.attach_money,
                      hasSuffix: hasSuffix,
                      suffix: suffix,
                      hasClear: hasClear,
                      isError: isError,
                      hasFeedback: hasFeedback,
                      errorText: errorText,
                      enabled: enabled,
                      readOnly: readOnly,
                      onChangedNumber: (val) => showExampleToast(
                        context,
                        'Numeric value: $val',
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
            name: 'Indian vs International Formats',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Indian Numbering System (10,00,000)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const NumericInput(
                          label: 'Investment (INR)',
                          placeholder: '0',
                          initialValue: 1000000,
                          groupingSystem: NumberGroupingSystem.indian,
                          hasIcon: true,
                          icon: Icons.currency_rupee,
                          hasClear: true,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'International Numbering System (1,000,000)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const NumericInput(
                          label: 'Revenue (USD)',
                          placeholder: '0',
                          initialValue: 1000000,
                          groupingSystem: NumberGroupingSystem.international,
                          hasIcon: true,
                          icon: Icons.attach_money,
                          hasClear: true,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Integer Only with Unit Suffix & Bounds (1–100 kg)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const NumericInput(
                          label: 'Weight',
                          placeholder: '50',
                          initialValue: 75,
                          allowDecimals: false,
                          hasSuffix: true,
                          suffix: 'kg',
                          minValue: 1,
                          maxValue: 100,
                          hasClear: true,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          WidgetbookUseCase(
            name: 'All States Matrix',
            builder: (context) {
              return Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 378),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Default State (Gray)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const NumericInput(
                          label: 'Amount',
                          placeholder: '0.00',
                          groupingSystem: NumberGroupingSystem.indian,
                          hasIcon: true,
                          icon: Icons.currency_rupee,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Filled State (Indian Grouping)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const NumericInput(
                          label: 'Amount',
                          initialValue: 500000,
                          groupingSystem: NumberGroupingSystem.indian,
                          hasIcon: true,
                          icon: Icons.currency_rupee,
                          hasClear: true,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Error State (Out of Range)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const NumericInput(
                          label: 'Percentage (0-100%)',
                          initialValue: 150,
                          maxValue: 100,
                          hasSuffix: true,
                          suffix: '%',
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Read Only State',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const NumericInput(
                          label: 'Locked Balance',
                          initialValue: 125000,
                          groupingSystem: NumberGroupingSystem.indian,
                          hasIcon: true,
                          icon: Icons.currency_rupee,
                          readOnly: true,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Disabled State (48% Opacity)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const NumericInput(
                          label: 'Disabled Input',
                          placeholder: '0.00',
                          enabled: false,
                          type: TextInputVariant.gray,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'White Variant',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AlterSemanticTokens.baseGray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            children: [
                              NumericInput(
                                label: 'Price (USD)',
                                initialValue: 99.99,
                                hasIcon: true,
                                icon: Icons.attach_money,
                                type: TextInputVariant.white,
                              ),
                            ],
                          ),
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
