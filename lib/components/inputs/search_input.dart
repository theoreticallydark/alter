import 'package:flutter/material.dart';
import '../buttons/button_icon_ghost.dart';
import 'input_control.dart';
import 'text_input.dart';

/// A specialized search input field component for the Alter Design System built on [TextInput].
///
/// Features:
/// - Pre-configured with a search left icon (`Icons.search_rounded`).
/// - Dynamic clear button (`ButtonIconGhost` with `Icons.close_rounded`) displayed when text is present.
/// - Search action keyboard type (`TextInputAction.search`).
/// - Reuses [TextInput] for full form, label, character limit, and error support.
class SearchInput extends StatefulWidget {
  /// Component version for reference.
  /// v2.1.0: Aligned with InputControl v2.1.0 & TextInput v2.1.0 (removed showLabel/showCharacterLimit; labelBar renders when label is provided).
  /// v2.0.0: Aligned with InputControl v2.0.0 & TextInput v2.0.0 (removed statusOverride and redundant hasX booleans in favor of clean nullable props).
  /// v1.0.0: Initial release of SearchInput wrapper built on TextInput with dynamic clear button and search icon.
  static const String version = '2.1.0';

  // Label Bar Properties (default label: null for search inputs)
  /// Optional label text displayed above the search field.
  final String? label;

  /// Whether to display a red required asterisk next to the label.
  final bool isRequired;

  /// Maximum allowed character limit counter displayed on typing.
  final int? characterLimit;

  // Variant & Surface
  /// Surface background and border style variant.
  final InputControlType type;

  // Left Section
  /// Leading icon data (defaults to [Icons.search_rounded]).
  final IconData? leftIcon;

  /// Custom leading widget override.
  final Widget? leftIconWidget;

  /// Prefix text displayed before the input value.
  final String? prefix;

  /// Custom prefix widget override.
  final Widget? prefixWidget;

  // Content
  /// Hint placeholder text (defaults to 'Search...').
  final String placeholder;

  /// Initial or bound value string.
  final String? value;

  /// External text editing controller.
  final TextEditingController? controller;

  /// Focus node controlling input focus.
  final FocusNode? focusNode;

  // Suffix & Custom Right Action
  /// Suffix descriptor text displayed at the trailing end.
  final String? suffix;

  /// Custom suffix widget override.
  final Widget? suffixWidget;

  /// Whether to display the clear 'X' button when text is entered.
  final bool showClearButton;

  /// Custom trailing action button override.
  final ButtonIconGhost? customRightButton;

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
  /// Whether the search input is interactive.
  final bool enabled;

  /// Whether the field is read-only.
  final bool readOnly;

  /// Whether the input field autofocuses.
  final bool autofocus;

  /// Callback executed on value changes.
  final ValueChanged<String>? onChanged;

  /// Callback executed on keyboard submit.
  final ValueChanged<String>? onSubmitted;

  /// Callback executed when search is triggered.
  final ValueChanged<String>? onSearch;

  /// Callback executed when the clear button is pressed.
  final VoidCallback? onClear;

  /// Callback executed when the input container is tapped.
  final VoidCallback? onTap;

  /// Creates a [SearchInput] instance.
  const SearchInput({
    super.key,
    this.label,
    this.isRequired = false,
    this.characterLimit,
    this.type = InputControlType.gray,
    this.leftIcon = Icons.search_rounded,
    this.leftIconWidget,
    this.prefix,
    this.prefixWidget,
    this.placeholder = 'Search...',
    this.value,
    this.controller,
    this.focusNode,
    this.suffix,
    this.suffixWidget,
    this.showClearButton = true,
    this.customRightButton,
    this.isError = false,
    this.showErrorMessage = true,
    this.errorMessage = 'Error Message',
    this.errorMessages,
    this.errorIconWidget,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.onChanged,
    this.onSubmitted,
    this.onSearch,
    this.onClear,
    this.onTap,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;

  TextEditingController get _controller =>
      widget.controller ?? _internalController!;
  FocusNode get _focusNode => widget.focusNode ?? _internalFocusNode!;

  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      _internalController = TextEditingController(text: widget.value);
    }
    if (widget.focusNode == null) {
      _internalFocusNode = FocusNode();
    }
    _controller.addListener(_onTextChange);
  }

  @override
  void didUpdateWidget(covariant SearchInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_onTextChange);
      _internalController?.removeListener(_onTextChange);

      if (widget.controller == null) {
        _internalController ??= TextEditingController(
          text: oldWidget.controller?.text ?? widget.value,
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }
      _controller.addListener(_onTextChange);
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(_onTextChange);
    }
    _internalController?.removeListener(_onTextChange);
    _internalController?.dispose();
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _onTextChange() {
    setState(() {});
  }

  void _handleClear() {
    _controller.clear();
    widget.onChanged?.call('');
    widget.onClear?.call();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _controller.text.isNotEmpty;

    // Trailing button: clear button when text is present, or custom right button
    ButtonIconGhost? effectiveRightButton = widget.customRightButton;
    if (widget.showClearButton && hasText && widget.enabled && !widget.readOnly) {
      effectiveRightButton = ButtonIconGhost(
        icon: Icons.close_rounded,
        type: ButtonIconGhostType.secondary,
        onTap: _handleClear,
      );
    }

    return TextInput(
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
      rightButton: effectiveRightButton,
      inputMode: TextInputMode.all,
      isError: widget.isError,
      showErrorMessage: widget.showErrorMessage,
      errorMessage: widget.errorMessage,
      errorMessages: widget.errorMessages,
      errorIconWidget: widget.errorIconWidget,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      textInputAction: TextInputAction.search,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onSubmitted: (query) {
        widget.onSubmitted?.call(query);
        widget.onSearch?.call(query);
      },
    );
  }
}
