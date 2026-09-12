import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';

/// Surface variant types for [InputControl] as defined in Figma Node `470:436`.
enum InputControlType {
  /// Gray surface (`#F9FAFB`, `AlterSemanticTokens.baseGray`) with `stroke200` border.
  gray,

  /// White surface (`#FFFFFF`, `AlterSemanticTokens.baseWhite`) with `stroke100` border.
  white,
}

/// Visual status variants for [InputControl] matching Figma Node `470:436`.
enum InputControlStatus {
  /// Default empty state with placeholder styling.
  default_,

  /// Active / Selected / Focused state with black border (`stroke1000`).
  selected,

  /// Populated / Filled state with primary text styling.
  filled,

  /// Readonly state with gray text (`textSecondary`) and `textDisabled` border.
  readonly,

  /// Disabled state rendered at 48% opacity.
  disabled,
}

/// A highly configurable, multi-slot input control primitive for the Alter Design System.
///
/// Direct 1:1 implementation of Figma Node `470:436` (`InputControl`):
/// - `labelBar`: Top row containing `label` on left (`hasLabel`, `showLabel`, `isRequired`) and `characterLimit` on right (`hasCharacterLimit`, `showCharacterLimit`)
/// - `inputContainer`: 64px box (`padding: 20px 24px`, `borderRadius: 20px`, `gap: 16px`)
/// - `leftSection`: Row containing `leftIcon` (`hasLeftIcon`), `prefix` (`hasPrefix`), and editable `input` / placeholder
/// - `suffix`: Trailing unit or descriptor text (`hasSuffix`)
/// - `rightIcon`: Trailing icon slot (`hasRightIcon`)
/// - `errorContainer`: Bottom row with 16px `error_outline` icon and caption text in `textDanger` (renders latest active error)
class InputControl extends StatefulWidget {
  /// Component version for reference.
  /// v1.4.0: Added isRequired support with asterisk matching label color. Added multiple error condition support rendering the latest error in order.
  /// v1.3.0: Added character limit overflow logic (isError=true, textDanger counter color, and 'Character limit exceeded' error message when character limit is crossed).
  /// v1.2.0: Hide entire labelBar if showLabel is false. Replaced wordLimit with numeric characterLimit showing "x/characterLimit" dynamically only in typing (selected) state. Replaced error status with independent isError and showErrorMessage properties.
  /// v1.1.0: Replaced initialValue with clean value property; streamlined placeholder and value auto-transitions.
  /// v1.0.0: Initial recreation of InputControl matching Figma Node 470:436.
  static const String version = '1.4.0';

  // Label Bar Properties (Figma: showLabel, label, isRequired, showCharacterLimit, characterLimit)
  final bool hasLabel;
  final bool showLabel;
  final String label;
  final bool isRequired;

  final bool hasCharacterLimit;
  final bool showCharacterLimit;
  final int? characterLimit;

  // Variant & Status Properties (Figma: type, status)
  final InputControlType type;
  final InputControlStatus status;

  // Left Section Properties (Figma: hasLeftIcon, hasPrefix, prefix, input)
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

  // Right Section Properties (Figma: hasSuffix, suffix, hasRightIcon)
  final bool hasSuffix;
  final String suffix;
  final Widget? suffixWidget;

  final bool hasRightIcon;
  final IconData? rightIcon;
  final Widget? rightIconWidget;

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
    this.hasLabel = true,
    this.showLabel = true,
    this.label = 'Label',
    this.isRequired = false,
    this.hasCharacterLimit = true,
    this.showCharacterLimit = true,
    this.characterLimit = 32,
    this.type = InputControlType.gray,
    this.status = InputControlStatus.default_,
    this.hasLeftIcon = true,
    this.leftIcon = Icons.face_5_outlined,
    this.leftIconWidget,
    this.hasPrefix = true,
    this.prefix = 'Prefix',
    this.prefixWidget,
    this.placeholder = 'Input',
    this.value,
    this.controller,
    this.focusNode,
    this.hasSuffix = true,
    this.suffix = 'Suffix',
    this.suffixWidget,
    this.hasRightIcon = true,
    this.rightIcon = Icons.face_5_outlined,
    this.rightIconWidget,
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

    _controller.addListener(_handleTextChange);
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(covariant InputControl oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.controller != widget.controller) {
      oldWidget.controller?.removeListener(_handleTextChange);
      _internalController?.removeListener(_handleTextChange);

      if (widget.controller == null) {
        _internalController ??= TextEditingController(
          text: oldWidget.controller?.text ?? widget.value,
        );
      } else {
        _internalController?.dispose();
        _internalController = null;
      }
      _controller.addListener(_handleTextChange);
    } else if (widget.controller == null &&
        oldWidget.value != widget.value) {
      if (widget.value != null && _controller.text != widget.value) {
        _controller.text = widget.value!;
      } else if (widget.value == null && oldWidget.value != null) {
        _controller.clear();
      }
    }

    if (oldWidget.focusNode != widget.focusNode) {
      oldWidget.focusNode?.removeListener(_handleFocusChange);
      _internalFocusNode?.removeListener(_handleFocusChange);

      if (widget.focusNode == null) {
        _internalFocusNode ??= FocusNode();
      } else {
        _internalFocusNode?.dispose();
        _internalFocusNode = null;
      }
      _focusNode.addListener(_handleFocusChange);
    }
  }

  @override
  void dispose() {
    if (widget.controller != null) {
      widget.controller!.removeListener(_handleTextChange);
    }
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(_handleFocusChange);
    }
    _internalController?.removeListener(_handleTextChange);
    _internalController?.dispose();
    _internalFocusNode?.removeListener(_handleFocusChange);
    _internalFocusNode?.dispose();
    super.dispose();
  }

  void _handleTextChange() {
    setState(() {});
  }

  void _handleFocusChange() {
    setState(() {});
  }

  /// Checks if character limit is exceeded.
  bool get _isLimitExceeded =>
      widget.hasCharacterLimit &&
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

  /// Determines effective status taking user-specified status and runtime focus into account.
  InputControlStatus get _effectiveStatus {
    if (!widget.enabled || widget.status == InputControlStatus.disabled) {
      return InputControlStatus.disabled;
    }
    if (widget.readOnly || widget.status == InputControlStatus.readonly) {
      return InputControlStatus.readonly;
    }
    if (_focusNode.hasFocus || widget.status == InputControlStatus.selected) {
      return InputControlStatus.selected;
    }
    if (_controller.text.isNotEmpty ||
        widget.status == InputControlStatus.filled) {
      return InputControlStatus.filled;
    }
    return InputControlStatus.default_;
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
    switch (_effectiveStatus) {
      case InputControlStatus.selected:
        return AlterSemanticTokens.stroke1000; // #000000
      case InputControlStatus.readonly:
        return AlterSemanticTokens.textDisabled; // #99A1AF (stroke 1px)
      case InputControlStatus.disabled:
      case InputControlStatus.filled:
      case InputControlStatus.default_:
        switch (widget.type) {
          case InputControlType.gray:
            return AlterSemanticTokens.stroke200; // #E5E7EB
          case InputControlType.white:
            return AlterSemanticTokens.stroke100; // #F3F4F6
        }
    }
  }

  Color get _contentColor {
    switch (_effectiveStatus) {
      case InputControlStatus.readonly:
        return AlterSemanticTokens.textSecondary; // #4A5565
      case InputControlStatus.selected:
      case InputControlStatus.filled:
        return AlterSemanticTokens.textPrimary; // #000000
      case InputControlStatus.default_:
      case InputControlStatus.disabled:
        return AlterSemanticTokens.textDisabled; // #99A1AF
    }
  }

  Widget? _buildLabelBar() {
    // If showLabel is false, hide the complete labelBar container (including characterLimit)
    if (!widget.hasLabel || !widget.showLabel) {
      return null;
    }

    final isTypingState = _effectiveStatus == InputControlStatus.selected;
    final showCharLimit = widget.hasCharacterLimit &&
        widget.showCharacterLimit &&
        widget.characterLimit != null &&
        isTypingState;

    final charLimitText = widget.characterLimit != null
        ? '${_controller.text.length}/${widget.characterLimit}'
        : '${_controller.text.length}';

    final charLimitColor = _isLimitExceeded
        ? AlterSemanticTokens.textDanger
        : AlterSemanticTokens.textSecondary;

    final labelText = widget.isRequired ? '${widget.label} *' : widget.label;

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

        // Character Limit on Right (Visible only in Typing / Selected State)
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

  Widget _buildLeftSection() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Icon (24x24)
          if (widget.hasLeftIcon) ...[
            if (widget.leftIconWidget != null)
              widget.leftIconWidget!
            else if (widget.leftIcon != null)
              Icon(
                widget.leftIcon,
                size: 24,
                color: _contentColor,
              ),
            const SizedBox(width: 8),
          ],

          // Prefix
          if (widget.hasPrefix && widget.prefix.isNotEmpty) ...[
            if (widget.prefixWidget != null)
              widget.prefixWidget!
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  widget.prefix,
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
                enabled: widget.enabled &&
                    _effectiveStatus != InputControlStatus.disabled,
                readOnly: widget.readOnly ||
                    _effectiveStatus == InputControlStatus.readonly,
                autofocus: widget.autofocus,
                keyboardType: widget.keyboardType,
                textInputAction: widget.textInputAction,
                onChanged: widget.onChanged,
                onSubmitted: widget.onSubmitted,
                cursorColor: AlterSemanticTokens.textPrimary,
                style: AlterTypography.bodyLg.copyWith(
                  color: _controller.text.isEmpty &&
                          _effectiveStatus == InputControlStatus.default_
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
    if (!widget.hasSuffix || widget.suffix.isEmpty) {
      return null;
    }

    if (widget.suffixWidget != null) {
      return widget.suffixWidget;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text(
        widget.suffix,
        textAlign: TextAlign.right,
        style: AlterTypography.bodyLg.copyWith(
          color: _contentColor,
        ),
      ),
    );
  }

  Widget? _buildRightIcon() {
    if (!widget.hasRightIcon) {
      return null;
    }

    if (widget.rightIconWidget != null) {
      return widget.rightIconWidget;
    }

    if (widget.rightIcon != null) {
      return Icon(
        widget.rightIcon,
        size: 24,
        color: _contentColor,
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
    final rightIconWidget = _buildRightIcon();
    final effectiveError = _effectiveIsError;
    final effectiveMsg = _effectiveErrorMessage;
    final showErrorMessage = effectiveError &&
        widget.showErrorMessage &&
        effectiveMsg.isNotEmpty;
    final isDisabled = _effectiveStatus == InputControlStatus.disabled;

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLeftSection(),
            if (suffixWidget != null) ...[
              const SizedBox(width: 16),
              suffixWidget,
            ],
            if (rightIconWidget != null) ...[
              const SizedBox(width: 16),
              rightIconWidget,
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
