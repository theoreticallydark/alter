import 'package:flutter/material.dart';
import '../buttons/button_icon_ghost.dart';
import 'input_control.dart';
import 'numeric_input.dart';

/// A currency input field component for the Alter Design System built on [NumericInput].
///
/// Features:
/// - Pre-configured Euro left icon (`Icons.euro_rounded`) by default.
/// - Live comma formatting for International (`1,000,000.00`) and Indian (`10,00,000.00`) formats.
/// - Decimal support (default 2 decimal places).
/// - Min/max currency bounds validation.
class CurrencyInput extends StatelessWidget {
  /// Component version for reference.
  /// v2.2.0: Removed stepper controls in favor of standard rightButton (ButtonIconGhost) slot matching InputControl Figma spec.
  /// v2.1.0: Aligned with InputControl v2.1.0 & NumericInput v2.1.0 (removed showLabel/showCharacterLimit; labelBar renders when label is provided).
  /// v2.0.0: Aligned with InputControl v2.0.0 & NumericInput v2.0.0 (removed statusOverride and redundant hasX booleans in favor of clean nullable props).
  /// v1.0.0: Initial release of CurrencyInput built on NumericInput with Euro default icon and International/Indian grouping.
  static const String version = '2.2.0';

  // Label Bar Properties
  /// Label text displayed above the currency input.
  final String? label;

  /// Whether to display a red required asterisk next to the label.
  final bool isRequired;

  /// Maximum allowed character limit counter displayed on typing.
  final int? characterLimit;

  // Variant & Surface
  /// Surface background and border style variant.
  final InputControlType type;

  // Currency & Grouping Configuration
  /// Digit separator format (International vs Indian numbering system).
  final NumberGroupingSystem groupingSystem;

  /// Whether decimal fractions are permitted.
  final bool allowDecimals;

  /// Fixed or max number of allowed decimal digits.
  final int? decimalPlaces;

  /// Minimum allowed numeric amount value.
  final num? minValue;

  /// Maximum allowed numeric amount value.
  final num? maxValue;

  // Left Section (Default: Euro icon)
  /// Leading currency icon (defaults to [Icons.euro_rounded]).
  final IconData? leftIcon;

  /// Custom leading widget override.
  final Widget? leftIconWidget;

  /// Currency prefix text string.
  final String? prefix;

  /// Custom prefix widget override.
  final Widget? prefixWidget;

  // Content
  /// Hint placeholder text.
  final String placeholder;

  /// Initial numeric amount.
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
  /// Whether the currency input is interactive.
  final bool enabled;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Whether the input field autofocuses.
  final bool autofocus;

  /// Callback returning parsed numeric amount on change.
  final ValueChanged<num?>? onAmountChanged;

  /// Callback returning raw string value on change.
  final ValueChanged<String>? onChanged;

  /// Callback executed on keyboard submit.
  final ValueChanged<String>? onSubmitted;

  /// Callback executed when the input container is tapped.
  final VoidCallback? onTap;

  /// Creates a [CurrencyInput] instance.
  const CurrencyInput({
    super.key,
    this.label = 'Amount',
    this.isRequired = false,
    this.characterLimit,
    this.type = InputControlType.gray,
    this.groupingSystem = NumberGroupingSystem.international,
    this.allowDecimals = true,
    this.decimalPlaces = 2,
    this.minValue,
    this.maxValue,
    this.leftIcon = Icons.euro_rounded,
    this.leftIconWidget,
    this.prefix,
    this.prefixWidget,
    this.placeholder = '0.00',
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
    this.onAmountChanged,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NumericInput(
      label: label,
      isRequired: isRequired,
      characterLimit: characterLimit,
      type: type,
      groupingSystem: groupingSystem,
      allowDecimals: allowDecimals,
      decimalPlaces: decimalPlaces,
      minValue: minValue,
      maxValue: maxValue,
      leftIcon: leftIcon,
      leftIconWidget: leftIconWidget,
      prefix: prefix,
      prefixWidget: prefixWidget,
      placeholder: placeholder,
      initialValue: initialValue,
      controller: controller,
      focusNode: focusNode,
      suffix: suffix,
      suffixWidget: suffixWidget,
      rightButton: rightButton,
      isError: isError,
      showErrorMessage: showErrorMessage,
      errorMessage: errorMessage,
      errorMessages: errorMessages,
      errorIconWidget: errorIconWidget,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      onNumberChanged: onAmountChanged,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onTap: onTap,
    );
  }
}
