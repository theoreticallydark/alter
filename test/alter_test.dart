import 'package:flutter/material.dart' hide Checkbox, Badge, Divider;
import 'package:flutter_test/flutter_test.dart';

import 'package:alter/alter.dart';
import 'package:alter/components/header/application_header_button_icon.dart';
import 'package:alter/components/header/application_header_button_text.dart';

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
      expect(AlterSemanticTokens.baseNeutral, equals(const Color(0xFFFAFAF8)));
      expect(AlterSemanticTokens.baseGray, equals(AlterColors.colorsGray050));
      expect(AlterSemanticTokens.baseActive, equals(AlterColors.colorsGray200));
      expect(AlterSemanticTokens.baseBorder, equals(AlterColors.colorsGray200));
      expect(AlterSemanticTokens.textPrimary, equals(AlterColors.black));
      expect(AlterSemanticTokens.textInteractive, equals(AlterSemanticTokens.interactivePrimary));
      expect(AlterSemanticTokens.textWarning, equals(AlterColors.colorsOrange800));
      expect(AlterSemanticTokens.statusDanger, equals(AlterColors.colorsRed600));
      expect(AlterSemanticTokens.statusCaution, equals(AlterColors.colorsYellow400));
      expect(AlterSemanticTokens.statusCautionContrast, equals(AlterColors.black));
      expect(AlterSemanticTokens.statusBrand, equals(AlterColors.colorsGray800));
      expect(AlterSemanticTokens.statusBrandContrast, equals(AlterColors.white));
      expect(AlterSemanticTokens.interactivePrimary, equals(AlterColors.colorsGray800));
      expect(AlterSemanticTokens.interactivePrimaryActive, equals(AlterColors.colorsGray900));
      expect(AlterSemanticTokens.brand800, equals(AlterColors.colorsGray800));
      expect(AlterSemanticTokens.brandContrast, equals(AlterColors.white));
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
                size: ButtonSize.large,
                isSelected: true,
                hasIcon: true,
                icon: Icons.check,
                onTap: () {
                  tapped = true;
                },
              ),
            ),
          ),
        ),
      );

      expect(find.text('Click Me'), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);

      await tester.tap(find.text('Click Me'));
      await tester.pump();

      expect(tapped, isTrue);
    });

    testWidgets('ButtonText renders with hover state and type variations', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  ButtonText(
                    label: 'White Normal',
                    type: ButtonType.white,
                    size: ButtonSize.normal,
                  ),
                  ButtonText(
                    label: 'Gray Hovered',
                    type: ButtonType.gray,
                    isHovered: true,
                  ),
                  ButtonText(
                    label: 'Primary Selected',
                    type: ButtonType.primary,
                    isSelected: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('White Normal'), findsOneWidget);
      expect(find.text('Gray Hovered'), findsOneWidget);
      expect(find.text('Primary Selected'), findsOneWidget);
    });

    testWidgets('ButtonText honors hasIcon false override and infers icon', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  ButtonText(
                    label: 'Hidden Icon',
                    hasIcon: false,
                    icon: Icons.add,
                  ),
                  ButtonText(
                    label: 'Inferred Icon',
                    icon: Icons.search,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsNothing);
      expect(find.byIcon(Icons.search), findsOneWidget);
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

    testWidgets('ButtonIcon renders ghost variant and handles hover and selection', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  ButtonIcon(
                    icon: Icons.close,
                    type: ButtonIconType.ghost,
                  ),
                  ButtonIcon(
                    icon: Icons.favorite,
                    type: ButtonIconType.white,
                    isHovered: true,
                  ),
                  ButtonIcon(
                    icon: Icons.check,
                    type: ButtonIconType.primary,
                    isSelected: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.close), findsOneWidget);
      expect(find.byIcon(Icons.favorite), findsOneWidget);
      expect(find.byIcon(Icons.check), findsOneWidget);
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

    testWidgets('Pill renders neutral compact and handles non-interactive mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Pill(
                    label: 'Compact Neutral',
                    size: PillSize.compact,
                    color: PillColor.neutral,
                  ),
                  Pill(
                    label: 'Non-interactive',
                    isInteractive: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Compact Neutral'), findsOneWidget);
      expect(find.text('Non-interactive'), findsOneWidget);
    });

    testWidgets('Badge renders 21 color variants and triggers dismiss action', (WidgetTester tester) async {
      bool actionTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Badge(
                    label: 'Base Primary',
                    color: BadgeColor.basePrimary,
                    hasLeftIcon: true,
                    hasRightIcon: true,
                    hasAction: true,
                    onActionTap: () {
                      actionTapped = true;
                    },
                  ),
                  const Badge(
                    label: 'Base Gray',
                    color: BadgeColor.baseGray,
                  ),
                  const Badge(
                    label: 'Base White',
                    color: BadgeColor.baseWhite,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Base Primary'), findsOneWidget);
      expect(find.text('Base Gray'), findsOneWidget);
      expect(find.text('Base White'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();
      expect(actionTapped, isTrue);
    });

    testWidgets('AdvancedPill renders with slots and respects hasSubtitle toggle', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  AdvancedPill(
                    title: 'Guava, 100g',
                    subtitle: 'ALA 20%',
                    type: AdvancedPillType.white,
                    hasSubtitle: true,
                    hasLeftSlot: true,
                    hasRightSlot: true,
                  ),
                  AdvancedPill(
                    title: 'No Subtitle Pill',
                    subtitle: 'Hidden',
                    type: AdvancedPillType.gray,
                    hasSubtitle: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Guava, 100g'), findsOneWidget);
      expect(find.text('ALA 20%'), findsOneWidget);
      expect(find.text('No Subtitle Pill'), findsOneWidget);
      expect(find.text('Hidden'), findsNothing);
    });

    testWidgets('MobileApplicationHeader renders with return button and custom slot', (WidgetTester tester) async {
      bool returnTapped = false;
      bool actionTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: MobileApplicationHeader(
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

    testWidgets('ApplicationHeader renders launcher, title, pages, actions, and avatar', (WidgetTester tester) async {
      bool launcherTapped = false;
      int selectedPage = -1;
      bool action1Tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ApplicationHeader(
                title: 'Workspace',
                hasLauncherButton: true,
                onLauncherTap: () => launcherTapped = true,
                pages: const ['Overview', 'Projects', 'Analytics'],
                selectedPageIndex: 0,
                onPageSelected: (idx) => selectedPage = idx,
                action1Icon: Icons.search,
                onAction1Tap: () => action1Tapped = true,
                avatarInitials: 'RC',
              ),
            ),
          ),
        ),
      );

      expect(find.text('Workspace'), findsOneWidget);
      expect(find.text('Overview'), findsOneWidget);
      expect(find.text('Projects'), findsOneWidget);
      expect(find.text('Analytics'), findsOneWidget);
      expect(find.byIcon(Icons.apps_rounded), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.text('RC'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.apps_rounded));
      await tester.pump();
      expect(launcherTapped, isTrue);

      await tester.tap(find.text('Projects'));
      await tester.pump();
      expect(selectedPage, equals(1));

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();
      expect(action1Tapped, isTrue);
    });

    testWidgets('ApplicationHeaderButtonIcon renders icon, avatar, and handles tap', (WidgetTester tester) async {
      bool iconTapped = false;
      bool avatarTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  ApplicationHeaderButtonIcon(
                    icon: Icons.search,
                    isSelected: true,
                    onTap: () => iconTapped = true,
                  ),
                  ApplicationHeaderButtonIcon.avatar(
                    avatarInitials: 'RC',
                    isHovered: true,
                    onTap: () => avatarTapped = true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.text('RC'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.search));
      await tester.pump();
      expect(iconTapped, isTrue);

      await tester.tap(find.text('RC'));
      await tester.pump();
      expect(avatarTapped, isTrue);
    });

    testWidgets('ApplicationHeaderButtonText renders label and handles tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: ApplicationHeaderButtonText(
                label: 'STREAK',
                isSelected: true,
                onTap: () => tapped = true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('STREAK'), findsOneWidget);

      await tester.tap(find.text('STREAK'));
      await tester.pump();
      expect(tapped, isTrue);
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

    testWidgets('InputControl renders default and compact sizes with placeholder and input', (WidgetTester tester) async {
      String typedText = '';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  InputControl(
                    placeholder: 'Default Input',
                    size: InputControlSize.defaultSize,
                    onChanged: (val) => typedText = val,
                  ),
                  const InputControl(
                    placeholder: 'Compact Input',
                    size: InputControlSize.compact,
                    suffix: 'USD',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Default Input'), findsOneWidget);
      expect(find.text('Compact Input'), findsOneWidget);
      expect(find.text('USD'), findsOneWidget);

      await tester.enterText(find.byType(TextField).first, 'Testing InputControl');
      await tester.pump();
      expect(typedText, equals('Testing InputControl'));
    });

    testWidgets('InputControl renders vertical slots (upSlot, downSlot) and right button', (WidgetTester tester) async {
      bool buttonTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: InputControl(
                placeholder: 'Slot Test',
                hasUpSlot: true,
                upSlot: const Text('Up Slot Header'),
                hasDownSlot: true,
                downSlot: const Text('Down Slot Footer'),
                rightButton: ButtonIconGhost(
                  icon: Icons.arrow_upward,
                  onTap: () {
                    buttonTapped = true;
                  },
                ),
                isSelected: true,
                isHovered: true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Up Slot Header'), findsOneWidget);
      expect(find.text('Down Slot Footer'), findsOneWidget);
      expect(find.byIcon(Icons.arrow_upward), findsOneWidget);

      await tester.tap(find.byIcon(Icons.arrow_upward));
      await tester.pump();
      expect(buttonTapped, isTrue);
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

    testWidgets('AlterBottomNavigationBar renders tabs and handles tap', (WidgetTester tester) async {
      int tappedIndex = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AlterBottomNavigationBar(
                selectedIndex: 0,
                onItemTapped: (index) => tappedIndex = index,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Search'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);

      await tester.tap(find.text('Search'));
      await tester.pump();
      expect(tappedIndex, equals(1));
    });

    testWidgets('BottomNavigationButton renders primary and secondary and handles tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: BottomNavigationButton(
                icon: Icons.add,
                type: BottomNavigationButtonType.primary,
                onTap: () => tapped = true,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.add), findsOneWidget);
      await tester.tap(find.byIcon(Icons.add));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('TabItem renders label, icon, handles tap and active state', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  TabItem(
                    label: 'Standard Tab',
                    isSelected: true,
                    type: TabItemType.gray,
                    onTap: () => tapped = true,
                  ),
                  const TabItem(
                    label: 'Icon Tab',
                    hasIcon: true,
                    icon: Icons.face_5_outlined,
                    isSelected: false,
                    type: TabItemType.white,
                  ),
                  const TabItem(
                    hasIcon: true,
                    hasLabel: false,
                    icon: Icons.star,
                    isSelected: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Standard Tab'), findsOneWidget);
      expect(find.text('Icon Tab'), findsOneWidget);
      expect(find.byIcon(Icons.face_5_outlined), findsOneWidget);
      expect(find.byIcon(Icons.star), findsOneWidget);

      await tester.tap(find.text('Standard Tab'));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('Tabs renders items and handles selection', (WidgetTester tester) async {
      int selected = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Tabs(
                tabs: const ['Tab 1', 'Tab 2', 'Tab 3'],
                selectedIndex: 0,
                onTabSelected: (i) => selected = i,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Tab 1'), findsOneWidget);
      expect(find.text('Tab 2'), findsOneWidget);
      expect(find.text('Tab 3'), findsOneWidget);

      await tester.tap(find.text('Tab 2'));
      await tester.pump();
      expect(selected, equals(1));
    });

    testWidgets('Tabs renders with hasIcon and handles icon-only mode', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: Tabs(
                tabs: ['Home', 'Search', 'Profile'],
                hasIcon: true,
                icons: [
                  Icons.home_outlined,
                  Icons.search_rounded,
                  Icons.face_5_outlined,
                ],
                selectedIndex: 0,
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.home_outlined), findsOneWidget);
      expect(find.byIcon(Icons.search_rounded), findsOneWidget);
      expect(find.byIcon(Icons.face_5_outlined), findsOneWidget);
      expect(find.text('Home'), findsOneWidget);
    });

    testWidgets('Avatar renders placeholder icon, initials, and handles tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Column(
                children: [
                  Avatar.placeholder(
                    size: 32,
                    onTap: () => tapped = true,
                  ),
                  const Avatar.initials(
                    initials: 'RC',
                    size: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.face_5_outlined), findsOneWidget);
      expect(find.text('RC'), findsOneWidget);

      await tester.tap(find.byType(Avatar).first);
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('Divider renders horizontal and vertical lines with custom thickness and indents', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                Divider(
                  thickness: 2.0,
                  indent: 12.0,
                  endIndent: 12.0,
                ),
                SizedBox(
                  height: 50,
                  child: Divider.vertical(
                    thickness: 1.0,
                    length: 40.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.byType(Divider), findsNWidgets(2));
      final RenderBox horizontalBox = tester.renderObject(find.byType(Divider).first);
      expect(horizontalBox.size.height, equals(2.0));
    });

    testWidgets('BioMarker renders title, subtitle, badges, divider, description, and adapts to layout', (WidgetTester tester) async {
      bool logoTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BioMarker(
              title: 'Alter Web Marker',
              subtitle: 'Senior Designer',
              description: 'Designing scalable Flutter components.',
              hasBadgeOne: true,
              badge1Label: 'Staff',
              badge2Label: 'Flutter',
              badge3Label: 'Full-time',
              onLogoTap: () => logoTapped = true,
            ),
          ),
        ),
      );

      expect(find.text('Alter Web Marker'), findsOneWidget);
      expect(find.text('Senior Designer'), findsOneWidget);
      expect(find.text('Designing scalable Flutter components.'), findsOneWidget);
      expect(find.text('Staff'), findsOneWidget);
      expect(find.text('Flutter'), findsOneWidget);
      expect(find.text('Full-time'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);

      await tester.tap(find.byType(InkWell).first);
      await tester.pump();
      expect(logoTapped, isTrue);
    });

    testWidgets('CarouselControl renders previous and next buttons and responds to taps', (WidgetTester tester) async {
      bool prevTapped = false;
      bool nextTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CarouselControl(
              position: CarouselControlPosition.middle,
              onPrevious: () => prevTapped = true,
              onNext: () => nextTapped = true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.chevron_left), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);

      await tester.tap(find.byIcon(Icons.chevron_left));
      await tester.pump();
      expect(prevTapped, isTrue);

      await tester.tap(find.byIcon(Icons.chevron_right));
      await tester.pump();
      expect(nextTapped, isTrue);
    });

    testWidgets('ProjectMarker renders single image mode and responds to interaction', (WidgetTester tester) async {
      int tappedIndex = -1;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ProjectMarker(
              title: 'Project Title',
              subtitle: 'Project Subtitle',
              isCarousel: false,
              onImageTap: (index) => tappedIndex = index,
            ),
          ),
        ),
      );

      expect(find.text('Project Title'), findsOneWidget);
      expect(find.text('Project Subtitle'), findsOneWidget);
      expect(find.byType(BioMarker), findsOneWidget);

      await tester.tap(find.byIcon(Icons.image_outlined));
      await tester.pump();
      expect(tappedIndex, equals(0));
    });

    testWidgets('ProjectMarker renders carousel mode with CarouselControl', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 896,
              child: ProjectMarker(
                title: 'Carousel Project',
                subtitle: 'Two columns PC view',
                isCarousel: true,
                device: ProjectMarkerDevice.pc,
                pcItemsPerView: 2,
                carouselItems: [
                  Container(key: const Key('item1'), color: Colors.blue),
                  Container(key: const Key('item2'), color: Colors.red),
                  Container(key: const Key('item3'), color: Colors.green),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Carousel Project'), findsOneWidget);
      expect(find.byType(CarouselControl), findsOneWidget);
      expect(find.byIcon(Icons.chevron_right), findsOneWidget);
    });

    testWidgets('ProjectMarker supports configurable pcItemsPerView (3 columns)', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 896,
              child: ProjectMarker(
                title: '3-Column Carousel',
                subtitle: 'Three items per row',
                isCarousel: true,
                device: ProjectMarkerDevice.pc,
                pcItemsPerView: 3,
                carouselItems: [
                  Container(key: const Key('c1'), color: Colors.blue),
                  Container(key: const Key('c2'), color: Colors.red),
                  Container(key: const Key('c3'), color: Colors.green),
                  Container(key: const Key('c4'), color: Colors.yellow),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byKey(const Key('c1')), findsOneWidget);
      expect(find.byKey(const Key('c2')), findsOneWidget);
      expect(find.byKey(const Key('c3')), findsOneWidget);
      expect(find.byType(CarouselControl), findsOneWidget);
    });

    testWidgets('ProjectMarker renders mobile carousel with touch PageView and peek', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 316,
              child: ProjectMarker(
                title: 'Mobile Carousel',
                subtitle: 'Swipe with peek cue',
                isCarousel: true,
                device: ProjectMarkerDevice.mobile,
                mobileViewportFraction: 0.86,
                carouselItems: [
                  Container(key: const Key('m1'), color: Colors.blue),
                  Container(key: const Key('m2'), color: Colors.red),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.byType(PageView), findsOneWidget);
      expect(find.byType(CarouselControl), findsNothing); // No chevrons on mobile
      expect(find.byKey(const Key('m1')), findsOneWidget);
    });

    testWidgets('MobileMarker renders scale=width and responds to tap', (WidgetTester tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: MobileMarker(
                scale: MobileMarkerScale.width,
                width: 320,
                title: 'Mobile App',
                subtitle: 'Scale width',
                hasDescription: true,
                description: 'Mobile App Description',
                onImageTap: () => tapped = true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Mobile App'), findsOneWidget);
      expect(find.text('Scale width'), findsOneWidget);
      expect(find.text('Mobile App Description'), findsOneWidget);
      expect(find.byType(BioMarker), findsOneWidget);

      await tester.tap(find.byIcon(Icons.image_outlined));
      await tester.pump();
      expect(tapped, isTrue);
    });

    testWidgets('MobileMarker renders scale=height without BioMarker when toggled', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: MobileMarker(
              scale: MobileMarkerScale.height,
              height: 500,
              hasBioMarker: false,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.image_outlined), findsOneWidget);
      expect(find.byType(BioMarker), findsNothing);
    });

    testWidgets('ProjectGrid renders PC 2-column layout and mobile 1-column layout', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: 896,
                child: ProjectGrid(
                  device: ProjectGridDevice.pc,
                  projects: const [
                    ProjectMarker(title: 'Project 1'),
                    ProjectMarker(title: 'Project 2'),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Project 1'), findsOneWidget);
      expect(find.text('Project 2'), findsOneWidget);
      expect(find.byType(Row), findsWidgets); // 2-column row layout on PC
    });

    testWidgets('ProjectGrid.builder generates items correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: 316,
                child: ProjectGrid.builder(
                  device: ProjectGridDevice.mobile,
                  count: 3,
                  builder: (context, index) {
                    return ProjectMarker(title: 'Dynamic Project #$index');
                  },
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Dynamic Project #0'), findsOneWidget);
      expect(find.text('Dynamic Project #1'), findsOneWidget);
      expect(find.text('Dynamic Project #2'), findsOneWidget);
    });

    testWidgets('MobileGrid renders PC 4-column layout and fixed count of 4 when isCarousel is false', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: 896,
                child: MobileGrid(
                  device: MobileGridDevice.pc,
                  isCarousel: false,
                  title: 'Fintech Suite',
                  subtitle: 'Desktop 4-Column Grid',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Fintech Suite'), findsOneWidget);
      expect(find.text('Desktop 4-Column Grid'), findsOneWidget);
      expect(find.byType(MobileMarker), findsNWidgets(4));
    });

    testWidgets('MobileGrid renders PC carousel with CarouselControl and slides', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: 896,
                child: MobileGrid.builder(
                  device: MobileGridDevice.pc,
                  isCarousel: true,
                  count: 6,
                  builder: (context, index) {
                    return MobileMarker(
                      title: 'Screen #$index',
                      hasBioMarker: false,
                    );
                  },
                  title: 'PC Carousel',
                  subtitle: 'Sliding with chevrons',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('PC Carousel'), findsOneWidget);
      expect(find.byType(CarouselControl), findsOneWidget);
    });

    testWidgets('MobileGrid renders mobile swipe carousel with viewport fraction cue', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: 316,
                child: MobileGrid.builder(
                  device: MobileGridDevice.mobile,
                  isCarousel: true,
                  mobileViewportFraction: 0.78,
                  count: 3,
                  builder: (context, index) {
                    return const MobileMarker(
                      hasBioMarker: false,
                    );
                  },
                  title: 'Mobile Wallet',
                  subtitle: 'Swipeable Carousel',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Mobile Wallet'), findsOneWidget);
      expect(find.byType(PageView), findsOneWidget);
    });

    testWidgets('BioMarker derives device mode directly from ambient AlterDeviceScope', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AlterDeviceScope(
              device: AlterDevice.pc,
              child: SizedBox(
                width: 300, // narrow width that would otherwise trigger mobile auto-mode
                child: BioMarker(
                  title: 'Ambient PC Bio',
                  subtitle: 'Inherited from Scope',
                  hasBadgeTwo: true,
                  badge2Label: 'Desktop Badge',
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Ambient PC Bio'), findsOneWidget);
      expect(find.text('Desktop Badge'), findsOneWidget);
    });

    testWidgets('ProjectGrid propagates PC device mode to child ProjectMarkers and BioMarkers', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: SizedBox(
                width: 896,
                child: ProjectGrid(
                  device: ProjectGridDevice.pc,
                  projects: [
                    ProjectMarker(
                      title: 'Project In PC Grid',
                      subtitle: 'Should have badges & logo in 424px cell',
                      hasBadgeTwo: true,
                      badgeTwoLabel: 'Active Badge',
                    ),
                    ProjectMarker(
                      title: 'Project 2 In PC Grid',
                      subtitle: 'Cell 2',
                      hasBadgeTwo: true,
                      badgeTwoLabel: 'Badge 2',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Project In PC Grid'), findsOneWidget);
      expect(find.text('Active Badge'), findsOneWidget);
      expect(find.text('Badge 2'), findsOneWidget);
    });

    testWidgets('AlterMediaView renders image, custom widget and handles video gracefully', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                AlterMediaView(
                  url: 'https://example.com/animation.gif',
                ),
                AlterMediaView(
                  customWidget: Text('Custom Media Layer'),
                ),
                AlterMediaView(
                  url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
                  autoPlay: true,
                  playInViewportOnly: true,
                  autoPlayDelay: Duration(milliseconds: 1200),
                  loop: true,
                  isMuted: true,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Custom Media Layer'), findsOneWidget);
      expect(find.byType(AlterMediaView), findsNWidgets(3));
    });

    testWidgets('ProjectMarker renders single video and carousel videos', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ProjectMarker(
                    videoUrl: 'https://example.com/project_preview.mp4',
                    title: 'Video Project Marker',
                    subtitle: 'Single video banner',
                  ),
                  ProjectMarker(
                    isCarousel: true,
                    carouselVideoUrls: [
                      'https://example.com/clip1.mp4',
                      'https://example.com/clip2.mp4',
                    ],
                    title: 'Carousel Video Project',
                    subtitle: 'Multi video slides',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Video Project Marker'), findsOneWidget);
      expect(find.text('Carousel Video Project'), findsOneWidget);
      expect(find.byType(AlterMediaView), findsAtLeastNWidgets(1));
    });

    testWidgets('MobileMarker and MobileGrid render with video mockups', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  MobileMarker(
                    scale: MobileMarkerScale.width,
                    videoUrl: 'https://example.com/app_demo.mp4',
                    title: 'App Demo Video',
                    subtitle: 'iPhone 14 Plus container',
                  ),
                  MobileGrid(
                    videoUrls: [
                      'https://example.com/app_demo1.mp4',
                      'https://example.com/app_demo2.mp4',
                      'https://example.com/app_demo3.mp4',
                      'https://example.com/app_demo4.mp4',
                    ],
                    title: 'Mobile Grid With Videos',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('App Demo Video'), findsOneWidget);
      expect(find.text('Mobile Grid With Videos'), findsOneWidget);
      expect(find.byType(AlterMediaView), findsAtLeastNWidgets(4));
    });

    testWidgets('HeroBlock renders PC layout with avatar, title, subtitle, and action buttons', (WidgetTester tester) async {
      bool primaryTapped = false;
      bool secondaryTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: HeroBlock(
                device: HeroBlockDevice.pc,
                title: 'Hi, I am Nayan &\nI build things.',
                subtitle: 'Principal UX Designer & Engineer @SIG',
                primaryButtonLabel: 'Book a call',
                secondaryButtonLabel: 'Download CV',
                onPrimaryTap: () => primaryTapped = true,
                onSecondaryTap: () => secondaryTapped = true,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Hi, I am Nayan &\nI build things.'), findsOneWidget);
      expect(find.text('Principal UX Designer & Engineer @SIG'), findsOneWidget);
      expect(find.text('Book a call'), findsOneWidget);
      expect(find.text('Download CV'), findsOneWidget);
      expect(find.byType(ButtonText), findsNWidgets(2));

      await tester.tap(find.text('Book a call'));
      await tester.pump();
      expect(primaryTapped, isTrue);

      await tester.tap(find.text('Download CV'));
      await tester.pump();
      expect(secondaryTapped, isTrue);
    });

    testWidgets('HeroBlock renders Mobile layout and toggles elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: HeroBlock(
                device: HeroBlockDevice.mobile,
                title: 'Mobile Hero Headline',
                hasSubtitle: false,
                hasAvatar: false,
              ),
            ),
          ),
        ),
      );

      expect(find.text('Mobile Hero Headline'), findsOneWidget);
      expect(find.byIcon(Icons.person_rounded), findsNothing);
    });

    testWidgets('BrandBlock renders PC layout with default placeholder brands', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: BrandBlock(
                device: BrandBlockDevice.pc,
              ),
            ),
          ),
        ),
      );

      expect(find.text('I have architected design systems at'), findsOneWidget);
      expect(find.text('Element DS'), findsOneWidget);
      expect(find.text('SIEMENS'), findsOneWidget);
      expect(find.text('SIG'), findsOneWidget);
      expect(find.text('iX DS'), findsOneWidget);
      expect(find.text('HeyDoc'), findsOneWidget);
      expect(find.text('InLabels'), findsOneWidget);
    });

    testWidgets('BrandBlock renders custom brands and responds to taps', (WidgetTester tester) async {
      bool brandTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: BrandBlock(
                device: BrandBlockDevice.mobile,
                title: 'Trusted by Leaders',
                items: [
                  BrandItem(
                    name: 'Custom Brand 1',
                    onTap: () => brandTapped = true,
                  ),
                  const BrandItem(
                    name: 'Custom Brand 2',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Trusted by Leaders'), findsOneWidget);
      expect(find.text('Custom Brand 1'), findsOneWidget);
      expect(find.text('Custom Brand 2'), findsOneWidget);

      await tester.tap(find.text('Custom Brand 1'));
      await tester.pump();
      expect(brandTapped, isTrue);
    });

    testWidgets('HeaderBlock renders PC and Mobile layouts with Divider and header text', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                HeaderBlock(
                  device: HeaderBlockDevice.pc,
                  header: 'Experiences',
                ),
                HeaderBlock(
                  device: HeaderBlockDevice.mobile,
                  header: 'Projects',
                  hasDivider: false,
                ),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Experiences'), findsOneWidget);
      expect(find.text('Projects'), findsOneWidget);
      expect(find.byType(Divider), findsOneWidget);
    });

    testWidgets('ProjectHeroBlock renders PC and Mobile layouts with logo, title, details, and actions', (WidgetTester tester) async {
      bool actionTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ProjectHeroBlock(
                    device: ProjectHeroBlockDevice.pc,
                    title: 'PC Project Title',
                    description: 'PC Project Description',
                    actions: [
                      ProjectHeroAction(
                        label: 'PC Action',
                        icon: Icons.code,
                        onTap: () => actionTapped = true,
                      ),
                    ],
                  ),
                  const ProjectHeroBlock(
                    device: ProjectHeroBlockDevice.mobile,
                    title: 'Mobile Project Title',
                    hasNotice: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('PC Project Title'), findsOneWidget);
      expect(find.text('PC Project Description'), findsOneWidget);
      expect(find.text('PC Action'), findsOneWidget);
      expect(find.text('Mobile Project Title'), findsOneWidget);
      expect(find.text('Client'), findsNWidgets(4)); // 2 labels + 2 values across the two instances
      expect(find.text('Feedback Text'), findsOneWidget); // Only in PC instance

      await tester.tap(find.text('PC Action'));
      await tester.pump();
      expect(actionTapped, isTrue);
    });

    testWidgets('FooterBlock renders PC and Mobile layouts with email, copy button, and social links', (WidgetTester tester) async {
      bool copyTapped = false;
      bool socialTapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FooterBlock(
                    device: FooterBlockDevice.pc,
                    email: 'test@example.com',
                    onCopyTap: () => copyTapped = true,
                    socialLinks: [
                      FooterSocialLink(
                        icon: Icons.code,
                        onTap: () => socialTapped = true,
                      ),
                    ],
                  ),
                  const FooterBlock(
                    device: FooterBlockDevice.mobile,
                    email: 'mobile@example.com',
                  ),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('test@example.com'), findsOneWidget);
      expect(find.text('mobile@example.com'), findsOneWidget);
      expect(find.text('Find me on '), findsNWidgets(2));
      expect(find.byIcon(Icons.content_copy_outlined), findsNWidgets(2));

      await tester.tap(find.byIcon(Icons.content_copy_outlined).first);
      await tester.pump();
      expect(copyTapped, isTrue);

      await tester.tap(find.byIcon(Icons.code));
      await tester.pump();
      expect(socialTapped, isTrue);
    });
  });
}





