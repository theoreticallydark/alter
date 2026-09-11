import 'package:flutter/material.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import '../buttons/button_icon_ghost.dart';
import 'input_container.dart';
import 'text_input.dart';

/// Reusable Search component for the Alter Design System.
///
/// Figma Specifications (Node `130:11237`):
/// - Variants:
///   - `State=Default` (`130:11128`): Fill `baseGray`, Border `stroke100`/`stroke200`, Text `textSecondary` ('Search')
///   - `State=Typing` (`130:11238`): Fill `baseGray`, Border `stroke1000`, Text `textPrimary`
///   - `State=Typed` (`164:8268`): Fill `baseGray`, Border `stroke100`/`stroke200`, Text `textPrimary`
///   - `State=ReadOnly`: Border 1px `textDisabled` (`#99A1AF`)
///   - `State=Disabled`: 48% opacity, forbidden cursor
/// - Composes [InputContainer] with `hasLabelBar: false` to hide the top bar.
/// - Leading search icon (`icon: Icons.search`) and right slot clear button ([ButtonIconGhost]).
class Search extends StatefulWidget {
  /// Component version for reference.
  /// v2.0.0: Rebuilt with InputContainer composition, leading search icon, clear button, and white/gray variants.
  static const String version = '2.0.0';

  final String hintText;
  final String? initialValue;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final TextInputVariant type;

  // Leading Slot
  final bool hasIcon;
  final IconData? icon;
  final Widget? leadingWidget;

  // Right Slot
  final bool hasClear;

  // Interactivity
  final bool autofocus;
  final bool enabled;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final VoidCallback? onEditingComplete;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;

  const Search({
    super.key,
    this.hintText = 'Search',
    this.initialValue,
    this.controller,
    this.focusNode,
    this.type = TextInputVariant.gray,
    this.hasIcon = true,
    this.icon = Icons.search,
    this.leadingWidget,
    this.hasClear = true,
    this.autofocus = false,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.onEditingComplete,
    this.textInputAction = TextInputAction.search,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController? _internalController;
  FocusNode? _internalFocusNode;

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
  void didUpdateWidget(covariant Search oldWidget) {
    super.didUpdateWidget(oldWidget);

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
    setState(() {});
  }

  void _onFocusChanged() {
    setState(() {});
  }

  Color _computeIconColor() {
    if (widget.readOnly) {
      return AlterSemanticTokens.textSecondary;
    }
    if ((_focusNode.hasFocus && widget.enabled) || _controller.text.isNotEmpty) {
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

  Widget? _buildLeading() {
    if (widget.leadingWidget != null) {
      return widget.leadingWidget;
    }
    if (widget.hasIcon && widget.icon != null) {
      return Icon(
        widget.icon,
        size: 24,
        color: _computeIconColor(),
      );
    }
    return null;
  }

  Widget? _buildTrailing() {
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

  @override
  Widget build(BuildContext context) {
    final leadingWidget = _buildLeading();
    final trailingWidget = _buildTrailing();

    return InputContainer(
      hasLabelBar: false,
      type: widget.type,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      hasFocus: _focusNode.hasFocus,
      onTap: () {
        widget.onTap?.call();
        _focusNode.requestFocus();
      },
      leading: leadingWidget,
      trailing: trailingWidget,
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        autofocus: widget.autofocus,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        showCursor: !widget.readOnly && widget.enabled,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        cursorColor: AlterSemanticTokens.textPrimary,
        style: AlterTypography.bodyLg.copyWith(
          color: _textColor,
        ),
        onChanged: (val) {
          widget.onChanged?.call(val);
        },
        onSubmitted: widget.onSubmitted,
        onEditingComplete: widget.onEditingComplete,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintText: widget.hintText,
          hintStyle: AlterTypography.bodyLg.copyWith(
            color: AlterSemanticTokens.textSecondary,
          ),
        ),
      ),
    );
  }
}
