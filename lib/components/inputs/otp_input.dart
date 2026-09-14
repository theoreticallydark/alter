import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../styles/tokens.dart';
import '../../styles/typography.dart';
import 'input_control.dart';

/// A PIN / OTP verification component for the Alter Design System.
///
/// Features:
/// - Configurable digit count (`length: 4` or `6`).
/// - Auto-focus progression and backspace retreat.
/// - Full paste clipboard detection to auto-fill cells.
/// - Optional `obscureOtp` mode.
/// - Matches Alter input tokens (20px radius, 64px box height, stroke borders, textDanger on error).
class OTPInput extends StatefulWidget {
  /// Component version for reference.
  /// v1.0.0: Initial release of OTPInput supporting auto-focus progression, paste, and Alter styling tokens.
  static const String version = '1.0.0';

  final int length;
  final InputControlType type;
  final bool obscureOtp;
  final String obscuringCharacter;
  final bool autofocus;
  final bool enabled;
  final bool readOnly;
  final bool isError;
  final bool showErrorMessage;
  final String errorMessage;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;

  const OTPInput({
    super.key,
    this.length = 4,
    this.type = InputControlType.gray,
    this.obscureOtp = false,
    this.obscuringCharacter = '•',
    this.autofocus = true,
    this.enabled = true,
    this.readOnly = false,
    this.isError = false,
    this.showErrorMessage = true,
    this.errorMessage = 'Invalid OTP code',
    this.onChanged,
    this.onCompleted,
  });

  @override
  State<OTPInput> createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _initControllers();
  }

  void _initControllers() {
    _controllers = List.generate(widget.length, (_) => TextEditingController());
    _focusNodes = List.generate(widget.length, (_) => FocusNode());
  }

  @override
  void didUpdateWidget(covariant OTPInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.length != widget.length) {
      for (final c in _controllers) {
        c.dispose();
      }
      for (final f in _focusNodes) {
        f.dispose();
      }
      _initControllers();
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String get _currentOtp => _controllers.map((c) => c.text).join();

  void _onDigitChanged(int index, String value) {
    if (value.length > 1) {
      // Handle paste
      final clean = value.replaceAll(RegExp(r'[^\d]'), '');
      for (int i = 0; i < widget.length; i++) {
        if (i < clean.length) {
          _controllers[i].text = clean[i];
        }
      }
      final nextIndex = clean.length < widget.length ? clean.length : widget.length - 1;
      _focusNodes[nextIndex].requestFocus();
    } else if (value.isNotEmpty) {
      if (index + 1 < widget.length) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].unfocus();
      }
    }

    final otp = _currentOtp;
    widget.onChanged?.call(otp);
    if (otp.length == widget.length) {
      widget.onCompleted?.call(otp);
    }
    setState(() {});
  }

  void _onKeyEvent(int index, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        _controllers[index].text.isEmpty &&
        index > 0) {
      _focusNodes[index - 1].requestFocus();
      _controllers[index - 1].clear();
      widget.onChanged?.call(_currentOtp);
      setState(() {});
    }
  }

  Color get _backgroundColor {
    switch (widget.type) {
      case InputControlType.gray:
        return AlterSemanticTokens.baseGray;
      case InputControlType.white:
        return AlterSemanticTokens.baseWhite;
    }
  }

  Color _getBorderColor(int index) {
    if (widget.isError) {
      return AlterSemanticTokens.textDanger;
    }
    if (_focusNodes[index].hasFocus) {
      return AlterSemanticTokens.stroke1000;
    }
    if (_controllers[index].text.isNotEmpty) {
      return AlterSemanticTokens.stroke100;
    }
    switch (widget.type) {
      case InputControlType.gray:
        return AlterSemanticTokens.stroke200;
      case InputControlType.white:
        return AlterSemanticTokens.stroke100;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.length, (index) {
            final isFirst = index == 0;
            final isFocused = _focusNodes[index].hasFocus;
            final hasValue = _controllers[index].text.isNotEmpty;

            return Container(
              margin: EdgeInsets.only(left: isFirst ? 0 : 12),
              width: 56,
              height: 64,
              decoration: BoxDecoration(
                color: _backgroundColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: _getBorderColor(index),
                  width: isFocused ? 2 : 1,
                ),
              ),
              child: Center(
                child: KeyboardListener(
                  focusNode: FocusNode(),
                  onKeyEvent: (e) => _onKeyEvent(index, e),
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    autofocus: isFirst && widget.autofocus,
                    enabled: widget.enabled,
                    readOnly: widget.readOnly,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    obscureText: widget.obscureOtp,
                    obscuringCharacter: widget.obscuringCharacter,
                    cursorColor: AlterSemanticTokens.textPrimary,
                    style: AlterTypography.h2.copyWith(
                      color: hasValue
                          ? AlterSemanticTokens.textPrimary
                          : AlterSemanticTokens.textDisabled,
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      isDense: true,
                    ),
                    onChanged: (val) => _onDigitChanged(index, val),
                  ),
                ),
              ),
            );
          }),
        ),
        if (widget.isError && widget.showErrorMessage && widget.errorMessage.isNotEmpty) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error_outline,
                size: 16,
                color: AlterSemanticTokens.textDanger,
              ),
              const SizedBox(width: 4),
              Text(
                widget.errorMessage,
                style: AlterTypography.caption.copyWith(
                  color: AlterSemanticTokens.textDanger,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
