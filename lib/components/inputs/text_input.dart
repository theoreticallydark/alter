import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_icon_ghost.dart';
import '../status/feedback_text.dart';
import 'input_container.dart';

/// Surface style variant for [TextInput].
enum TextInputVariant {
  gray,
  white,
}

/// Input filtering and keyboard mode for [TextInput].
enum TextInputMode {
  /// Allows all characters (standard text input).
  all,

  /// Allows only alphabetical characters and spaces ([a-zA-Z\s]).
  onlyAlphabets,

  /// Allows letters, numbers, and spaces ([a-zA-Z0-9\s]).
  alphanumeric,

  /// Allows only integer digits ([0-9]) with numeric keyboard.
  onlyNumbers,

  /// Allows decimal numbers ([0-9.]) with decimal keyboard.
  decimal,

  /// Email address input with email keyboard layout.
  email,

  /// Phone number input with dial pad keyboard.
  phone,
}

/// Reusable Text Input field component for the Alter Design System.
///
/// Figma Specifications (Node `441:9205` & dependent `.rightSlot` Node `454:482`):
/// - Variants:
///   - `type=Gray` (`339:12055`): Fill `baseGray` (`#F9FAFB`), Border 1px `stroke200` (`#E5E7EB`)
///   - `type=White` (`441:9230`): Fill `baseWhite` (`#FFFFFF`), Border 1px `stroke100` (`#F3F4F6`)
///   - `state=Default`: Placeholder visible, subtle border
///   - `state=Typing`: Focused, Border 1px `stroke1000` (`#000000`)
///   - `state=Filled`: Unfocused with content, subtle border
///   - `state=ReadOnly`: Border 1px `textDisabled` (`#99A1AF`), non-editable
///   - `state=Disabled`: 48% opacity, disabled interaction
///   - `state=Error`: Border 1px `textDanger` (`#E7000B`), optional [FeedbackText]
/// - Structure & Layout:
///   - Composes [InputContainer] for container dimensions, borders, label bar, and feedback.
///   - `.rightSlot` (`454:482`): Mutually exclusive slot supporting `type=Suffix` or `type=Clear`.
/// - Child Components Reused:
///   - [InputContainer] for box layout & styling
///   - [ButtonIconGhost] for clear input
///   - [FeedbackText] for error message banner
class TextInput extends StatefulWidget {
  /// Component version for reference.
  /// v1.4.1: Refactored to compose shared InputContainer for visual styling, border states, and label bar.
  /// v1.4.0: Extracted password logic into dedicated PasswordInput component (lib/components/inputs/password_input.dart).
  /// v1.3.1: Standardized naming to showCharacterLimit and replaced word limit with character limit across all documentation and comments.
  /// v1.3.0: Added native `FormField<String>` registration (enabling Form.validate() and Form.save()), onEditingComplete, and obscuringCharacter.
  /// v1.2.3: Renamed hasLabel to hasLabelBar to control visibility of the entire top bar (including label and character limit counter).
  /// v1.2.2: Suffix is always visible across all states; Password toggle and Clear buttons are visible only when input text is present.
  /// v1.2.1: Updated suffix color to textDisabled (#99A1AF), and read-only leading icon and input text color to textSecondary (#4A5565) as per Figma.
  /// v1.2.0: Aligned with updated Figma Nodes 441:9205 & 454:482 (top labelBarContainer with right-aligned character limit counter, .rightSlot sub-architecture, and read-only stroke ui4).
  /// v1.1.1: Refined slot priorities (password mode hides leading icon/suffix/clear; independent suffix suppresses character counter; suffix presence suppresses clear button).
  /// v1.1.0: Added leadingWidget, character counter in suffix, password security rules, container tap-to-focus, and full FormField validator integration.
  /// v1.0.3: Retain focus and keyboard active in typing state when clearing input.
  /// v1.0.2: Updated leading icon and suffix color to textPrimary in typing, filled, read-only, and error states.
  /// v1.0.1: Disabled clear button in password mode; verified read-only and token colors against Figma.
  /// v1.0.0: Initial release matching Figma Node 441:9205.
  static const String version = '1.4.1';

  final String? label;
  final bool hasLabelBar;
  final String? placeholder;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputVariant type;
  final TextInputMode inputMode;

  // Leading
  final bool hasIcon;
  final IconData? icon;
  final Widget? leadingWidget;

  // Suffix (.rightSlot: type=Suffix)
  final bool hasSuffix;
  final String? suffix;
  final Widget? suffixWidget;

  // Clear Button (.rightSlot: type=Clear)
  final bool hasClear;

  // General Text Input Options
  final bool? autocorrect;
  final bool? enableSuggestions;
  final Iterable<String>? autofillHints;

  // Limits (labelBarContainer: character limit counter)
  final bool hasCharacterLimit;
  final int? characterLimit;
  final bool showCharacterLimit;

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

  const TextInput({
    super.key,
    this.label = 'Label',
    this.hasLabelBar = true,
    this.placeholder = 'Input',
    this.initialValue,
    this.controller,
    this.focusNode,
    this.type = TextInputVariant.gray,
    this.inputMode = TextInputMode.all,
    this.hasIcon = true,
    this.icon = Icons.face_5_outlined,
    this.leadingWidget,
    this.hasSuffix = false,
    this.suffix = 'suffix',
    this.suffixWidget,
    this.hasClear = false,
    this.autocorrect,
    this.enableSuggestions,
    this.autofillHints,
    this.hasCharacterLimit = false,
    this.characterLimit,
    this.showCharacterLimit = true,
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
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;
  FormFieldState<String>? _formFieldState;

  TextEditingController get _controller =>
      widget.controller ?? _internalController!;
  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode!;

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
  void didUpdateWidget(covariant TextInput oldWidget) {
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

  bool _computeIsError(String? formError) {
    return widget.isError || (formError != null && formError.isNotEmpty);
  }

  String? _computeErrorText(String? formError) {
    if (formError != null && formError.isNotEmpty) {
      return formError;
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

    // Input Mode filtering
    switch (widget.inputMode) {
      case TextInputMode.all:
        break;
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
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')));
        break;
      case TextInputMode.email:
        formatters.add(FilteringTextInputFormatter.deny(RegExp(r'\s')));
        break;
      case TextInputMode.phone:
        formatters.add(FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-\s()]')));
        break;
    }

    return formatters;
  }

  TextInputType get _keyboardType {
    switch (widget.inputMode) {
      case TextInputMode.all:
      case TextInputMode.onlyAlphabets:
      case TextInputMode.alphanumeric:
        return TextInputType.text;
      case TextInputMode.onlyNumbers:
        return TextInputType.number;
      case TextInputMode.decimal:
        return const TextInputType.numberWithOptions(decimal: true);
      case TextInputMode.email:
        return TextInputType.emailAddress;
      case TextInputMode.phone:
        return TextInputType.phone;
    }
  }

  Iterable<String>? get _effectiveAutofillHints {
    if (widget.autofillHints != null) {
      return widget.autofillHints;
    }
    switch (widget.inputMode) {
      case TextInputMode.email:
        return const [AutofillHints.email];
      case TextInputMode.phone:
        return const [AutofillHints.telephoneNumber];
      default:
        return null;
    }
  }

  Color _computeIconColor(bool isError) {
    if (widget.readOnly) {
      return AlterSemanticTokens.textSecondary;
    }
    if ((_focusNode.hasFocus && widget.enabled) ||
        _controller.text.isNotEmpty ||
        isError) {
      return AlterSemanticTokens.textPrimary;
    }
    return AlterSemanticTokens.textSecondary;
  }

  Color get _textColor {
    if (widget.readOnly) {
      return AlterSemanticTokens.textSecondary;
    }
    return AlterSemanticTokens.textPrimary;
  }

  Color get _suffixColor => AlterSemanticTokens.textDisabled;

  /// Builds the mutually exclusive right slot as defined in Figma Node `454:482` (`.rightSlot`).
  Widget? _buildRightSlot() {
    // 1. Custom Suffix Widget or Static Suffix Text: type=Suffix
    // Always visible in each state (Default, Typing, Filled, ReadOnly, Disabled, Error)
    if (widget.suffixWidget != null) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          widget.suffixWidget!,
        ],
      );
    }

    if (widget.hasSuffix && widget.suffix != null && widget.suffix!.isNotEmpty) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          Text(
            widget.suffix!,
            style: AlterTypography.bodyLg.copyWith(
              color: _suffixColor,
            ),
          ),
        ],
      );
    }

    // 2. Clear Button: type=Clear (ButtonIconGhost with clear icon)
    // Only visible when input is available (i.e. text is not empty)
    final canShowClear = widget.hasClear &&
        _controller.text.isNotEmpty &&
        widget.enabled &&
        !widget.readOnly;

    if (canShowClear) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          ButtonIconGhost(
            icon: Icons.close,
            size: 24,
            type: ButtonIconGhostType.secondary,
            onTap: () {
              _controller.clear();
              _focusNode.requestFocus();
              widget.onChanged?.call('');
            },
          ),
        ],
      );
    }

    return null;
  }

  Widget? _buildLeading(Color iconColor) {
    if (widget.leadingWidget != null) {
      return widget.leadingWidget;
    }
    if (widget.hasIcon && widget.icon != null) {
      return Icon(
        widget.icon,
        size: 24,
        color: iconColor,
      );
    }
    return null;
  }

  Widget _buildFieldContent(String? formError) {
    final isError = _computeIsError(formError);
    final errorText = _computeErrorText(formError);
    final iconColor = _computeIconColor(isError);

    final leadingWidget = _buildLeading(iconColor);
    final rightSlot = _buildRightSlot();

    return InputContainer(
      label: widget.label,
      hasLabelBar: widget.hasLabelBar,
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
      leading: leadingWidget,
      trailing: rightSlot,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        showCursor: !widget.readOnly && widget.enabled,
        autocorrect: widget.autocorrect ?? true,
        enableSuggestions: widget.enableSuggestions ?? true,
        autofillHints: _effectiveAutofillHints,
        keyboardType: _keyboardType,
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
    if (widget.validator != null ||
        widget.onSaved != null ||
        widget.autovalidateMode != null) {
      return FormField<String>(
        initialValue: _controller.text,
        validator: widget.validator,
        onSaved: widget.onSaved,
        autovalidateMode: widget.autovalidateMode,
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
