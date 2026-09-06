import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';

WidgetbookFolder foundationsCategory() {
  return WidgetbookFolder(
    name: 'Foundations',
    children: [
      WidgetbookComponent(
        name: 'Typography',
        useCases: [
          WidgetbookUseCase(
            name: 'Scale & Styles',
            builder: (context) {
              final sampleText = context.knobs.string(
                label: 'Sample Text',
                initialValue: 'The quick brown fox jumps over the lazy dog',
              );

              final styles = <String, TextStyle>{
                'Display (48px / 60px Geist)': AlterTypography.display,
                'Display XL (60px / 72px Geist)': AlterTypography.displayXl,
                'H1 Serif (32px / 40px Instrument Serif)': AlterTypography.h1Serif,
                'H1 Bold (32px / 40px Geist)': AlterTypography.h1Bold,
                'H2 (24px / 32px Geist)': AlterTypography.h2,
                'H3 (20px / 28px Geist)': AlterTypography.h3,
                'Body Large Bold (16px / 28px Geist)': AlterTypography.bodyLgBold,
                'Body (16px / 24px Geist)': AlterTypography.body,
                'Caption Bold (12px / 16px Geist)': AlterTypography.captionBold,
                'Caption (12px / 16px Geist)': AlterTypography.caption,
              };

              return ListView.separated(
                padding: const EdgeInsets.all(24),
                itemCount: styles.length,
                separatorBuilder: (_, _) => const Divider(height: 32),
                itemBuilder: (context, index) {
                  final entry = styles.entries.elementAt(index);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AlterSemanticTokens.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        sampleText,
                        style: entry.value.copyWith(
                          color: AlterSemanticTokens.textPrimary,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      WidgetbookComponent(
        name: 'Semantic Tokens',
        useCases: [
          WidgetbookUseCase(
            name: 'Colors Palette',
            builder: (context) {
              final tokens = <String, Color>{
                'baseWhite': AlterSemanticTokens.baseWhite,
                'baseGray': AlterSemanticTokens.baseGray,
                'baseBlack': AlterSemanticTokens.baseBlack,
                'textPrimary': AlterSemanticTokens.textPrimary,
                'textSecondary': AlterSemanticTokens.textSecondary,
                'textDisabled': AlterSemanticTokens.textDisabled,
                'textInverse': AlterSemanticTokens.textInverse,
                'textCaution': AlterSemanticTokens.textCaution,
                'textWarning': AlterSemanticTokens.textWarning,
                'textDanger': AlterSemanticTokens.textDanger,
                'textSuccess': AlterSemanticTokens.textSuccess,
                'stroke100': AlterSemanticTokens.stroke100,
                'stroke200': AlterSemanticTokens.stroke200,
                'stroke1000': AlterSemanticTokens.stroke1000,
                'statusSuccess': AlterSemanticTokens.statusSuccess,
                'statusTeal': AlterSemanticTokens.statusTeal,
                'statusWarning': AlterSemanticTokens.statusWarning,
                'ui1': AlterSemanticTokens.ui1,
                'ui2': AlterSemanticTokens.ui2,
                'ui4': AlterSemanticTokens.ui4,
                'ui6': AlterSemanticTokens.ui6,
              };

              return GridView.builder(
                padding: const EdgeInsets.all(24),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.2,
                ),
                itemCount: tokens.length,
                itemBuilder: (context, index) {
                  final entry = tokens.entries.elementAt(index);
                  final isDark = ThemeData.estimateBrightnessForColor(entry.value) == Brightness.dark;
                  return Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: entry.value,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: AlterSemanticTokens.stroke100,
                        width: 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entry.key,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        Text(
                          '#${entry.value.toARGB32().toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}',
                          style: TextStyle(
                            fontSize: 11,
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    ],
  );
}
