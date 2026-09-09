import 'dart:async';
import 'package:flutter/material.dart';
import 'package:alter/alter.dart';

OverlayEntry? _activeToastEntry;
Timer? _toastTimer;

/// Shows a floating toast message across Widgetbook preview canvas and device frames.
void showExampleToast(BuildContext context, String message) {
  _toastTimer?.cancel();
  try {
    _activeToastEntry?.remove();
  } catch (_) {}
  _activeToastEntry = null;

  final overlay = Overlay.maybeOf(context, rootOverlay: false) ??
      Overlay.maybeOf(context, rootOverlay: true);

  if (overlay == null) {
    final messenger = ScaffoldMessenger.maybeOf(context);
    if (messenger != null) {
      messenger.hideCurrentSnackBar();
      messenger.showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    }
    return;
  }

  late final OverlayEntry entry;
  entry = OverlayEntry(
    builder: (ctx) => _ToastOverlayWidget(
      message: message,
      onDismiss: () {
        if (_activeToastEntry == entry) {
          try {
            entry.remove();
          } catch (_) {}
          _activeToastEntry = null;
        }
      },
    ),
  );

  _activeToastEntry = entry;
  overlay.insert(entry);
}

class _ToastOverlayWidget extends StatefulWidget {
  final String message;
  final VoidCallback onDismiss;

  const _ToastOverlayWidget({
    required this.message,
    required this.onDismiss,
  });

  @override
  State<_ToastOverlayWidget> createState() => _ToastOverlayWidgetState();
}

class _ToastOverlayWidgetState extends State<_ToastOverlayWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );

    _opacity = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    ));

    _controller.forward();

    _toastTimer = Timer(const Duration(milliseconds: 2000), () async {
      if (mounted) {
        await _controller.reverse();
        widget.onDismiss();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 28,
      left: 20,
      right: 20,
      child: Center(
        child: IgnorePointer(
          child: SlideTransition(
            position: _slide,
            child: FadeTransition(
              opacity: _opacity,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 460),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AlterSemanticTokens.baseBlack,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.28),
                        blurRadius: 18,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    border: Border.all(
                      color: AlterSemanticTokens.stroke200.withValues(alpha: 0.35),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.touch_app_rounded,
                        color: AlterSemanticTokens.textInverse,
                        size: 18,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          widget.message,
                          style: const TextStyle(
                            color: AlterSemanticTokens.textInverse,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            fontFamily: AlterTypography.geistFont,
                            package: AlterTypography.package,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
