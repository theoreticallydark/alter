import 'package:flutter/material.dart';
import 'package:alter/alter.dart';

void main() {
  runApp(const IllustrationApp());
}

class IllustrationApp extends StatelessWidget {
  const IllustrationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alter Illustration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AlterSemanticTokens.baseWhite,
        fontFamily: AlterTypography.geistFont,
      ),
      home: const ButtonShowcasePage(),
    );
  }
}

class ButtonShowcasePage extends StatelessWidget {
  const ButtonShowcasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Alter Buttons',
          style: TextStyle(
            color: AlterSemanticTokens.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: AlterSemanticTokens.baseWhite,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AlterSemanticTokens.stroke100,
            height: 1,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // Section: ButtonText (Normal Size)
            const Text(
              'ButtonText (Normal)',
              style: AlterTypography.h3,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ButtonText(
                  label: 'Primary',
                  type: ButtonType.primary,
                  onTap: () {},
                ),
                ButtonText(
                  label: 'Gray',
                  type: ButtonType.gray,
                  onTap: () {},
                ),
                ButtonText(
                  label: 'White',
                  type: ButtonType.white,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Section: ButtonText (Large Size)
            const Text(
              'ButtonText (Large)',
              style: AlterTypography.h3,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ButtonText(
                  label: 'Primary Large',
                  type: ButtonType.primary,
                  size: ButtonSize.large,
                  onTap: () {},
                ),
                ButtonText(
                  label: 'Gray Large',
                  type: ButtonType.gray,
                  size: ButtonSize.large,
                  onTap: () {},
                ),
                ButtonText(
                  label: 'White Large',
                  type: ButtonType.white,
                  size: ButtonSize.large,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Section: ButtonIcon
            const Text(
              'ButtonIcon',
              style: AlterTypography.h3,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ButtonIcon(
                  icon: Icons.add,
                  type: ButtonIconType.primary,
                  onTap: () {},
                ),
                ButtonIcon(
                  icon: Icons.favorite_border,
                  type: ButtonIconType.gray,
                  onTap: () {},
                ),
                ButtonIcon(
                  icon: Icons.bookmark_border,
                  type: ButtonIconType.white,
                  onTap: () {},
                ),
                ButtonIcon(
                  icon: Icons.check,
                  type: ButtonIconType.gray,
                  isSelected: true,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Section: ButtonIconGhost
            const Text(
              'ButtonIconGhost',
              style: AlterTypography.h3,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 20,
              runSpacing: 12,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ButtonIconGhost(
                  icon: Icons.close,
                  type: ButtonIconGhostType.primary,
                  onTap: () {},
                ),
                ButtonIconGhost(
                  icon: Icons.chevron_right,
                  type: ButtonIconGhostType.secondary,
                  onTap: () {},
                ),
                ButtonIconGhost(
                  icon: Icons.delete_outline,
                  type: ButtonIconGhostType.red,
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Section: Graphic Buttons
            const Text(
              'Graphic Buttons',
              style: AlterTypography.h3,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ButtonGraphicText(
                  title: 'STREAK',
                  subtitle: '7 DAYS',
                  onTap: () {},
                ),
                ButtonGraphicImage(
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

