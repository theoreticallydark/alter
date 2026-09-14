import 'package:flutter/material.dart' hide Checkbox;
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

    testWidgets('ButtonIcon renders and handles tap for red type', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ButtonIcon(
                icon: Icons.delete_outline,
                type: ButtonIconType.red,
                onTap: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.delete_outline), findsOneWidget);
      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('ButtonIconGhost renders and handles tap and long press', (WidgetTester tester) async {
      bool tapped = false;
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ButtonIconGhost(
                icon: Icons.link,
                type: ButtonIconGhostType.red,
                onTap: () {
                  tapped = true;
                },
                onLongPress: () {
                  longPressed = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.link), findsOneWidget);
      await tester.tap(find.byIcon(Icons.link));
      await tester.pump();
      expect(tapped, isTrue);

      await tester.longPress(find.byIcon(Icons.link));
      await tester.pump();
      expect(longPressed, isTrue);
    });

    testWidgets('ButtonGraphicImage renders and handles tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ButtonGraphicImage(
                onTap: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byType(ButtonGraphicImage), findsOneWidget);
      await tester.tap(find.byType(ButtonGraphicImage));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('ButtonGraphicText renders title and subtitle and handles tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ButtonGraphicText(
                title: 'STREAK',
                subtitle: '10 DAYS',
                onTap: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('STREAK'), findsOneWidget);
      expect(find.text('10 DAYS'), findsOneWidget);
      await tester.tap(find.byType(ButtonGraphicText));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('Pill renders label and value and handles tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Pill(
                label: 'FILTER',
                value: 'Completed',
                isCompleted: true,
                isSelected: true,
                onTap: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('FILTER'), findsOneWidget);
      expect(find.text('Completed'), findsOneWidget);
      await tester.tap(find.byType(Pill));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('ApplicationHeader renders with return button and custom slot', (WidgetTester tester) async {
      bool returnTapped = false;
      bool actionTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ApplicationHeader(
                title: 'Test Header',
                subtitle: 'Test Subtitle',
                hasReturnButton: true,
                onReturnTap: () {
                  returnTapped = true;
                },
                hasActionOne: true,
                onActionOneTap: () {
                  actionTapped = true;
                },
                slot: const Text('Slot Content'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Header'), findsOneWidget);
      expect(find.text('Test Subtitle'), findsOneWidget);
      expect(find.text('Slot Content'), findsOneWidget);
      expect(find.byIcon(Icons.chevron_left), findsOneWidget);

      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pump();
      expect(returnTapped, isTrue);

      await tester.tap(find.byType(ButtonIcon));
      await tester.pump();
      expect(actionTapped, isTrue);
    });

    testWidgets('Checkbox cycles states on tap', (WidgetTester tester) async {
      CheckboxState? currentState = CheckboxState.unchecked;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return Checkbox(
                    state: currentState!,
                    onChanged: (newState) {
                      setState(() {
                        currentState = newState;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.check_box_outline_blank), findsOneWidget);

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(currentState, equals(CheckboxState.checked));
      expect(find.byIcon(Icons.check_box), findsOneWidget);

      await tester.tap(find.byType(Checkbox));
      await tester.pump();
      expect(currentState, equals(CheckboxState.unchecked));
      expect(find.byIcon(Icons.check_box_outline_blank), findsOneWidget);
    });

    testWidgets('ToggleIcon switches icon and triggers callback', (WidgetTester tester) async {
      bool selected = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: StatefulBuilder(
                builder: (context, setState) {
                  return ToggleIcon(
                    isSelected: selected,
                    icon: Icons.star_border,
                    selectedIcon: Icons.star,
                    onSelectedChanged: (val) {
                      setState(() {
                        selected = val;
                      });
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.star_border), findsOneWidget);

      await tester.tap(find.byType(ToggleIcon));
      await tester.pump();
      expect(selected, isTrue);
      expect(find.byIcon(Icons.star), findsOneWidget);

      await tester.tap(find.byType(ToggleIcon));
      await tester.pump();
      expect(selected, isFalse);
      expect(find.byIcon(Icons.star_border), findsOneWidget);
    });

    testWidgets('ListItem renders title, subtitle, slots, and handles tap', (WidgetTester tester) async {
      bool rowTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ListItem(
                title: 'Custom Item Title',
                subtitle: 'Custom Item Subtitle',
                hasLeftSlot: true,
                hasRightSlotOne: true,
                hasRightSlotTwo: true,
                onTap: () {
                  rowTapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Custom Item Title'), findsOneWidget);
      expect(find.text('Custom Item Subtitle'), findsOneWidget);
      expect(find.byIcon(Icons.remove_circle_outline), findsOneWidget);
      expect(find.byIcon(Icons.check_box_outline_blank), findsOneWidget);
      expect(find.byIcon(Icons.favorite_border), findsOneWidget);

      await tester.tap(find.text('Custom Item Title'));
      await tester.pump();
      expect(rowTapped, isTrue);
    });

    testWidgets('TextInput renders label, placeholder, and handles input', (WidgetTester tester) async {
      String typedValue = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: TextInput(
                label: 'Test Input',
                placeholder: 'Enter text here',
                onChanged: (val) => typedValue = val,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Input'), findsOneWidget);
      expect(find.text('Enter text here'), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Hello World');
      await tester.pump();
      expect(typedValue, equals('Hello World'));
    });

    testWidgets('TextArea renders with multiline sizing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: TextArea(
                label: 'Bio',
                placeholder: 'Write your bio...',
                lines: 4,
                minLines: 1,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Bio'), findsOneWidget);
      expect(find.text('Write your bio...'), findsOneWidget);
    });

    testWidgets('NumericInput accepts numbers and enforces formatting', (WidgetTester tester) async {
      num? numericVal;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: NumericInput(
                label: 'Quantity',
                placeholder: '0',
                onNumberChanged: (val) => numericVal = val,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Quantity'), findsOneWidget);
      await tester.enterText(find.byType(TextField), '42');
      await tester.pump();
      expect(numericVal, equals(42));
    });

    testWidgets('PasswordInput toggles visibility and respects validations', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: PasswordInput(
                label: 'Password',
                placeholder: 'Enter password',
                showEyeToggle: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Password'), findsOneWidget);
      expect(find.byIcon(Icons.visibility_outlined), findsOneWidget);

      await tester.tap(find.byIcon(Icons.visibility_outlined));
      await tester.pump();
      expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
    });

    testWidgets('SearchInput renders search icon and triggers search callback', (WidgetTester tester) async {
      String searched = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SearchInput(
                placeholder: 'Search items...',
                onSearch: (q) => searched = q,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Search items...'), findsOneWidget);
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);

      await tester.enterText(find.byType(TextField), 'Flutter');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();
      expect(searched, equals('Flutter'));
    });

    testWidgets('CurrencyInput formats input currency correctly', (WidgetTester tester) async {
      num? currentVal;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: CurrencyInput(
                label: 'Amount',
                prefix: '\$',
                onAmountChanged: (val) => currentVal = val,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Amount'), findsOneWidget);
      expect(find.text('\$'), findsOneWidget);

      await tester.enterText(find.byType(TextField), '150.50');
      await tester.pump();
      expect(currentVal, equals(150.50));
    });

    testWidgets('OTPInput renders boxes and accepts digit pins', (WidgetTester tester) async {
      String completedPin = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: OTPInput(
                length: 4,
                onCompleted: (pin) => completedPin = pin,
              ),
            ),
          ),
        ),
      );

      expect(find.byType(TextField), findsNWidgets(4));
      await tester.enterText(find.byType(TextField).first, '1');
      await tester.pump();
      expect(completedPin, isEmpty);
    });
  });
}

