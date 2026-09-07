import 'package:flutter/material.dart';
import '../../styles/swatches.dart';
import '../../styles/tokens.dart';

class ButtonGraphicText extends StatelessWidget {
  /// Component version for reference.
  /// v1.0.2: Fine-tuned padding to exact Figma specification (7px top, 9px bottom, 10px horizontal).
  /// v1.0.1: Bound container background to `AlterColors.colorsGreen900` with `AlterColors.colorsGreen500` border.
  static const String version = '1.0.2';

  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const ButtonGraphicText({
    super.key,
    this.title = 'STREAK',
    this.subtitle = '7 DAYS',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 7, 10, 9),
        decoration: BoxDecoration(
          color: AlterColors.colorsGreen900,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AlterColors.colorsGreen500,
            width: 1,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Geist',
                package: 'alter',
                color: AlterSemanticTokens.textInverse,
                fontSize: 10,
                fontWeight: FontWeight.w600,
                height: 16 / 10,
                letterSpacing: 0.5,
              ),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Geist',
                package: 'alter',
                color: AlterSemanticTokens.textInverse,
                fontSize: 12,
                fontWeight: FontWeight.w900,
                height: 16 / 12,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
