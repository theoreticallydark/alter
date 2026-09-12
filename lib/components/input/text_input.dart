import 'package:flutter/material.dart';
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
///   - `hasLeftIcon: true` (default `Icons.face_5_outlined`)
///   - `hasRightIcon: false`
///   - `hasPrefix: false`
///   - `hasSuffix: false`
///   - `showLabel: true`
///   - `showCharacterLimit: true`
/// - Full Flutter `FormField<String>` integration supporting `Form.validate()` and `Form.save()`.
/// - Supports multiple simultaneous error conditions, rendering the latest error in evaluation order.
/// - Built-in validation for required (deferred until touch/blur or Form submit), email, phone, and character limits.
class TextInput extends StatefulWidget {
  /// Component version for reference.
  /// v1.4.0: Deferred isRequired validation until touch/blur or explicit Form validation (preventing immediate errors on pristine load).
  /// v1.3.0: Added support for multiple error conditions rendering the latest error in order; integrated InputControl v1.4.0 isRequired asterisk styling.
  /// v1.2.0: Aligned character limit overflow behavior with InputControl v1.3.0 ('Character limit exceeded').
  /// v1.1.0: Updated to use InputControl v1.2.0 API: renamed wordLimit to characterLimit, hide labelBar if showLabel is false, dynamic characterLimit shown only in typing state, independent isError and showErrorMessage properties.
  /// v1.0.0: Initial release of recreated TextInput built on InputControl matching Figma Node 471:1547.
  static const String version = '1.4.0';

  // Label Bar Properties (Figma defaults: showLabel=true, showCharacterLimit=true)
  final bool hasLabel;
  final bool showLabel;
  final String label;

  final bool hasCharacterLimit;
  final bool showCharacterLimit;
  final int? characterLimit;

  // Variant & State
  final InputControlType type;
  final InputControlStatus? statusOverride;

  // Left Section Slots (Figma default: hasLeftIcon=true, hasPrefix=false)
  final bool hasLeftIcon;
  final IconData? leftIcon;
  final Widget? leftIconWidget;

  final bool hasPrefix;
  final String prefix;
  final Widget? prefixWidget;

  final String placeholder;
  final String? value;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // Right Section Slots (Figma default: hasSuffix=false, hasRightIcon=false)
  final bool hasSuffix;
  final String suffix;
  final Widget? suffixWidget;

  final bool hasRightIcon;
  final IconData? rightIcon;
  final Widget? rightIconWidget;

  // Text Mode, Limits & Filtering
  final TextInputMode inputMode;
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
    this.hasLabel = true,
    this.showLabel = true,
    this.label = 'Label',
    this.hasCharacterLimit = true,
    this.showCharacterLimit = true,
    this.characterLimit = 32,
    this.type = InputControlType.gray,
    this.statusOverride,
    this.hasLeftIcon = true,
    this.leftIcon = Icons.face_5_outlined,
    this.leftIconWidget,
    this.hasPrefix = false,
    this.prefix = 'Prefix',
    this.prefixWidget,
    this.placeholder = 'Input',
    this.value,
    this.controller,
    this.focusNode,
    this.hasSuffix = false,
    this.suffix = 'Suffix',
    this.suffixWidget,
    this.hasRightIcon = false,
    this.rightIcon = Icons.face_5_outlined,
    this.rightIconWidget,
    this.inputMode = TextInputMode.all,
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
  FormFieldState<String>? _formFieldState;
  bool _hasInteracted = false;

  TextEditingController get _controller =>
      widget.controller ?? _internalController!;
  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode!;

  static final RegExp _emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
  static final RegExp _phoneRegExp = RegExp(r'^[+]?[\d\s\-()]{7,20}$');

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.value);
    }
    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }

    if (widget.value != null && widget.value!.isNotEmpty) {
      _hasInteracted = true;
    }

    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant TextInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onTextChanged);
      _internalController?.removeListener(_onTextChanged);

      if (widget.controller == null) {
        _internalController ??= TextEditingController(
          text: oldWidget.controller?.text ?? widget.value,
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }
      _controller.addListener(_onTextChanged);
    } else if (widget.controller == null && oldWidget.value != widget.value) {
      if (widget.value != null && _controller.text != widget.value) {
        _controller.text = widget.value!;
        _hasInteracted = true;
      } else if (widget.value == null && oldWidget.value != null) {
        _controller.clear();
      }
    }

    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode?.removeListener(_onFocusChanged);
      _internalFocusNode?.removeListener(_onFocusChanged);

      if (widget.focusNode == null) {
        _internalFocusNode ??= FocusNode();
      } else {
        _internalFocusNode?.dispose();
        _internalFocusNode = null;
      }
      _focusNode.addListener(_onFocusChanged);
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(_onTextChanged);
    }
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_onFocusChanged);
    }
    _internalController?.removeListener(_onTextChanged);
    _internalController?.dispose();
    _internalFocusNode?.removeListener(_onFocusChanged);
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    if (_controller.text.isNotEmpty) {
      _hasInteracted = true;
    }
    _formFieldState?.didChange(_controller.text);
    setState(() {});
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus) {
      // User entered the field and blurred (focus lost)
      _hasInteracted = true;
    }
    setState(() {});
  }

  /// Evaluates all validation conditions in order and collects active error messages.
  List<String> _evaluateActiveErrors(String? formError) {
    final errors = <String>[];
    final text = _controller.text;

    if (widget.autoValidateRules) {
      // 1. Required Rule (Deferred until touch/blur or explicit Form validation)
      if (widget.isRequired && text.trim().isEmpty) {
        final isFormValidationTriggered = formError != null;
        if (_hasInteracted || isFormValidationTriggered) {
          errors.add(widget.requiredErrorText ?? 'This field is required');
        }
      }

      // 2. Format / Input Mode Rules
      if (widget.inputMode == TextInputMode.email && text.trim().isNotEmpty) {
        if (!_emailRegExp.hasMatch(text.trim())) {
          errors.add(widget.emailErrorText ?? 'Please enter a valid email address');
        }
      }

      if (widget.inputMode == TextInputMode.phone && text.trim().isNotEmpty) {
        if (!_phoneRegExp.hasMatch(text.trim())) {
          errors.add(widget.phoneErrorText ?? 'Please enter a valid phone number');
        }
      }

      // 3. Character Limit Rule
      if (widget.characterLimit != null &&
          widget.characterLimit! > 0 &&
          text.length > widget.characterLimit!) {
        errors.add(widget.characterLimitErrorText ?? 'Character limit exceeded');
      }
    }

    // 4. Custom Form Validator Error
    if (formError != null && formError.trim().isNotEmpty) {
      errors.add(formError);
    }

    // 5. External Error Messages / Manual isError
    if (widget.errorMessages != null && widget.errorMessages!.isNotEmpty) {
      errors.addAll(widget.errorMessages!.where((e) => e.trim().isNotEmpty));
    } else if (widget.isError && widget.errorMessage.trim().isNotEmpty) {
      errors.add(widget.errorMessage);
    }

    return errors;
  }

  /// Evaluates the primary error for Flutter FormField validator integration.
  String? _evaluateBuiltInValidation(String? value) {
    final errors = _evaluateActiveErrors(null);
    return errors.isNotEmpty ? errors.last : null;
  }

  TextInputType get _keyboardType {
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
        return TextInputType.text;
    }
  }

  Widget _buildFieldContent(String? formError) {
    final activeErrors = _evaluateActiveErrors(formError);
    final hasError = activeErrors.isNotEmpty;
    final latestErrorMessage = hasError ? activeErrors.last : widget.errorMessage;

    InputControlStatus status;
    if (widget.statusOverride != null) {
      status = widget.statusOverride!;
    } else if (!widget.enabled) {
      status = InputControlStatus.disabled;
    } else if (widget.readOnly) {
      status = InputControlStatus.readonly;
    } else if (_focusNode.hasFocus) {
      status = InputControlStatus.selected;
    } else if (_controller.text.isNotEmpty) {
      status = InputControlStatus.filled;
    } else {
      status = InputControlStatus.default_;
    }

    return InputControl(
      hasLabel: widget.hasLabel,
      showLabel: widget.showLabel,
      label: widget.label,
      isRequired: widget.isRequired,
      hasCharacterLimit: widget.hasCharacterLimit,
      showCharacterLimit: widget.showCharacterLimit,
      characterLimit: widget.characterLimit,
      type: widget.type,
      status: status,
      hasLeftIcon: widget.hasLeftIcon,
      leftIcon: widget.leftIcon,
      leftIconWidget: widget.leftIconWidget,
      hasPrefix: widget.hasPrefix,
      prefix: widget.prefix,
      prefixWidget: widget.prefixWidget,
      placeholder: widget.placeholder,
      value: widget.value,
      controller: _controller,
      focusNode: _focusNode,
      hasSuffix: widget.hasSuffix,
      suffix: widget.suffix,
      suffixWidget: widget.suffixWidget,
      hasRightIcon: widget.hasRightIcon,
      rightIcon: widget.rightIcon,
      rightIconWidget: widget.rightIconWidget,
      isError: hasError,
      showErrorMessage: widget.showErrorMessage,
      errorMessage: latestErrorMessage,
      errorMessages: activeErrors,
      errorIconWidget: widget.errorIconWidget,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      keyboardType: _keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: (val) {
        widget.onChanged?.call(val);
      },
      onSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveValidator = widget.validator ?? _evaluateBuiltInValidation;

    if (widget.validator != null ||
        widget.onSaved != null ||
        widget.autovalidateMode != null ||
        widget.isRequired ||
        widget.characterLimit != null ||
        widget.inputMode == TextInputMode.email ||
        widget.inputMode == TextInputMode.phone) {
      return FormField<String>(
        initialValue: _controller.text,
        validator: effectiveValidator,
        onSaved: widget.onSaved,
        autovalidateMode: widget.autovalidateMode ??
            (widget.autoValidateRules
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled),
        builder: (FormFieldState<String> state) {
          _formFieldState = state;
          return _buildFieldContent(state.errorText);
        },
      );
    }

    _formFieldState = null;
    return _buildFieldContent(null);
  }
}
