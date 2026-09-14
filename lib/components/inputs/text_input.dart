import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../buttons/button_icon_ghost.dart';
import 'input_control.dart';

/// Text filtering modes for [TextInput].
enum TextInputMode {
  /// Allows all characters.
  all,

  /// Only alphabetic characters (A-Z, a-z, spaces).
  onlyAlphabets,

  /// Alphanumeric characters (A-Z, a-z, 0-9, spaces).
  alphanumeric,

  /// Digits only (0-9).
  onlyNumbers,

  /// Decimal numbers (0-9, single period).
  decimal,

  /// Email format (disables spaces, suggestions).
  email,

  /// Phone number format (digits, +, -, spaces, parentheses).
  phone,
}

/// A comprehensive text entry field component for the Alter Design System built on [InputControl].
///
/// Direct implementation of Figma Node `471:1547` (`TextInput`):
/// - Composes [InputControl] with Figma default configuration:
///   - `leftIcon: Icons.face_5_outlined`
///   - `rightButton: null` (interactive trailing action via [ButtonIconGhost])
///   - `prefix: null`
///   - `suffix: null`
///   - `label: 'Label'`
///   - `characterLimit: 32`
/// - Full Flutter `FormField<String>` integration supporting `Form.validate()` and `Form.save()`.
/// - Supports multiple simultaneous error conditions, rendering the latest error in evaluation order.
/// - Built-in validation for required (deferred until touch/blur or Form submit), email, phone, and character limits.
class TextInput extends StatefulWidget {
  /// Component version for reference.
  /// v2.3.0: Streamlined multiline sizing: Clean minLines and maxLines configuration without redundant boolean flags.
  /// v2.2.0: Fixed isRequired trigger lifecycle: Defer required error until blur (unfocus after focus) or explicit typing & clearing, preventing immediate error upon clicking into an empty field.
  /// v2.1.0: Aligned with InputControl v2.1.0: removed showLabel and showCharacterLimit booleans. Label bar and UI counter render when label is non-null.
  /// v2.0.0: Pure Flutter convention overhaul: Removed statusOverride and redundant hasLabel, hasCharacterLimit, hasPrefix, hasSuffix, and hasLeftIcon flags in favor of clean nullable properties.
  /// v1.6.0: Streamlined right action slot to accept ButtonIconGhost? rightButton directly (matching InputControl v1.6.0).
  /// v1.5.0: Integrated ButtonIconGhost rightIcon configuration (rightIconType, onRightIconTap), maxLines/minLines, and inputFormatters passthrough to InputControl v1.5.0.
  /// v1.4.0: Deferred isRequired validation until touch/blur or explicit Form validation (preventing immediate errors on pristine load).
  /// v1.3.0: Added support for multiple error conditions rendering the latest error in order; integrated InputControl v1.4.0 isRequired asterisk styling.
  /// v1.2.0: Aligned character limit overflow behavior with InputControl v1.3.0 ('Character limit exceeded').
  /// v1.1.0: Updated to use InputControl v1.2.0 API: renamed wordLimit to characterLimit, hide labelBar if showLabel is false, dynamic characterLimit shown only in typing state, independent isError and showErrorMessage properties.
  /// v2.4.0: Added optional keyboardType (TextInputType?) fallback for direct native virtual keyboard override.
  /// v2.3.0: Multiline sizing support: Added minLines and maxLines passthrough with safe bounds guarding.
  /// v2.2.0: Added TextInputMode enum (all, numeric, email, phone, decimal, alphanumeric, onlyAlphabets, onlyNumbers) with automatic formatters, autocorrect, autofillHints, enableSuggestions, and phone/email validation.
  /// v2.1.0: Aligned with InputControl v2.1.0 (removed showLabel/showCharacterLimit; labelBar renders when label is provided).
  /// v2.0.0: Aligned with InputControl v2.0.0 (removed statusOverride and redundant hasX booleans in favor of clean nullable props).
  /// v1.0.0: Initial release of TextInput built on InputControl.
  static const String version = '2.4.0';

  // Label Bar Properties (Figma default: label='Label', isRequired=false, characterLimit=32)
  final String? label;
  final int? characterLimit;

  // Variant & Surface
  final InputControlType type;

  // Left Section Slots (Figma default: leftIcon=Icons.face_5_outlined, prefix=null)
  final IconData? leftIcon;
  final Widget? leftIconWidget;

  final String? prefix;
  final Widget? prefixWidget;

  final String placeholder;
  final String? value;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // Right Section Slots (Figma default: suffix=null, rightButton=null)
  final String? suffix;
  final Widget? suffixWidget;

  final ButtonIconGhost? rightButton;

  // Core Text & Format Passthroughs
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;

  // Text Mode, Limits & Filtering
  final TextInputMode inputMode;
  final TextInputType? keyboardType;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final Iterable<String>? autofillHints;

  // Validation & Multiple Error Support
  final bool isRequired;
  final bool autoValidateRules;
  final bool isError;
  final bool showErrorMessage;
  final String errorMessage;
  final List<String>? errorMessages;
  final String? requiredErrorText;
  final String? emailErrorText;
  final String? phoneErrorText;
  final String? characterLimitErrorText;
  final Widget? errorIconWidget;

  // Interactivity & Callbacks
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onTap;
  final TextInputAction textInputAction;

  // Form Integration
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode? autovalidateMode;

  const TextInput({
    super.key,
    this.label = 'Label',
    this.characterLimit = 32,
    this.type = InputControlType.gray,
    this.leftIcon = Icons.face_5_outlined,
    this.leftIconWidget,
    this.prefix,
    this.prefixWidget,
    this.placeholder = 'Input',
    this.value,
    this.controller,
    this.focusNode,
    this.suffix,
    this.suffixWidget,
    this.rightButton,
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters,
    this.inputMode = TextInputMode.all,
    this.keyboardType,
    this.autocorrect,
    this.enableSuggestions,
    this.autofillHints,
    this.isRequired = false,
    this.autoValidateRules = true,
    this.isError = false,
    this.showErrorMessage = true,
    this.errorMessage = 'Error Message',
    this.errorMessages,
    this.requiredErrorText,
    this.emailErrorText,
    this.phoneErrorText,
    this.characterLimitErrorText,
    this.errorIconWidget,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.onTap,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onSaved,
    this.autovalidateMode,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
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
  void didUpdateWidget(covariant TextInput oldWidget) {
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

  /// Resolve input formatters based on [widget.inputMode] and custom formatters.
  List<TextInputFormatter> get _effectiveInputFormatters {
    final formatters = <TextInputFormatter>[];

    switch (widget.inputMode) {
      case TextInputMode.onlyAlphabets:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')));
        break;
      case TextInputMode.alphanumeric:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')));
        break;
      case TextInputMode.onlyNumbers:
        formatters.add(FilteringTextInputFormatter.digitsOnly);
        break;
      case TextInputMode.decimal:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')));
        break;
      case TextInputMode.email:
        formatters.add(FilteringTextInputFormatter.deny(RegExp(r'\s')));
        break;
      case TextInputMode.phone:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[\d\+\-\(\)\s]')));
        break;
      case TextInputMode.all:
        break;
    }

    if (widget.inputFormatters != null) {
      formatters.addAll(widget.inputFormatters!);
    }

    return formatters;
  }

  /// Resolved keyboard type: uses [widget.keyboardType] if explicitly provided,
  /// otherwise derives from [widget.inputMode] and multiline state.
  TextInputType get _effectiveKeyboardType {
    if (widget.keyboardType != null) {
      return widget.keyboardType!;
    }
    switch (widget.inputMode) {
      case TextInputMode.onlyNumbers:
        return TextInputType.number;
      case TextInputMode.decimal:
        return const TextInputType.numberWithOptions(decimal: true);
      case TextInputMode.email:
        return TextInputType.emailAddress;
      case TextInputMode.phone:
        return TextInputType.phone;
      case TextInputMode.all:
      case TextInputMode.onlyAlphabets:
      case TextInputMode.alphanumeric:
        return widget.maxLines != null && widget.maxLines! > 1
            ? TextInputType.multiline
            : TextInputType.text;
    }
  }

  /// Collects active validation errors in sequence.
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
        errors.add(widget.requiredErrorText ?? '${widget.label ?? "Field"} is required');
      }

      // Email format
      if (widget.inputMode == TextInputMode.email && text.isNotEmpty) {
        final emailRegex = RegExp(
          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)+$',
        );
        if (!emailRegex.hasMatch(text)) {
          errors.add(widget.emailErrorText ?? 'Enter a valid email address');
        }
      }

      // Phone format
      if (widget.inputMode == TextInputMode.phone && text.isNotEmpty) {
        final digits = text.replaceAll(RegExp(r'\D'), '');
        if (digits.length < 7) {
          errors.add(widget.phoneErrorText ?? 'Enter a valid phone number');
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
    return FormField<String>(
      initialValue: widget.value ?? widget.controller?.text,
      validator: (val) {
        // If form is validating explicitly, mark as touched
        if (widget.isRequired) {
          _hasBeenTouched = true;
        }

        if (widget.validator != null) {
          return widget.validator!(val ?? _controller.text);
        }
        if (widget.isRequired && (val == null || val.trim().isEmpty)) {
          return widget.requiredErrorText ?? '${widget.label ?? "Field"} is required';
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
          rightButton: widget.rightButton,
          obscureText: false,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          inputFormatters: _effectiveInputFormatters,
          isError: hasError,
          showErrorMessage: widget.showErrorMessage,
          errorMessage: widget.errorMessage,
          errorMessages: activeErrors,
          errorIconWidget: widget.errorIconWidget,
          enabled: widget.enabled,
          readOnly: widget.readOnly,
          autofocus: widget.autofocus,
          keyboardType: _effectiveKeyboardType,
          textInputAction: widget.textInputAction,
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
