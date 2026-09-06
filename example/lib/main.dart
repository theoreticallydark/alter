import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';

import 'categories/buttons_category.dart';
import 'categories/display_category.dart';
import 'categories/foundations_category.dart';
import 'categories/inputs_category.dart';
import 'categories/navigation_category.dart';

void main() {
  runApp(const AlterWidgetbookApp());
}

class AlterWidgetbookApp extends StatelessWidget {
  const AlterWidgetbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: [
        foundationsCategory(),
        buttonsCategory(),
        navigationCategory(),
        inputsCategory(),
        displayCategory(),
      ],
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData(
                brightness: Brightness.light,
                fontFamily: AlterTypography.geistFont,
                scaffoldBackgroundColor: AlterSemanticTokens.baseWhite,
              ),
            ),
          ],
        ),
        // ignore: deprecated_member_use
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13,
            Devices.ios.iPad,
            Devices.android.samsungGalaxyS20,
          ],
        ),
        TextScaleAddon(
          min: 1.0,
          max: 2.0,
        ),
        InspectorAddon(),
      ],
    );
  }
}
