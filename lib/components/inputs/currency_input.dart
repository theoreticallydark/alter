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
  final String? label;
  final bool isRequired;
  final int? characterLimit;

  // Variant & Surface
  final InputControlType type;

  // Currency & Grouping Configuration
  final NumberGroupingSystem groupingSystem;
  final bool allowDecimals;
  final int? decimalPlaces;
  final num? minValue;
  final num? maxValue;

  // Left Section (Default: Euro icon)
  final IconData? leftIcon;
  final Widget? leftIconWidget;
  final String? prefix;
  final Widget? prefixWidget;

  // Content
  final String placeholder;
  final num? initialValue;
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

  // Callbacks
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final ValueChanged<num?>? onAmountChanged;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;

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
