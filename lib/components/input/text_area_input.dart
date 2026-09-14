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
  /// v2.3.0: Streamlined multiline sizing: Clean minLines and lines (max height) configuration. Non-adaptive fixed height when minLines is null; adaptive auto-expanding height up to lines when minLines is provided.
  /// v2.1.0: Aligned with InputControl v2.1.0 & TextInput v2.1.0 (removed showLabel/showCharacterLimit; labelBar renders when label is provided).
  /// v2.0.0: Aligned with InputControl v2.0.0 & TextInput v2.0.0 (removed statusOverride and redundant hasX booleans in favor of clean nullable props).
  /// v1.0.0: Initial release of TextArea wrapper built on TextInput with configurable lines height.
  static const String version = '2.3.0';

  // Label Bar Properties (default label: 'Description', characterLimit: 200)
  final String? label;
  final bool isRequired;
  final int? characterLimit;

  // Variant & Surface
  final InputControlType type;

  // Multiline Sizing
  final int lines;
  final int? minLines;

  // Left Section (default leftIcon: null for clean text areas)
  final IconData? leftIcon;
  final Widget? leftIconWidget;
  final String? prefix;
  final Widget? prefixWidget;

  // Content
  final String placeholder;
  final String? value;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // Suffix & Action
  final String? suffix;
  final Widget? suffixWidget;
  final ButtonIconGhost? rightButton;

  // Validation & Error
  final bool isError;
  final bool showErrorMessage;
  final String errorMessage;
  final List<String>? errorMessages;
  final Widget? errorIconWidget;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode? autovalidateMode;

  // Callbacks & Interactivity
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

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
