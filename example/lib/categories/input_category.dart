import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart' hide TextInput, TextInputMode;
import 'package:alter/components/input/text_input.dart';
import '../toast_helper.dart';

WidgetbookFolder inputCategory() {
  return WidgetbookFolder(
    name: 'Input',
    children: [
      WidgetbookComponent(
        name: 'InputControl',
        useCases: [
          WidgetbookUseCase(
            name: 'Interactive',
            builder: (context) {
              final label = context.knobs.string(
                label: 'Label',
                initialValue: 'Label',
              );
              final hasLabel = context.knobs.boolean(
                label: 'Has Label',
                initialValue: true,
              );
              final showLabel = context.knobs.boolean(
                label: 'Show Label',
                initialValue: true,
              );
              final isRequired = context.knobs.boolean(
                label: 'Is Required (Asterisk beside label)',
                initialValue: false,
              );
              final hasCharacterLimit = context.knobs.boolean(
                label: 'Has Character Limit',
                initialValue: true,
              );
              final showCharacterLimit = context.knobs.boolean(
                label: 'Show Character Limit',
                initialValue: true,
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
              final status = context.knobs.object.dropdown(
                label: 'Status',
                options: InputControlStatus.values,
                labelBuilder: (s) => s.name.toUpperCase(),
                initialOption: InputControlStatus.default_,
              );
              final placeholder = context.knobs.string(
                label: 'Placeholder',
                initialValue: 'Input',
              );
              final value = context.knobs.stringOrNull(
                label: 'Value',
                initialValue: null,
              );
              final hasLeftIcon = context.knobs.boolean(
                label: 'Has Left Icon',
                initialValue: true,
              );
              final hasPrefix = context.knobs.boolean(
                label: 'Has Prefix',
                initialValue: true,
              );
              final prefix = context.knobs.string(
                label: 'Prefix Text',
                initialValue: 'Prefix',
              );
              final hasSuffix = context.knobs.boolean(
                label: 'Has Suffix',
                initialValue: true,
              );
              final suffix = context.knobs.string(
                label: 'Suffix Text',
                initialValue: 'Suffix',
              );
              final hasRightIcon = context.knobs.boolean(
                label: 'Has Right Icon',
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
                        'input_control_${type.name}_${status.name}_${readOnly}_${isError}_$value',
                      ),
                      hasLabel: hasLabel,
                      showLabel: showLabel,
                      label: label,
                      isRequired: isRequired,
                      hasCharacterLimit: hasCharacterLimit,
                      showCharacterLimit: showCharacterLimit,
                      characterLimit: characterLimit,
                      type: type,
                      status: status,
                      placeholder: placeholder,
                      value: value,
                      hasLeftIcon: hasLeftIcon,
                      leftIcon: Icons.face_5_outlined,
                      hasPrefix: hasPrefix,
                      prefix: prefix,
                      hasSuffix: hasSuffix,
                      suffix: suffix,
                      hasRightIcon: hasRightIcon,
                      rightIcon: Icons.face_5_outlined,
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
            name: 'All Status Matrix (Gray vs White)',
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
                          'Status: Default (Empty / Inactive)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          status: InputControlStatus.default_,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Status: Selected (Typing State -> Shows Character Counter x/32)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          status: InputControlStatus.selected,
                          value: 'Active typing',
                          characterLimit: 32,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Status: Filled (Inactive Populated)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          status: InputControlStatus.filled,
                          value: 'Populated value',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Error on Inactive Input (isError: true, showErrorMessage: true)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          value: 'Invalid input',
                          isError: true,
                          showErrorMessage: true,
                          errorMessage: 'Invalid value entered',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Error on Active / Typing Input (Border only, showErrorMessage: false)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          status: InputControlStatus.selected,
                          value: 'Typing with error',
                          isError: true,
                          showErrorMessage: false,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Status: Readonly',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          status: InputControlStatus.readonly,
                          value: 'Readonly value',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Status: Disabled (48% Opacity)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const InputControl(
                          type: InputControlType.gray,
                          status: InputControlStatus.disabled,
                        ),
                        const SizedBox(height: 48),
                        Text(
                          'WHITE VARIANT (Figma Node 471:1744)',
                          style: AlterTypography.h4Bold.copyWith(
                            color: AlterSemanticTokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AlterSemanticTokens.baseGray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputControl(
                                type: InputControlType.white,
                                status: InputControlStatus.default_,
                              ),
                              SizedBox(height: 16),
                              InputControl(
                                type: InputControlType.white,
                                status: InputControlStatus.selected,
                                value: 'Active white input',
                              ),
                              SizedBox(height: 16),
                              InputControl(
                                type: InputControlType.white,
                                isError: true,
                                errorMessage: 'Error Message',
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
              final hasLabel = context.knobs.boolean(
                label: 'Has Label',
                initialValue: true,
              );
              final showLabel = context.knobs.boolean(
                label: 'Show Label',
                initialValue: true,
              );
              final hasCharacterLimit = context.knobs.boolean(
                label: 'Has Character Limit',
                initialValue: true,
              );
              final showCharacterLimit = context.knobs.boolean(
                label: 'Show Character Limit',
                initialValue: true,
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
              final hasLeftIcon = context.knobs.boolean(
                label: 'Has Left Icon',
                initialValue: true,
              );
              final hasPrefix = context.knobs.boolean(
                label: 'Has Prefix',
                initialValue: false,
              );
              final prefix = context.knobs.string(
                label: 'Prefix Text',
                initialValue: 'Prefix',
              );
              final hasSuffix = context.knobs.boolean(
                label: 'Has Suffix',
                initialValue: false,
              );
              final suffix = context.knobs.string(
                label: 'Suffix Text',
                initialValue: 'Suffix',
              );
              final hasRightIcon = context.knobs.boolean(
                label: 'Has Right Icon',
                initialValue: false,
              );
              final isRequired = context.knobs.boolean(
                label: 'Is Required',
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
                        'text_input_${type.name}_${readOnly}_${isError}_$value',
                      ),
                      hasLabel: hasLabel,
                      showLabel: showLabel,
                      label: label,
                      hasCharacterLimit: hasCharacterLimit,
                      showCharacterLimit: showCharacterLimit,
                      characterLimit: characterLimit,
                      type: type,
                      inputMode: inputMode,
                      placeholder: placeholder,
                      value: value,
                      hasLeftIcon: hasLeftIcon,
                      leftIcon: Icons.face_5_outlined,
                      hasPrefix: hasPrefix,
                      prefix: prefix,
                      hasSuffix: hasSuffix,
                      suffix: suffix,
                      hasRightIcon: hasRightIcon,
                      rightIcon: Icons.face_5_outlined,
                      isRequired: isRequired,
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
          WidgetbookUseCase(
            name: 'Figma States Matrix (Node 471:1547)',
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
                          'FIGMA DEFAULTS (Node 471:1547)',
                          style: AlterTypography.h4Bold.copyWith(
                            color: AlterSemanticTokens.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'State: Default (Empty / Inactive)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          placeholder: 'Input',
                          characterLimit: 32,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'State: Selected (Typing -> Dynamic counter visible)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          value: 'Input',
                          characterLimit: 32,
                          statusOverride: InputControlStatus.selected,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'State: Filled (Inactive Populated)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          value: 'Input',
                          characterLimit: 32,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'State: Error (Inactive, Red border + Error message)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          value: 'Input',
                          characterLimit: 32,
                          isError: true,
                          errorMessage: 'Error Message',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'State: Error (Active / Typing, Red border)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          value: 'Input typing',
                          characterLimit: 32,
                          statusOverride: InputControlStatus.selected,
                          isError: true,
                          errorMessage: 'Invalid input',
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'State: Readonly',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          value: 'Input',
                          characterLimit: 32,
                          readOnly: true,
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'State: Disabled (48% Opacity)',
                          style: AlterTypography.captionBold.copyWith(
                            color: AlterSemanticTokens.textSecondary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const TextInput(
                          label: 'Label',
                          placeholder: 'Input',
                          characterLimit: 32,
                          enabled: false,
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
