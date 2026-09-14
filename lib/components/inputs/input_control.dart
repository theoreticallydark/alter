import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_icon_ghost.dart';

/// Surface variant types for [InputControl] as defined in Figma Node `470:436`.
enum InputControlType {
  /// Gray surface (`#F9FAFB`, `AlterSemanticTokens.baseGray`) with `stroke200` border.
  gray,

  /// White surface (`#FFFFFF`, `AlterSemanticTokens.baseWhite`) with `stroke100` border.
  white,
}

/// A highly configurable, multi-slot input control primitive for the Alter Design System.
///
/// Direct 1:1 implementation of Figma Node `470:436` (`InputControl`):
/// - `labelBar`: Top row containing `label` on left (`isRequired`) and `characterLimit` on right (rendered on UI when label is present)
/// - `inputContainer`: 64px box (`padding: 20px 24px`, `borderRadius: 20px`, `gap: 16px`)
/// - `leftSection`: Row containing `leftIcon`, `prefix`, and editable `input` / placeholder
/// - `suffix`: Trailing unit or descriptor text
/// - `rightButton`: Trailing interactive action slot accepting [ButtonIconGhost] directly
/// - `errorContainer`: Bottom row with 16px `error_outline` icon and caption text in `textDanger` (renders latest active error)
class InputControl extends StatefulWidget {
  /// Component version for reference.
  /// v2.3.0: Streamlined multiline sizing: Clean minLines and maxLines configuration without redundant boolean flags; multiline cross-axis start alignment.
  /// v2.1.0: Streamlined label & character limit UI: Removed showLabel and showCharacterLimit booleans. labelBar is rendered whenever label is provided (with characterLimit counter shown on UI during typing). Character limit validation continues to function in background even without a label.
  /// v2.0.0: Pure Flutter convention overhaul: Removed InputControlStatus enum (visual states are 100% dynamically driven by FocusNode and TextEditingController). Streamlined API by removing redundant hasLabel, hasCharacterLimit, hasPrefix, hasSuffix, and hasLeftIcon in favor of clean nullable properties.
  /// v1.7.0: Removed redundant readonly and disabled from InputControlStatus; standardized on boolean enabled and readOnly properties.
  /// v1.6.0: Streamlined right action slot to accept ButtonIconGhost? rightButton directly (replacing split icon properties).
  /// v1.5.0: Replaced rightIcon slot with ButtonIconGhost component (with rightIconType and onRightIconTap); added obscureText, maxLines, minLines, and inputFormatters passthroughs.
  /// v1.4.0: Added isRequired support with asterisk matching label color. Added multiple error condition support rendering the latest error in order.
  /// v1.3.0: Added character limit overflow logic (isError=true, textDanger counter color, and 'Character limit exceeded' error message when character limit is crossed).
  /// v1.2.0: Hide entire labelBar if showLabel is false. Replaced wordLimit with numeric characterLimit showing "x/characterLimit" dynamically only in typing (selected) state. Replaced error status with independent isError and showErrorMessage properties.
  /// v1.1.0: Replaced initialValue with clean value property; streamlined placeholder and value auto-transitions.
  /// v1.0.0: Initial recreation of InputControl matching Figma Node 470:436.
  static const String version = '2.3.0';

  // Label Bar Properties (Figma: label, isRequired, characterLimit)
  final String? label;
  final bool isRequired;
  final int? characterLimit;

  // Variant & Surface (Figma: type)
  final InputControlType type;

  // Left Section Properties (Figma: leftIcon, prefix, input)
  final IconData? leftIcon;
  final Widget? leftIconWidget;

  final String? prefix;
  final Widget? prefixWidget;

  final String placeholder;
  final String? value;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // Right Section Properties (Figma: suffix, rightButton)
  final String? suffix;
  final Widget? suffixWidget;

  final ButtonIconGhost? rightButton;

  // Core Text & Format Passthroughs
  final bool obscureText;
  final String obscuringCharacter;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;

  // Error Properties (Multiple error support & latest error rendering)
  final bool isError;
  final bool showErrorMessage;
  final String errorMessage;
  final List<String>? errorMessages;
  final Widget? errorIconWidget;

  // Interactivity & Callbacks
  final bool enabled;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final bool autofocus;

  const InputControl({
    super.key,
    this.label = 'Label',
    this.isRequired = false,
    this.characterLimit = 32,
    this.type = InputControlType.gray,
    this.leftIcon = Icons.face_5_outlined,
    this.leftIconWidget,
    this.prefix = 'Prefix',
    this.prefixWidget,
    this.placeholder = 'Input',
    this.value,
    this.controller,
    this.focusNode,
    this.suffix = 'Suffix',
    this.suffixWidget,
    this.rightButton,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.maxLines = 1,
    this.minLines = 1,
    this.inputFormatters,
    this.isError = false,
    this.showErrorMessage = true,
    this.errorMessage = 'Error Message',
    this.errorMessages,
    this.errorIconWidget,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.autofocus = false,
  });

  @override
  State<InputControl> createState() => _InputControlState();
}

class _InputControlState extends State<InputControl> {
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

    _controller.addListener(_handleStateChange);
    _focusNode.addListener(_handleStateChange);
  }

  @override
  void didUpdateWidget(covariant InputControl oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_handleStateChange);
      _internalController?.removeListener(_handleStateChange);

      if (widget.controller == null) {
        _internalController ??= TextEditingController(
          text: oldWidget.controller?.text ?? widget.value,
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }
      _controller.addListener(_handleStateChange);
    } else if (widget.controller == null &&
        oldWidget.value != widget.value) {
      if (widget.value != null && _controller.text != widget.value) {
        _controller.text = widget.value!;
      } else if (widget.value == null && oldWidget.value != null) {
        _controller.clear();
      }
    }

    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode?.removeListener(_handleStateChange);
      _internalFocusNode?.removeListener(_handleStateChange);

      if (widget.focusNode == null) {
        _internalFocusNode ??= FocusNode();
      } else {
        _internalFocusNode?.dispose();
        _internalFocusNode = null;
      }
      _focusNode.addListener(_handleStateChange);
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(_handleStateChange);
    }
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_handleStateChange);
    }
    _internalController?.removeListener(_handleStateChange);
    _internalController?.dispose();
    _internalFocusNode?.removeListener(_handleStateChange);
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _handleStateChange() {
    setState(() {});
  }

  bool get _isFocused => _focusNode.hasFocus;
  bool get _isFilled => _controller.text.isNotEmpty;

  /// Checks if character limit is exceeded.
  bool get _isLimitExceeded =>
      widget.characterLimit != null &&
      _controller.text.length > widget.characterLimit!;

  /// List of active error messages in sequence of evaluation.
  List<String> get _activeErrors {
    final errors = <String>[];
    if (widget.errorMessages != null && widget.errorMessages!.isNotEmpty) {
      errors.addAll(
        widget.errorMessages!.where((e) => e.trim().isNotEmpty),
      );
    } else if (widget.isError && widget.errorMessage.trim().isNotEmpty) {
      errors.add(widget.errorMessage);
    }
    if (_isLimitExceeded) {
      errors.add('Character limit exceeded');
    }
    return errors;
  }

  /// Effective error state taking manual isError, errorMessages, and limit overflow into account.
  bool get _effectiveIsError =>
      widget.isError ||
      _isLimitExceeded ||
      (widget.errorMessages != null && widget.errorMessages!.isNotEmpty);

  /// Renders the latest error in order when multiple conditions are hit.
  String get _effectiveErrorMessage {
    final errors = _activeErrors;
    if (errors.isNotEmpty) {
      return errors.last;
    }
    return widget.errorMessage;
  }

  // Color mappings per Figma Node 470:436
  Color get _backgroundColor {
    switch (widget.type) {
      case InputControlType.gray:
        return AlterSemanticTokens.baseGray; // #F9FAFB
      case InputControlType.white:
        return AlterSemanticTokens.baseWhite; // #FFFFFF
    }
  }

  Color get _borderColor {
    if (_effectiveIsError) {
      return AlterSemanticTokens.textDanger; // #EF4444 / #E7000B
    }
    if (widget.readOnly) {
      return AlterSemanticTokens.textDisabled; // #99A1AF (stroke 1px)
    }
    if (_isFocused) {
      return AlterSemanticTokens.stroke1000; // #000000 (active typing border)
    }
    switch (widget.type) {
      case InputControlType.gray:
        return AlterSemanticTokens.stroke200; // #E5E7EB
      case InputControlType.white:
        return AlterSemanticTokens.stroke100; // #F3F4F6
    }
  }

  Color get _contentColor {
    if (widget.readOnly) {
      return AlterSemanticTokens.textSecondary; // #4A5565
    }
    if (!widget.enabled) {
      return AlterSemanticTokens.textDisabled; // #99A1AF
    }
    if (_isFocused || _isFilled) {
      return AlterSemanticTokens.textPrimary; // #000000
    }
    return AlterSemanticTokens.textDisabled; // #99A1AF
  }

  Widget? _buildLabelBar() {
    // For characterLimit to be rendered on UI, label must be provided.
    // If no label is provided, the top labelBar is completely hidden.
    if (widget.label == null || widget.label!.isEmpty) {
      return null;
    }

    final isTypingState = _isFocused;
    final showCharLimit = widget.characterLimit != null && isTypingState;

    final charLimitText = widget.characterLimit != null
        ? '${_controller.text.length}/${widget.characterLimit}'
        : '${_controller.text.length}';

    final charLimitColor = _isLimitExceeded
        ? AlterSemanticTokens.textDanger
        : AlterSemanticTokens.textSecondary;

    final labelText = widget.isRequired
        ? '${widget.label} *'
        : widget.label!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Label on Left (with asterisk in same color as label when isRequired is true)
        Expanded(
          child: Text(
            labelText,
            style: AlterTypography.bodyLg.copyWith(
              color: AlterSemanticTokens.textSecondary, // #4A5565
            ),
          ),
        ),

        // Character Limit on Right (Visible only when label is present AND during Typing / Focused State)
        if (showCharLimit) ...[
          const SizedBox(width: 16),
          Text(
            charLimitText,
            textAlign: TextAlign.right,
            style: AlterTypography.bodyLg.copyWith(
              color: charLimitColor,
            ),
          ),
        ],
      ],
    );
  }

  bool get _isMultiline =>
      (widget.maxLines == null || widget.maxLines! > 1) ||
      (widget.minLines != null && widget.minLines! > 1);

  int? get _effectiveMinLines => widget.minLines;

  int? get _effectiveMaxLines {
    if (widget.maxLines == null) return null;
    if (widget.minLines != null && widget.maxLines! < widget.minLines!) {
      return widget.minLines;
    }
    return widget.maxLines;
  }

  Widget _buildLeftSection() {
    return Expanded(
      child: Row(
        crossAxisAlignment: _isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          // Left Icon (24x24)
          if (widget.leftIconWidget != null) ...[
            widget.leftIconWidget!,
            const SizedBox(width: 8),
          ] else if (widget.leftIcon != null) ...[
            Icon(
              widget.leftIcon,
              size: 24,
              color: _contentColor,
            ),
            const SizedBox(width: 8),
          ],

          // Prefix
          if (widget.prefixWidget != null) ...[
            widget.prefixWidget!,
            const SizedBox(width: 8),
          ] else if (widget.prefix != null && widget.prefix!.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                widget.prefix!,
                style: AlterTypography.bodyLg.copyWith(
                  color: _contentColor,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],

          // Input Text / TextField
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: TextField(
                controller: _controller,
                focusNode: _focusNode,
                obscureText: widget.obscureText,
                obscuringCharacter: widget.obscuringCharacter,
                maxLines: _effectiveMaxLines,
                minLines: _effectiveMinLines,
                inputFormatters: widget.inputFormatters,
                enabled: widget.enabled,
                readOnly: widget.readOnly,
                autofocus: widget.autofocus,
                keyboardType: widget.keyboardType ??
                    (_isMultiline ? TextInputType.multiline : TextInputType.text),
                textInputAction: widget.textInputAction,
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                cursorColor: AlterSemanticTokens.textPrimary,
                style: AlterTypography.bodyLg.copyWith(
                  color: !_isFilled && !_isFocused
                      ? AlterSemanticTokens.textDisabled
                      : _contentColor,
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
                    color: AlterSemanticTokens.textDisabled, // #99A1AF
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildSuffix() {
    if (widget.suffixWidget != null) {
      return widget.suffixWidget;
    }

    if (widget.suffix != null && widget.suffix!.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text(
          widget.suffix!,
          textAlign: TextAlign.right,
          style: AlterTypography.bodyLg.copyWith(
            color: _contentColor,
          ),
        ),
      );
    }

    return null;
  }

  Widget _buildErrorContainer(String errorMessage) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (widget.errorIconWidget != null)
          widget.errorIconWidget!
        else
          const Icon(
            Icons.error_outline,
            size: 16,
            color: AlterSemanticTokens.textDanger, // #E7000B
          ),
        const SizedBox(width: 4),
        Text(
          errorMessage,
          style: AlterTypography.caption.copyWith(
            color: AlterSemanticTokens.textDanger, // #E7000B
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final labelBar = _buildLabelBar();
    final suffixWidget = _buildSuffix();
    final effectiveError = _effectiveIsError;
    final effectiveMsg = _effectiveErrorMessage;
    final showErrorMessage = effectiveError &&
        widget.showErrorMessage &&
        effectiveMsg.isNotEmpty;
    final isDisabled = !widget.enabled;

    Widget containerContent = GestureDetector(
      onTap: isDisabled
          ? null
          : () {
              widget.onTap?.call();
              _focusNode.requestFocus();
            },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        decoration: BoxDecoration(
          color: _backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _borderColor,
            width: 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: _isMultiline ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: [
            _buildLeftSection(),
            if (suffixWidget != null) ...[
              const SizedBox(width: 16),
              suffixWidget,
            ],
            if (widget.rightButton != null) ...[
              const SizedBox(width: 16),
              widget.rightButton!,
            ],
          ],
        ),
      ),
    );

    if (isDisabled) {
      containerContent = Opacity(
        opacity: 0.48,
        child: IgnorePointer(
          child: containerContent,
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelBar != null) ...[
          labelBar,
          const SizedBox(height: 8),
        ],
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            containerContent,
            if (showErrorMessage) ...[
              const SizedBox(height: 4),
              _buildErrorContainer(effectiveMsg),
            ],
          ],
        ),
      ],
    );
  }
}
