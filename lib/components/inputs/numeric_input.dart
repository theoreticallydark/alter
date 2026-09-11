import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_icon_ghost.dart';
import 'input_container.dart';
import 'text_input.dart';

/// Number grouping and thousand separator systems for [NumericInput].
enum NumberGroupingSystem {
  /// No thousand separators (e.g. `1000000.50`).
  none,

  /// Standard Western 3-digit grouping (e.g. `100,000`, `1,000,000.50`).
  international,

  /// Indian numbering system: 3 digits initially, then 2 digits (e.g. `1,00,000`, `10,00,000.50`).
  indian,
}

/// Helper utilities for formatting and parsing grouped numbers.
class NumericFormatterUtils {
  /// Formats an unformatted integer digit string according to [NumberGroupingSystem].
  static String formatIntegerPart(String digits, NumberGroupingSystem system) {
    if (digits.isEmpty) return '';
    if (system == NumberGroupingSystem.none) return digits;

    if (system == NumberGroupingSystem.international) {
      final buffer = StringBuffer();
      int count = 0;
      for (int i = digits.length - 1; i >= 0; i--) {
        buffer.write(digits[i]);
        count++;
        if (count % 3 == 0 && i > 0) {
          buffer.write(',');
        }
      }
      return buffer.toString().split('').reversed.join('');
    }

    if (system == NumberGroupingSystem.indian) {
      if (digits.length <= 3) return digits;
      final lastThree = digits.substring(digits.length - 3);
      final remaining = digits.substring(0, digits.length - 3);

      final buffer = StringBuffer();
      int count = 0;
      for (int i = remaining.length - 1; i >= 0; i--) {
        buffer.write(remaining[i]);
        count++;
        if (count % 2 == 0 && i > 0) {
          buffer.write(',');
        }
      }
      final formattedRemaining = buffer.toString().split('').reversed.join('');
      return '$formattedRemaining,$lastThree';
    }

    return digits;
  }

  /// Formats a full numeric string with grouping, decimals, and negative sign.
  static String formatNumberString(
    String raw, {
    required NumberGroupingSystem groupingSystem,
    required bool allowDecimals,
    int? decimalPlaces,
    required bool allowNegative,
  }) {
    if (raw.isEmpty) return '';

    bool isNegative = false;
    String clean = raw;
    if (allowNegative && clean.startsWith('-')) {
      isNegative = true;
      clean = clean.substring(1);
    }

    // Split integer and decimal parts
    final hasDecimal = allowDecimals && clean.contains('.');
    String integerPart = hasDecimal ? clean.split('.').first : clean;
    String? decimalPart = hasDecimal ? clean.split('.').sublist(1).join('') : null;

    // Filter non-digits
    integerPart = integerPart.replaceAll(RegExp(r'[^\d]'), '');
    if (decimalPart != null) {
      decimalPart = decimalPart.replaceAll(RegExp(r'[^\d]'), '');
      if (decimalPlaces != null && decimalPlaces > 0 && decimalPart.length > decimalPlaces) {
        decimalPart = decimalPart.substring(0, decimalPlaces);
      }
    }

    final formattedInt = formatIntegerPart(integerPart, groupingSystem);

    final buffer = StringBuffer();
    if (isNegative && (formattedInt.isNotEmpty || (decimalPart != null && decimalPart.isNotEmpty))) {
      buffer.write('-');
    }
    buffer.write(formattedInt);

    if (hasDecimal) {
      buffer.write('.');
      if (decimalPart != null) {
        buffer.write(decimalPart);
      }
    }

    return buffer.toString();
  }

  /// Parses a formatted string into a numeric value (`num?`).
  static num? parse(String? text) {
    if (text == null || text.trim().isEmpty) return null;
    final unformatted = text.replaceAll(',', '').trim();
    return num.tryParse(unformatted);
  }
}

/// Custom [TextInputFormatter] ensuring live number grouping, decimal limits, and smart cursor preservation.
class _NumericTextInputFormatter extends TextInputFormatter {
  final NumberGroupingSystem groupingSystem;
  final bool allowDecimals;
  final int? decimalPlaces;
  final bool allowNegative;
  final num? maxValue;

  _NumericTextInputFormatter({
    required this.groupingSystem,
    required this.allowDecimals,
    this.decimalPlaces,
    required this.allowNegative,
    this.maxValue,
  });

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // Handle single leading minus
    if (allowNegative && newValue.text == '-') {
      return newValue;
    }

    // Handle leading decimal point (.5 -> 0.5)
    String textToFormat = newValue.text;
    if (allowDecimals && textToFormat.startsWith('.')) {
      textToFormat = '0$textToFormat';
    } else if (allowNegative && textToFormat.startsWith('-.')) {
      textToFormat = '-0${textToFormat.substring(2)}';
    }

    // Count raw characters to the left of the new selection to preserve cursor
    int rawCursorPos = 0;
    for (int i = 0; i < newValue.selection.end && i < newValue.text.length; i++) {
      if (newValue.text[i] != ',') {
        rawCursorPos++;
      }
    }

    final formatted = NumericFormatterUtils.formatNumberString(
      textToFormat,
      groupingSystem: groupingSystem,
      allowDecimals: allowDecimals,
      decimalPlaces: decimalPlaces,
      allowNegative: allowNegative,
    );

    // Max value boundary check
    if (maxValue != null) {
      final parsed = NumericFormatterUtils.parse(formatted);
      if (parsed != null && parsed > maxValue!) {
        return oldValue;
      }
    }

    // Recompute cursor position based on raw non-comma characters
    int newSelectionIndex = 0;
    int rawCount = 0;
    for (int i = 0; i < formatted.length; i++) {
      if (rawCount >= rawCursorPos) {
        break;
      }
      newSelectionIndex++;
      if (formatted[i] != ',') {
        rawCount++;
      }
    }

    newSelectionIndex = newSelectionIndex.clamp(0, formatted.length);

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: newSelectionIndex),
    );
  }
}

/// Dedicated Numeric Input field component for the Alter Design System.
///
/// Encapsulates:
/// - Comma Grouping: [NumberGroupingSystem.international] (`100,000`), [NumberGroupingSystem.indian] (`1,00,000`), or [NumberGroupingSystem.none]
/// - Number Precision: Decimals ([allowDecimals], [decimalPlaces]), Signed ([allowNegative])
/// - Bounds & Limits: [minValue], [maxValue], [clampOnUnfocus], [characterLimit]
/// - Leading Icons (e.g. `Icons.currency_rupee`, `Icons.attach_money`) and Suffixes (`kg`, `%`, `hrs`)
/// - Integrated with [InputContainer] for design system box styling and token parity.
class NumericInput extends StatefulWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release of dedicated NumericInput component.
  static const String version = '1.0.0';

  final String? label;
  final bool hasLabelBar;
  final String? placeholder;
  final num? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputVariant type;

  // Number Formatting & Precision
  final NumberGroupingSystem groupingSystem;
  final bool allowDecimals;
  final int? decimalPlaces;
  final bool allowNegative;

  // Limits & Bounds
  final num? minValue;
  final num? maxValue;
  final bool clampOnUnfocus;
  final bool hasCharacterLimit;
  final int? characterLimit;
  final bool showCharacterLimit;

  // Leading Slot (Currency / Icon)
  final bool hasIcon;
  final IconData? icon;
  final Widget? leadingWidget;

  // Right Slot (.rightSlot: type=Suffix or type=Clear)
  final bool hasSuffix;
  final String? suffix;
  final Widget? suffixWidget;
  final bool hasClear;

  // Error & Feedback
  final bool isError;
  final bool hasFeedback;
  final String? errorText;

  // State & Interactivity
  final bool enabled;
  final bool readOnly;
  final ValueChanged<num?>? onChangedNumber;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;
  final TextInputAction textInputAction;

  // Form Validation Integration
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final AutovalidateMode? autovalidateMode;

  const NumericInput({
    super.key,
    this.label = 'Number',
    this.hasLabelBar = true,
    this.placeholder = '0',
    this.initialValue,
    this.controller,
    this.focusNode,
    this.type = TextInputVariant.gray,
    this.groupingSystem = NumberGroupingSystem.international,
    this.allowDecimals = true,
    this.decimalPlaces,
    this.allowNegative = false,
    this.minValue,
    this.maxValue,
    this.clampOnUnfocus = false,
    this.hasCharacterLimit = false,
    this.characterLimit,
    this.showCharacterLimit = true,
    this.hasIcon = false,
    this.icon,
    this.leadingWidget,
    this.hasSuffix = false,
    this.suffix,
    this.suffixWidget,
    this.hasClear = false,
    this.isError = false,
    this.hasFeedback = true,
    this.errorText = 'Feedback Text',
    this.enabled = true,
    this.readOnly = false,
    this.onChangedNumber,
    this.onChanged,
    this.onSubmitted,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onSaved,
    this.autovalidateMode,
  });

  @override
  State<NumericInput> createState() => _NumericInputState();
}

class _NumericInputState extends State<NumericInput> {
  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;
  FormFieldState<String>? _formFieldState;

  TextEditingController get _controller =>
      widget.controller ?? _internalController!;
  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode!;

  String _formatInitial(num? val) {
    if (val == null) return '';
    return NumericFormatterUtils.formatNumberString(
      val.toString(),
      groupingSystem: widget.groupingSystem,
      allowDecimals: widget.allowDecimals,
      decimalPlaces: widget.decimalPlaces,
      allowNegative: widget.allowNegative,
    );
  }

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = TextEditingController(
        text: _formatInitial(widget.initialValue),
      );
    }
    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }

    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  @override
  void didUpdateWidget(covariant NumericInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Sync Controller
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onTextChanged);
      _internalController?.removeListener(_onTextChanged);

      if (widget.controller == null) {
        _internalController ??= TextEditingController(
          text: oldWidget.controller?.text ?? _formatInitial(widget.initialValue),
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }
      _controller.addListener(_onTextChanged);
    } else if (widget.controller == null &&
        oldWidget.initialValue != widget.initialValue &&
        widget.initialValue != null) {
      final formatted = _formatInitial(widget.initialValue);
      if (_controller.text.isEmpty || _controller.text == _formatInitial(oldWidget.initialValue)) {
        _controller.text = formatted;
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
    final parsed = NumericFormatterUtils.parse(_controller.text);
    widget.onChangedNumber?.call(parsed);
    _formFieldState?.didChange(_controller.text);
    setState(() {});
  }

  void _onFocusChanged() {
    if (!_focusNode.hasFocus && widget.clampOnUnfocus) {
      _clampCurrentValue();
    }
    setState(() {});
  }

  void _clampCurrentValue() {
    final parsed = NumericFormatterUtils.parse(_controller.text);
    if (parsed == null) return;

    num clamped = parsed;
    if (widget.minValue != null && clamped < widget.minValue!) {
      clamped = widget.minValue!;
    }
    if (widget.maxValue != null && clamped > widget.maxValue!) {
      clamped = widget.maxValue!;
    }

    if (clamped != parsed) {
      final formatted = NumericFormatterUtils.formatNumberString(
        clamped.toString(),
        groupingSystem: widget.groupingSystem,
        allowDecimals: widget.allowDecimals,
        decimalPlaces: widget.decimalPlaces,
        allowNegative: widget.allowNegative,
      );
      _controller.text = formatted;
      widget.onChanged?.call(formatted);
      widget.onChangedNumber?.call(clamped);
    }
  }

  bool _computeIsError(String? formError) {
    if (widget.isError || (formError != null && formError.isNotEmpty)) {
      return true;
    }
    // Check min/max bounds if not clamping on blur
    final parsed = NumericFormatterUtils.parse(_controller.text);
    if (parsed != null) {
      if (widget.minValue != null && parsed < widget.minValue!) {
        return true;
      }
      if (widget.maxValue != null && parsed > widget.maxValue!) {
        return true;
      }
    }
    return false;
  }

  String? _computeErrorText(String? formError) {
    if (formError != null && formError.isNotEmpty) {
      return formError;
    }
    final parsed = NumericFormatterUtils.parse(_controller.text);
    if (parsed != null) {
      if (widget.minValue != null && parsed < widget.minValue!) {
        return 'Minimum value is ${widget.minValue}';
      }
      if (widget.maxValue != null && parsed > widget.maxValue!) {
        return 'Maximum value is ${widget.maxValue}';
      }
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

    // Number grouping & decimal precision formatter
    formatters.add(
      _NumericTextInputFormatter(
        groupingSystem: widget.groupingSystem,
        allowDecimals: widget.allowDecimals,
        decimalPlaces: widget.decimalPlaces,
        allowNegative: widget.allowNegative,
        maxValue: widget.maxValue,
      ),
    );

    return formatters;
  }

  TextInputType get _keyboardType {
    if (!widget.allowDecimals && !widget.allowNegative) {
      return TextInputType.number;
    }
    return TextInputType.numberWithOptions(
      decimal: widget.allowDecimals,
      signed: widget.allowNegative,
    );
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
              widget.onChangedNumber?.call(null);
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
        autocorrect: false,
        enableSuggestions: false,
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
