import 'package:flutter/material.dart';
import '../buttons/button_icon_ghost.dart';
import 'input_control.dart';
import 'text_input.dart';

/// A secure password input field component for the Alter Design System built on [TextInput].
///
/// Features:
/// - Pre-configured lock icon (`Icons.lock_outline_rounded`) on left.
/// - Dynamic interactive eye toggle button ([ButtonIconGhost]) switching between visible and obscured text.
/// - Obscured text with `•` bullet point characters.
/// - Form integration and error handling via [TextInput].
class PasswordInput extends StatefulWidget {
  /// Component version for reference.
  /// v2.1.0: Aligned with InputControl v2.1.0 & TextInput v2.1.0 (removed showLabel/showCharacterLimit; labelBar renders when label is provided).
  /// v2.0.0: Aligned with InputControl v2.0.0 & TextInput v2.0.0 (removed statusOverride and redundant hasX booleans in favor of clean nullable props).
  /// v1.0.0: Initial release of PasswordInput wrapper built on TextInput with ButtonIconGhost eye toggle.
  static const String version = '2.1.0';

  // Label Bar Properties
  final String? label;
  final bool isRequired;
  final int? characterLimit;

  // Variant & Surface
  final InputControlType type;

  // Left Section
  final IconData? leftIcon;
  final Widget? leftIconWidget;
  final String? prefix;
  final Widget? prefixWidget;

  // Content
  final String placeholder;
  final String? value;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // Suffix & Visibility Toggle
  final String? suffix;
  final Widget? suffixWidget;
  final bool showEyeToggle;
  final bool initiallyObscured;
  final String obscuringCharacter;
  final ValueChanged<bool>? onToggleObscure;

  // Validation & Error
  final bool isError;
  final bool showErrorMessage;
  final String errorMessage;
  final List<String>? errorMessages;
  final Widget? errorIconWidget;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode? autovalidateMode;

  // Callbacks
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

  const PasswordInput({
    super.key,
    this.label = 'Password',
    this.isRequired = false,
    this.characterLimit,
    this.type = InputControlType.gray,
    this.leftIcon = Icons.lock_outline_rounded,
    this.leftIconWidget,
    this.prefix,
    this.prefixWidget,
    this.placeholder = 'Enter password',
    this.value,
    this.controller,
    this.focusNode,
    this.suffix,
    this.suffixWidget,
    this.showEyeToggle = true,
    this.initiallyObscured = true,
    this.obscuringCharacter = '•',
    this.onToggleObscure,
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
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  late bool _isObscured;
  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;

  TextEditingController get _controller =>
      widget.controller ?? _internalController!;
  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode!;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.initiallyObscured;
    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.value);
    }
    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }
  }

  @override
  void dispose() {
    _internalController?.dispose();
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
    widget.onToggleObscure?.call(_isObscured);
  }

  @override
  Widget build(BuildContext context) {
    ButtonIconGhost? eyeButton;
    if (widget.showEyeToggle && widget.enabled) {
      eyeButton = ButtonIconGhost(
        icon: _isObscured
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        type: ButtonIconGhostType.secondary,
        onTap: _toggleObscure,
      );
    }

    return FormField<String>(
      initialValue: widget.value ?? widget.controller?.text,
      validator: widget.validator,
      onSaved: widget.onSaved,
      autovalidateMode: widget.autovalidateMode,
      builder: (FormFieldState<String> field) {
        return InputControl(
          label: widget.label,
          isRequired: widget.isRequired,
          characterLimit: widget.characterLimit,
          type: widget.type,
          leftIcon: widget.leftIcon,
          leftIconWidget: widget.leftIconWidget,
          prefix: widget.prefix,
          prefixWidget: widget.prefixWidget,
          placeholder: widget.placeholder,
          value: widget.value,
          controller: _controller,
          focusNode: _focusNode,
          suffix: widget.suffix,
          suffixWidget: widget.suffixWidget,
          rightButton: eyeButton,
          obscureText: _isObscured,
          obscuringCharacter: widget.obscuringCharacter,
          isError: widget.isError || (field.errorText != null && field.errorText!.isNotEmpty),
          showErrorMessage: widget.showErrorMessage,
          errorMessage: widget.errorMessage,
          errorMessages: widget.errorMessages,
          errorIconWidget: widget.errorIconWidget,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          textInputAction: TextInputAction.done,
          onTap: widget.onTap,
          onChanged: (text) {
            field.didChange(text);
            widget.onChanged?.call(text);
          },
          onSubmitted: widget.onSubmitted,
        );
      },
    );
  }
}
