import 'package:flutter/material.dart';
import 'package:flutter/services.dart' hide TextInput;
import '../buttons/button_icon_ghost.dart';
import 'input_control.dart';
import 'text_input.dart';

/// A multiline text area input field for the Alter Design System built on [TextInput].
///
/// Features:
/// - Configurable `lines` (default: 4) which reserves multiline visual space.
/// - Character limit counting and validation.
/// - Reuses [TextInput] and [InputControl] for full design system tokens, states, and error handling.
class TextArea extends StatelessWidget {
  /// Component version for reference.
  /// v2.4.0: Added optional keyboardType (TextInputType?) fallback passthrough.
  /// v2.3.0: Streamlined multiline sizing: Clean minLines and lines (max height) configuration. Non-adaptive fixed height when minLines is null; adaptive auto-expanding height up to lines when minLines is provided.
  /// v2.1.0: Aligned with InputControl v2.1.0 & TextInput v2.1.0 (removed showLabel/showCharacterLimit; labelBar renders when label is provided).
  /// v2.0.0: Aligned with InputControl v2.0.0 & TextInput v2.0.0 (removed statusOverride and redundant hasX booleans in favor of clean nullable props).
  /// v1.0.0: Initial release of TextArea wrapper built on TextInput with configurable lines height.
  static const String version = '2.4.0';

  // Label Bar Properties (default label: 'Description', characterLimit: 200)
  /// Label text displayed above the text area.
  final String? label;

  /// Whether to display a red required asterisk next to the label.
  final bool isRequired;

  /// Maximum allowed character limit counter displayed on typing.
  final int? characterLimit;

  // Variant & Surface
  /// Surface background and border style variant.
  final InputControlType type;

  // Multiline Sizing
  /// Number of text lines determining the height of the area.
  final int lines;

  /// Optional minimum number of lines for dynamic expansion.
  final int? minLines;

  // Left Section (default leftIcon: null for clean text areas)
  /// Leading icon data.
  final IconData? leftIcon;

  /// Custom leading widget override.
  final Widget? leftIconWidget;

  /// Prefix text displayed before the input value.
  final String? prefix;

  /// Custom prefix widget override.
  final Widget? prefixWidget;

  // Content
  /// Hint placeholder text.
  final String placeholder;

  /// Initial or bound value string.
  final String? value;

  /// External text editing controller.
  final TextEditingController? controller;

  /// Focus node controlling input focus.
  final FocusNode? focusNode;

  // Suffix & Action
  /// Suffix descriptor text displayed at the trailing end.
  final String? suffix;

  /// Custom suffix widget override.
  final Widget? suffixWidget;

  /// Trailing action button (e.g. [ButtonIconGhost]).
  final ButtonIconGhost? rightButton;

  // Validation & Error
  /// Whether the input is in an explicit error state.
  final bool isError;

  /// Whether to render the error message beneath the field.
  final bool showErrorMessage;

  /// Default error message text.
  final String errorMessage;

  /// Optional list of multiple error messages.
  final List<String>? errorMessages;

  /// Custom icon widget override for the error message banner.
  final Widget? errorIconWidget;

  /// Form field validation callback.
  final FormFieldValidator<String>? validator;

  /// Form field on-saved callback.
  final FormFieldSetter<String>? onSaved;

  /// Autovalidate mode for form integration.
  final AutovalidateMode? autovalidateMode;

  // Callbacks & Interactivity
  /// Whether the text area is interactive.
  final bool enabled;

  /// Whether the text area is read-only.
  final bool readOnly;

  /// Whether the text area autofocuses.
  final bool autofocus;

  /// Virtual keyboard type for software keyboards.
  final TextInputType? keyboardType;

  /// Formatters applied to the text field input.
  final List<TextInputFormatter>? inputFormatters;

  /// Callback executed on value changes.
  final ValueChanged<String>? onChanged;

  /// Callback executed on keyboard submit.
  final ValueChanged<String>? onSubmitted;

  /// Callback executed when the input container is tapped.
  final VoidCallback? onTap;

  /// Creates a [TextArea] multiline input instance.
  const TextArea({
    super.key,
    this.label = 'Description',
    this.isRequired = false,
    this.characterLimit = 200,
    this.type = InputControlType.gray,
    this.lines = 4,
    this.minLines,
    this.leftIcon,
    this.leftIconWidget,
    this.prefix,
    this.prefixWidget,
    this.placeholder = 'Enter description...',
    this.value,
    this.controller,
    this.focusNode,
    this.suffix,
    this.suffixWidget,
    this.rightButton,
    this.isError = false,
    this.showErrorMessage = true,
    this.errorMessage = 'Error Message',
    this.errorMessages,
    this.errorIconWidget,
    this.validator,
    this.onSaved,
    this.autovalidateMode,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.keyboardType,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final int effectiveMinLines = minLines != null
        ? (minLines! <= lines ? minLines! : lines)
        : lines;
    final int effectiveMaxLines = lines;

    return TextInput(
      label: label,
      isRequired: isRequired,
      characterLimit: characterLimit,
      type: type,
      leftIcon: leftIcon,
      leftIconWidget: leftIconWidget,
      prefix: prefix,
      prefixWidget: prefixWidget,
      placeholder: placeholder,
      value: value,
      controller: controller,
      focusNode: focusNode,
      suffix: suffix,
      suffixWidget: suffixWidget,
      rightButton: rightButton,
      maxLines: effectiveMaxLines,
      minLines: effectiveMinLines,
      inputMode: TextInputMode.all,
      keyboardType: keyboardType,
      isError: isError,
      showErrorMessage: showErrorMessage,
      errorMessage: errorMessage,
      errorMessages: errorMessages,
      errorIconWidget: errorIconWidget,
      validator: validator,
      onSaved: onSaved,
      autovalidateMode: autovalidateMode,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      inputFormatters: inputFormatters,
      textInputAction: TextInputAction.newline,
      onTap: onTap,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
    );
  }
}
