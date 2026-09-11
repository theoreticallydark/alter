import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_icon_ghost.dart';
import '../status/feedback_text.dart';
import 'input_container.dart';
import 'text_input.dart';

/// Reusable Password Input field component for the Alter Design System.
///
/// Figma Specifications (Node `441:9205` & dependent `.rightSlot` Node `454:482`):
/// - Variants:
///   - `type=Gray`: Fill `baseGray` (`#F9FAFB`), Border 1px `stroke200` (`#E5E7EB`)
///   - `type=White`: Fill `baseWhite` (`#FFFFFF`), Border 1px `stroke100` (`#F3F4F6`)
///   - `state=Default`: Placeholder visible, subtle border
///   - `state=Typing`: Focused, Border 1px `stroke1000` (`#000000`)
///   - `state=Filled`: Unfocused with content, subtle border
///   - `state=ReadOnly`: Border 1px `textDisabled` (`#99A1AF`), non-editable
///   - `state=Disabled`: 48% opacity, disabled interaction
///   - `state=Error`: Border 1px `textDanger` (`#E7000B`), optional [FeedbackText]
/// - Smart Password Validation Engine:
///   - Built-in customizable checks for [minLength] (default 8), [maxLength], [requireSpecialChar], [requireUppercase], and [requireDigit].
///   - Password reveal toggle ([ButtonIconGhost]) in `.rightSlot` visible when text is entered.
///   - Autocorrect & suggestions disabled by default with native `AutofillHints.password`.
class PasswordInput extends StatefulWidget {
  /// Component version for reference.
  /// v1.1.1: Added isRequired support with label asterisk and required error validation.
  /// v1.1.0: Added smart password validation engine (minLength, maxLength, specialChar, uppercase, digit) with custom error text overrides.
  /// v1.0.1: Refactored to compose shared InputContainer for visual styling, border states, and label bar.
  /// v1.0.0: Initial release of dedicated PasswordInput component.
  static const String version = '1.1.1';

  final String? label;
  final bool hasLabelBar;
  final String? placeholder;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputVariant type;

  // Password / Obscure
  final String obscuringCharacter;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final Iterable<String>? autofillHints;

  // Limits (labelBarContainer: character limit counter)
  final bool hasCharacterLimit;
  final int? characterLimit;
  final bool showCharacterLimit;

  // Smart Password Validation Rules
  final bool isRequired;
  final int? minLength;
  final int? maxLength;
  final bool requireSpecialChar;
  final bool requireUppercase;
  final bool requireDigit;
  final bool autoValidateRules;

  // Custom Error Text Overrides
  final String? requiredErrorText;
  final String? minLengthErrorText;
  final String? maxLengthErrorText;
  final String? specialCharErrorText;
  final String? uppercaseErrorText;
  final String? digitErrorText;

  // Error & Feedback
  final bool isError;
  final bool hasFeedback;
  final String? errorText;

  // State & Interactivity
  final bool enabled;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputAction textInputAction;

  // Form Validation Integration
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode? autovalidateMode;

  const PasswordInput({
    super.key,
    this.label = 'Password',
    this.hasLabelBar = true,
    this.placeholder = 'Enter password',
    this.initialValue,
    this.controller,
    this.focusNode,
    this.type = TextInputVariant.gray,
    this.obscuringCharacter = '•',
    this.autocorrect = false,
    this.enableSuggestions = false,
    this.autofillHints = const [AutofillHints.password],
    this.hasCharacterLimit = false,
    this.characterLimit,
    this.showCharacterLimit = true,
    this.isRequired = false,
    this.minLength = 8,
    this.maxLength,
    this.requireSpecialChar = false,
    this.requireUppercase = false,
    this.requireDigit = false,
    this.autoValidateRules = true,
    this.requiredErrorText,
    this.minLengthErrorText,
    this.maxLengthErrorText,
    this.specialCharErrorText,
    this.uppercaseErrorText,
    this.digitErrorText,
    this.isError = false,
    this.hasFeedback = true,
    this.errorText = 'Feedback Text',
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onSaved,
    this.autovalidateMode,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;
  FormFieldState<String>? _formFieldState;

  TextEditingController get _controller =>
      widget.controller ?? _internalController!;
  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode!;

  bool _isObscured = true;

  static final RegExp _specialCharRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>_\-+=\[\]\\\/]');
  static final RegExp _uppercaseRegExp = RegExp(r'[A-Z]');
  static final RegExp _digitRegExp = RegExp(r'[0-9]');

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.initialValue);
    }
    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }

    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant PasswordInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Sync Controller
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onTextChanged);
      _internalController?.removeListener(_onTextChanged);

      if (widget.controller == null) {
        _internalController ??= TextEditingController(
          text: oldWidget.controller?.text ?? widget.initialValue,
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }
      _controller.addListener(_onTextChanged);
    } else if (widget.controller == null &&
        oldWidget.initialValue != widget.initialValue &&
        widget.initialValue != null) {
      if (_controller.text.isEmpty || _controller.text == oldWidget.initialValue) {
        _controller.text = widget.initialValue!;
      }
    }

    // Sync FocusNode
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
    _formFieldState?.didChange(_controller.text);
    setState(() {});
  }

  void _onFocusChanged() {
    setState(() {});
  }

  String? _evaluateBuiltInValidation(String? value) {
    if (!widget.autoValidateRules) {
      return null;
    }

    final text = value ?? '';

    // Required check
    if (widget.isRequired && text.trim().isEmpty) {
      return widget.requiredErrorText ?? 'This field is required';
    }

    if (text.isEmpty) {
      return null;
    }

    // Minimum Length
    if (widget.minLength != null && text.length < widget.minLength!) {
      return widget.minLengthErrorText ??
          'Password must be at least ${widget.minLength} characters';
    }

    // Maximum Length
    if (widget.maxLength != null && text.length > widget.maxLength!) {
      return widget.maxLengthErrorText ??
          'Password cannot exceed ${widget.maxLength} characters';
    }

    // Uppercase Requirement
    if (widget.requireUppercase && !_uppercaseRegExp.hasMatch(text)) {
      return widget.uppercaseErrorText ??
          'Password must include at least one uppercase letter';
    }

    // Digit Requirement
    if (widget.requireDigit && !_digitRegExp.hasMatch(text)) {
      return widget.digitErrorText ??
          'Password must include at least one number';
    }

    // Special Character Requirement
    if (widget.requireSpecialChar && !_specialCharRegExp.hasMatch(text)) {
      return widget.specialCharErrorText ??
          'Password must include at least one special character';
    }

    return null;
  }

  bool _computeIsError(String? formError) {
    if (widget.isError) return true;
    if (formError != null && formError.isNotEmpty) return true;
    final builtInError = _evaluateBuiltInValidation(_controller.text);
    return builtInError != null && builtInError.isNotEmpty;
  }

  String? _computeErrorText(String? formError) {
    if (formError != null && formError.isNotEmpty) {
      return formError;
    }
    final builtInError = _evaluateBuiltInValidation(_controller.text);
    if (builtInError != null && builtInError.isNotEmpty) {
      return builtInError;
    }
    return widget.errorText;
  }

  List<TextInputFormatter> get _inputFormatters {
    final formatters = <TextInputFormatter>[];

    // Character Limit enforcement
    if (widget.hasCharacterLimit &&
        widget.characterLimit != null &&
        widget.characterLimit! > 0) {
      formatters.add(LengthLimitingTextInputFormatter(widget.characterLimit));
    }

    return formatters;
  }

  Color get _textColor {
    if (widget.readOnly) {
      return AlterSemanticTokens.textSecondary;
    }
    return AlterSemanticTokens.textPrimary;
  }

  /// Builds the right-hand password visibility toggle button (.rightSlot: type=Password).
  Widget? _buildRightSlot() {
    if (_controller.text.isNotEmpty && widget.enabled && !widget.readOnly) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          ButtonIconGhost(
            icon: _isObscured
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 24,
            type: ButtonIconGhostType.secondary,
            onTap: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          ),
        ],
      );
    }
    return null;
  }

  Widget _buildFieldContent(String? formError) {
    final isError = _computeIsError(formError);
    final errorText = _computeErrorText(formError);
    final rightSlot = _buildRightSlot();

    return InputContainer(
      label: widget.label,
      hasLabelBar: widget.hasLabelBar,
      isRequired: widget.isRequired,
      hasCharacterLimit: widget.hasCharacterLimit,
      characterLimit: widget.characterLimit,
      showCharacterLimit: widget.showCharacterLimit,
      currentLength: _controller.text.length,
      type: widget.type,
      isError: isError,
      hasFeedback: widget.hasFeedback,
      errorText: errorText,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      hasFocus: _focusNode.hasFocus,
      onTap: () => _focusNode.requestFocus(),
      trailing: rightSlot,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        showCursor: !widget.readOnly && widget.enabled,
        obscureText: _isObscured,
        obscuringCharacter: widget.obscuringCharacter,
        maxLines: 1,
        autocorrect: widget.autocorrect ?? false,
        enableSuggestions: widget.enableSuggestions ?? false,
        autofillHints: widget.autofillHints,
        keyboardType: TextInputType.visiblePassword,
        inputFormatters: _inputFormatters,
        textInputAction: widget.textInputAction,
        onChanged: (val) {
          widget.onChanged?.call(val);
        },
        onSubmitted: widget.onSubmitted,
        onEditingComplete: widget.onEditingComplete,
        cursorColor: AlterSemanticTokens.textPrimary,
        style: AlterTypography.bodyLg.copyWith(
          color: _textColor,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: widget.placeholder,
          hintStyle: AlterTypography.bodyLg.copyWith(
            color: AlterSemanticTokens.textSecondary,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveValidator = widget.validator ?? _evaluateBuiltInValidation;

    if (widget.validator != null ||
        widget.onSaved != null ||
        widget.autovalidateMode != null ||
        widget.isRequired ||
        widget.minLength != null ||
        widget.maxLength != null ||
        widget.requireSpecialChar ||
        widget.requireUppercase ||
        widget.requireDigit) {
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
