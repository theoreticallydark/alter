import 'package:flutter/material.dart';
import '../../styles/tokens.dart';

class ButtonGraphicImage extends StatelessWidget {
  /// Component version for reference.
  /// v1.1.0: Added `image`, `child`, and `size` properties to support avatars, cover images, and custom children.
  /// v1.0.1: Configured 20px border radius with stroke200 border styling.
  static const String version = '1.1.0';

  final ImageProvider? image;
  final Widget? child;
  final double size;
  final VoidCallback? onTap;

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
