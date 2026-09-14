import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../buttons/button_icon_ghost.dart';
import 'input_control.dart';

/// A secure password input field component for the Alter Design System built on [InputControl].
///
/// Features:
/// - Clean surface with no left icon by default (`leftIcon: null`, customizable).
/// - Space-denial input formatting (`allowSpaces: false` by default).
/// - Dynamic interactive eye toggle button ([ButtonIconGhost]) switching between visible and obscured text.
/// - Obscured text with `•` bullet point characters.
/// - Character limit counting and overflow handling.
/// - Configurable strength & complexity rules (min length, numbers, special characters, uppercase, lowercase).
/// - Full Flutter `FormField<String>` integration supporting `Form.validate()`.
class PasswordInput extends StatefulWidget {
  /// Component version for reference.
  /// v2.2.1: Fixed isRequired trigger lifecycle: Defer required error until blur (unfocus after focus) or explicit typing & clearing, preventing immediate error upon clicking into an empty field.
  /// v2.2.0: Removed default leftIcon (defaults to null); added allowSpaces formatter (deny spaces by default); added configurable password strength validation rules (minCharacters, requireNumber, requireSpecialChar, requireUppercase, requireLowercase); full characterLimit overflow support.
  /// v2.1.0: Aligned with InputControl v2.1.0 & TextInput v2.1.0 (removed showLabel/showCharacterLimit; labelBar renders when label is provided).
  /// v2.0.0: Aligned with InputControl v2.0.0 & TextInput v2.0.0 (removed statusOverride and redundant hasX booleans in favor of clean nullable props).
  /// v1.0.0: Initial release of PasswordInput wrapper built on TextInput with ButtonIconGhost eye toggle.
  static const String version = '2.2.1';

  // Label Bar Properties
  final String? label;
  final bool isRequired;
  final int? characterLimit;

  // Variant & Surface
  final InputControlType type;

  // Left Section (default leftIcon: null)
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

  // Formatting
  final bool allowSpaces;
  final List<TextInputFormatter>? inputFormatters;

  // Strength & Validation Rules
  final int? minCharacters;
  final bool requireNumber;
  final bool requireSpecialChar;
  final bool requireUppercase;
  final bool requireLowercase;
  final bool autoValidateRules;

  // Custom Error Texts
  final String? minCharactersErrorText;
  final String? requireNumberErrorText;
  final String? requireSpecialCharErrorText;
  final String? requireUppercaseErrorText;
  final String? requireLowercaseErrorText;
  final String? requiredErrorText;

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
    this.leftIcon,
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
    this.allowSpaces = false,
    this.inputFormatters,
    this.minCharacters = 8,
    this.requireNumber = false,
    this.requireSpecialChar = false,
    this.requireUppercase = false,
    this.requireLowercase = false,
    this.autoValidateRules = true,
    this.minCharactersErrorText,
    this.requireNumberErrorText,
    this.requireSpecialCharErrorText,
    this.requireUppercaseErrorText,
    this.requireLowercaseErrorText,
    this.requiredErrorText,
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

  bool _hasHadFocus = false;
  bool _hasBeenTouched = false;

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
    _controller.addListener(_onStateChange);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(covariant PasswordInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onStateChange);
      _internalController?.removeListener(_onStateChange);

      if (widget.controller == null) {
        _internalController ??= TextEditingController(
          text: oldWidget.controller?.text ?? widget.value,
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }
      _controller.addListener(_onStateChange);
    } else if (widget.controller == null &&
        oldWidget.value != widget.value) {
      if (widget.value != null && _controller.text != widget.value) {
        _controller.text = widget.value!;
      } else if (widget.value == null && oldWidget.value != null) {
        _controller.clear();
      }
    }

    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode?.removeListener(_onFocusChange);
      _internalFocusNode?.removeListener(_onFocusChange);

      if (widget.focusNode == null) {
        _internalFocusNode ??= FocusNode();
      } else {
        _internalFocusNode?.dispose();
        _internalFocusNode = null;
      }
      _focusNode.addListener(_onFocusChange);
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(_onStateChange);
    }
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_onFocusChange);
    }
    _internalController?.removeListener(_onStateChange);
    _internalController?.dispose();
    _internalFocusNode?.removeListener(_onFocusChange);
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _onStateChange() {
    setState(() {});
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _hasHadFocus = true;
    } else if (_hasHadFocus) {
      // User entered the field and blurred (clicked away / lost focus)
      _hasBeenTouched = true;
    }
    setState(() {});
  }

  void _toggleObscure() {
    setState(() {
      _isObscured = !_isObscured;
    });
    widget.onToggleObscure?.call(_isObscured);
  }

  List<TextInputFormatter> get _effectiveFormatters {
    final formatters = <TextInputFormatter>[];
    if (!widget.allowSpaces) {
      formatters.add(FilteringTextInputFormatter.deny(RegExp(r'\s')));
    }
    if (widget.inputFormatters != null) {
      formatters.addAll(widget.inputFormatters!);
    }
    return formatters;
  }

  List<String> _evaluateErrors(FormFieldState<String>? field) {
    final errors = <String>[];

    // 1. External error messages list
    if (widget.errorMessages != null && widget.errorMessages!.isNotEmpty) {
      errors.addAll(
        widget.errorMessages!.where((e) => e.trim().isNotEmpty),
      );
    } else if (widget.isError && widget.errorMessage.trim().isNotEmpty) {
      errors.add(widget.errorMessage);
    }

    // 2. Built-in automatic validation rules
    if (widget.autoValidateRules) {
      final text = _controller.text;

      // Required validation (deferred until touch/blur or form submission)
      if (widget.isRequired && _hasBeenTouched && text.trim().isEmpty) {
        errors.add(widget.requiredErrorText ?? '${widget.label ?? "Password"} is required');
      }

      if (text.isNotEmpty) {
        // Min characters
        if (widget.minCharacters != null && text.length < widget.minCharacters!) {
          errors.add(
            widget.minCharactersErrorText ??
                'Password must be at least ${widget.minCharacters} characters',
          );
        }

        // Require uppercase
        if (widget.requireUppercase && !RegExp(r'[A-Z]').hasMatch(text)) {
          errors.add(
            widget.requireUppercaseErrorText ??
                'Must contain at least 1 uppercase letter',
          );
        }

        // Require lowercase
        if (widget.requireLowercase && !RegExp(r'[a-z]').hasMatch(text)) {
          errors.add(
            widget.requireLowercaseErrorText ??
                'Must contain at least 1 lowercase letter',
          );
        }

        // Require number
        if (widget.requireNumber && !RegExp(r'[0-9]').hasMatch(text)) {
          errors.add(
            widget.requireNumberErrorText ??
                'Must contain at least 1 number',
          );
        }

        // Require special character
        if (widget.requireSpecialChar &&
            !RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-+=\[\]\\\/~`]').hasMatch(text)) {
          errors.add(
            widget.requireSpecialCharErrorText ??
                'Must contain at least 1 special character',
          );
        }
      }
    }

    // 3. FormField errorText from custom validator
    if (field?.errorText != null && field!.errorText!.isNotEmpty) {
      errors.add(field.errorText!);
    }

    return errors;
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
      validator: (val) {
        if (widget.validator != null) {
          return widget.validator!(val ?? _controller.text);
        }
        if (widget.isRequired && (val == null || val.trim().isEmpty)) {
          return widget.requiredErrorText ?? '${widget.label ?? "Password"} is required';
        }
        return null;
      },
      onSaved: widget.onSaved,
      autovalidateMode: widget.autovalidateMode ?? AutovalidateMode.disabled,
      builder: (FormFieldState<String> field) {
        final activeErrors = _evaluateErrors(field);
        final hasError = activeErrors.isNotEmpty || widget.isError;

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
          inputFormatters: _effectiveFormatters,
          isError: hasError,
          showErrorMessage: widget.showErrorMessage,
          errorMessage: widget.errorMessage,
          errorMessages: activeErrors,
          errorIconWidget: widget.errorIconWidget,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          textInputAction: TextInputAction.done,
          onTap: widget.onTap,
          onChanged: (text) {
            if (text.isNotEmpty) {
              _hasBeenTouched = true;
            }
            field.didChange(text);
            widget.onChanged?.call(text);
          },
          onSubmitted: widget.onSubmitted,
        );
      },
    );
  }
}
