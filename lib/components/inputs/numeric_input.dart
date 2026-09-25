import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../buttons/button_icon_ghost.dart';
import 'input_control.dart';

/// Number grouping and separator systems for numeric inputs.
enum NumberGroupingSystem {
  /// No thousand separators (e.g. `1000000.50`).
  none,

  /// Standard Western 3-digit grouping (e.g. `100,000`, `1,000,000.50`).
  international,

  /// Indian numbering system (3 digits initially, then pairs: e.g. `10,00,000.50`).
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

    final hasDecimal = allowDecimals && clean.contains('.');
    String integerPart = hasDecimal ? clean.split('.').first : clean;
    String? decimalPart = hasDecimal ? clean.split('.').sublist(1).join('') : null;

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

  /// Parses a formatted string back to a numeric value.
  static num? parse(String text) {
    if (text.isEmpty) return null;
    final clean = text.replaceAll(',', '');
    return num.tryParse(clean);
  }
}

/// Live text input formatter that manages comma grouping and decimal rules.
class GroupedNumberInputFormatter extends TextInputFormatter {
  /// Number grouping system used for digit formatting.
  final NumberGroupingSystem groupingSystem;

  /// Whether decimal fractions are permitted.
  final bool allowDecimals;

  /// Maximum number of decimal places allowed.
  final int? decimalPlaces;

  /// Whether negative numbers are permitted.
  final bool allowNegative;

  /// Maximum numeric value constraint.
  final num? maxValue;

  /// Creates a [GroupedNumberInputFormatter] instance.
  GroupedNumberInputFormatter({
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

    if (allowNegative && newValue.text == '-') {
      return newValue;
    }

    String textToFormat = newValue.text;
    if (allowDecimals && textToFormat.startsWith('.')) {
      textToFormat = '0$textToFormat';
    }

    final formatted = NumericFormatterUtils.formatNumberString(
      textToFormat,
      groupingSystem: groupingSystem,
      allowDecimals: allowDecimals,
      decimalPlaces: decimalPlaces,
      allowNegative: allowNegative,
    );

    if (maxValue != null) {
      final parsed = NumericFormatterUtils.parse(formatted);
      if (parsed != null && parsed > maxValue!) {
        return oldValue;
      }
    }

    // Cursor position calculation
    int cursorPosition = newValue.selection.end;
    final oldDigitsBeforeCursor = newValue.text
        .substring(0, cursorPosition.clamp(0, newValue.text.length))
        .replaceAll(RegExp(r'[^\d.]'), '')
        .length;

    int newCursor = 0;
    int digitsCount = 0;
    for (int i = 0; i < formatted.length; i++) {
      if (digitsCount >= oldDigitsBeforeCursor) break;
      if (RegExp(r'[\d.]').hasMatch(formatted[i])) {
        digitsCount++;
      }
      newCursor = i + 1;
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(
        offset: newCursor.clamp(0, formatted.length),
      ),
    );
  }
}

/// A comprehensive numeric input field for the Alter Design System built on [InputControl].
///
/// Features:
/// - Smart comma formatting (International `1,000,000` & Indian `10,00,000` systems).
/// - Bounds enforcement (`minValue`, `maxValue`), decimal places, and negative numbers.
/// - Optional stepper controls (+ / -) using [ButtonIconGhost].
/// - Reuses [InputControl] for full token fidelity and error displays.
class NumericInput extends StatefulWidget {
  /// Component version for reference.
  /// v2.3.0: Removed stepper controls in favor of standard rightButton (ButtonIconGhost) slot matching InputControl Figma spec.
  /// v2.2.0: Added deferred isRequired validation on blur/touch, preventing premature errors on initial focus.
  /// v2.1.0: Aligned with InputControl v2.1.0 (removed showLabel/showCharacterLimit; labelBar renders when label is provided).
  /// v2.0.0: Aligned with InputControl v2.0.0 (removed statusOverride and redundant hasX booleans in favor of clean nullable props).
  /// v1.0.0: Initial release of NumericInput built directly on InputControl with live comma formatting.
  static const String version = '2.3.0';

  // Label Bar Properties
  /// Label text displayed above the numeric field.
  final String? label;

  /// Whether to display a red required asterisk next to the label.
  final bool isRequired;

  /// Maximum allowed character limit counter displayed on typing.
  final int? characterLimit;

  // Variant & Surface
  /// Surface background and border style variant.
  final InputControlType type;

  // Numeric Rules & Grouping
  /// Grouping format (none, international, or indian).
  final NumberGroupingSystem groupingSystem;

  /// Whether decimal numbers are allowed.
  final bool allowDecimals;

  /// Maximum allowed decimal fraction digits.
  final int? decimalPlaces;

  /// Whether negative numbers are allowed.
  final bool allowNegative;

  /// Minimum numeric value bound.
  final num? minValue;

  /// Maximum numeric value bound.
  final num? maxValue;

  // Left Section
  /// Leading icon data.
  final IconData? leftIcon;

  /// Custom leading widget override.
  final Widget? leftIconWidget;

  /// Prefix text string.
  final String? prefix;

  /// Custom prefix widget override.
  final Widget? prefixWidget;

  // Content
  /// Hint placeholder text.
  final String placeholder;

  /// Initial numeric value.
  final num? initialValue;

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

  // Callbacks
  /// Whether the numeric input is interactive.
  final bool enabled;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Whether the input field autofocuses.
  final bool autofocus;

  /// Callback returning parsed numeric value on change.
  final ValueChanged<num?>? onNumberChanged;

  /// Callback returning raw text string on change.
  final ValueChanged<String>? onChanged;

  /// Callback executed on keyboard submit.
  final ValueChanged<String>? onSubmitted;

  /// Callback executed when the input container is tapped.
  final VoidCallback? onTap;

  /// Creates a [NumericInput] instance.
  const NumericInput({
    super.key,
    this.label = 'Number',
    this.isRequired = false,
    this.characterLimit,
    this.type = InputControlType.gray,
    this.groupingSystem = NumberGroupingSystem.international,
    this.allowDecimals = true,
    this.decimalPlaces,
    this.allowNegative = false,
    this.minValue,
    this.maxValue,
    this.leftIcon,
    this.leftIconWidget,
    this.prefix,
    this.prefixWidget,
    this.placeholder = '0',
    this.initialValue,
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
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.onNumberChanged,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  @override
  State<NumericInput> createState() => _NumericInputState();
}

class _NumericInputState extends State<NumericInput> {
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
      final initText = widget.initialValue != null
          ? NumericFormatterUtils.formatNumberString(
              widget.initialValue.toString(),
              groupingSystem: widget.groupingSystem,
              allowDecimals: widget.allowDecimals,
              decimalPlaces: widget.decimalPlaces,
              allowNegative: widget.allowNegative,
            )
          : '';
      _internalController = TextEditingController(text: initText);
    }
    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void didUpdateWidget(covariant NumericInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onTextChanged);
      _internalController?.removeListener(_onTextChanged);

      if (widget.controller == null) {
        _internalController ??= TextEditingController(
          text: oldWidget.controller?.text ?? '',
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }
      _controller.addListener(_onTextChanged);
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
      widget.controller!.removeListener(_onTextChanged);
    }
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_onFocusChange);
    }
    _internalController?.removeListener(_onTextChanged);
    _internalController?.dispose();
    _internalFocusNode?.removeListener(_onFocusChange);
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      _hasHadFocus = true;
    } else if (_hasHadFocus) {
      _hasBeenTouched = true;
    }
    setState(() {});
  }

  void _onTextChanged() {
    if (_controller.text.isNotEmpty) {
      _hasBeenTouched = true;
    }
    setState(() {});
    final numVal = NumericFormatterUtils.parse(_controller.text);
    widget.onNumberChanged?.call(numVal);
  }

  List<String> get _activeValidationErrors {
    final errors = <String>[];
    if (widget.errorMessages != null && widget.errorMessages!.isNotEmpty) {
      errors.addAll(widget.errorMessages!.where((e) => e.trim().isNotEmpty));
    } else if (widget.isError && widget.errorMessage.trim().isNotEmpty) {
      errors.add(widget.errorMessage);
    }

    if (widget.isRequired && _hasBeenTouched && _controller.text.trim().isEmpty) {
      errors.add('${widget.label ?? "Field"} is required');
    }

    final parsed = NumericFormatterUtils.parse(_controller.text);
    if (parsed != null) {
      if (widget.minValue != null && parsed < widget.minValue!) {
        errors.add('Value must be at least ${widget.minValue}');
      }
      if (widget.maxValue != null && parsed > widget.maxValue!) {
        errors.add('Value cannot exceed ${widget.maxValue}');
      }
    }

    return errors;
  }

  @override
  Widget build(BuildContext context) {
    final errors = _activeValidationErrors;
    final effectiveIsError = errors.isNotEmpty || widget.isError;

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
      controller: _controller,
      focusNode: _focusNode,
      suffix: widget.suffix,
      suffixWidget: widget.suffixWidget,
      rightButton: widget.rightButton,
      keyboardType: TextInputType.numberWithOptions(
        decimal: widget.allowDecimals,
        signed: widget.allowNegative,
      ),
      inputFormatters: [
        GroupedNumberInputFormatter(
          groupingSystem: widget.groupingSystem,
          allowDecimals: widget.allowDecimals,
          decimalPlaces: widget.decimalPlaces,
          allowNegative: widget.allowNegative,
          maxValue: widget.maxValue,
        ),
      ],
      isError: effectiveIsError,
      showErrorMessage: widget.showErrorMessage,
      errorMessage: widget.errorMessage,
      errorMessages: errors,
      errorIconWidget: widget.errorIconWidget,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      textInputAction: TextInputAction.done,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
    );
  }
}
