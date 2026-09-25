import 'package:flutter/material.dart';
import '../../styles/tokens.dart';

/// A rounded image or avatar button following Alter Design System tokens.
class ButtonGraphicImage extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Added `image`, `child`, and `size` properties to support avatars, cover images, and custom children.
  /// v1.0.1: Configured 20px border radius with stroke200 border styling.
  static const String version = '1.1.0';

  /// Image provider to render in the button (e.g. [NetworkImage], [AssetImage]).
  final ImageProvider? image;

  /// Custom child widget to display if [image] is not provided.
  final Widget? child;

  /// Dimensions (width & height) of the button container (defaults to 48.0).
  final double size;

  /// Callback triggered on tap.
  final VoidCallback? onTap;

  /// Creates a [ButtonGraphicImage] instance.
  const ButtonGraphicImage({
    super.key,
    this.image,
    this.child,
    this.size = 48.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (image != null) {
      content = Image(
        image: image!,
        fit: BoxFit.cover,
        width: size,
        height: size,
      );
    } else if (child != null) {
      content = child!;
    } else {
      content = const Center(
        child: Icon(
          Icons.image_outlined,
          color: AlterSemanticTokens.ui6,
          size: 24,
        ),
      );
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: size,
        height: size,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AlterSemanticTokens.ui1,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AlterSemanticTokens.stroke200,
            width: 1,
          ),
        ),
        child: content,
      ),
    );
  }
}
