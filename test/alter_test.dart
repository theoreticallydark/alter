import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alter/alter.dart';

void main() {
  group('Alter Tokens', () {
    test('AlterTypography constants are defined', () {
      expect(AlterTypography.geistFont, equals('Geist'));
      expect(AlterTypography.instrumentSerifFont, equals('InstrumentSerif'));
      expect(AlterTypography.display.fontFamily, equals('packages/alter/Geist'));
      expect(AlterTypography.hStyle, equals(AlterTypography.h1Serif));
    });

    test('AlterSemanticTokens are defined', () {
      expect(AlterSemanticTokens.baseWhite, equals(const Color(0xFFFFFFFF)));
      expect(AlterSemanticTokens.baseBlack, equals(AlterColors.colorsGray800));
      expect(AlterSemanticTokens.textPrimary, equals(AlterColors.black));
      expect(AlterSemanticTokens.textWarning, equals(AlterColors.colorsOrange800));
      expect(AlterSemanticTokens.statusDanger, equals(AlterColors.colorsRed600));
      expect(AlterSemanticTokens.statusCaution, equals(AlterColors.colorsYellow400));
      expect(AlterSemanticTokens.statusCautionContrast, equals(AlterColors.black));
    });
  });

  group('Alter Components', () {
    testWidgets('ButtonText renders label and handles tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ButtonText(
                label: 'Click Me',
                type: ButtonType.red,
                onTap: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);

      await tester.tap(find.text('Click Me'));
      await tester.pump();

      expect(tapped, isTrue);
    });
  });
}

