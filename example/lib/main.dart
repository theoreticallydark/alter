import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:alter/alter.dart';

import 'components/buttons/buttons_category.dart';
import 'components/inputs/inputs_category.dart';
import 'components/node/node_category.dart';
import 'components/pills/pills_category.dart';
import 'components/selects/selects_category.dart';
import 'components/status/status_category.dart';
import 'components/tabs/tabs_category.dart';
import 'components/utilities/utilities_category.dart';
import 'foundations/foundations_category.dart';
import 'mobile/application_header_mobile/application_header_mobile_category.dart';
import 'mobile/bottom_navigation/bottom_navigation_category.dart';
import 'sites/sites_category.dart';
import 'styles/styles_category.dart';
import 'web/application_header/application_header_category.dart';

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
        stylesCategory(),
        WidgetbookFolder(
          name: 'Components',
          children: [
            buttonsCategory(),
            inputsCategory(),
            nodeCategory(),
            pillsCategory(),
            selectsCategory(),
            statusCategory(),
            tabsCategory(),
            utilitiesCategory(),
          ],
        ),
        WidgetbookFolder(
          name: 'Mobile',
          children: [
            applicationHeaderMobileCategory(),
            bottomNavigationCategory(),
          ],
        ),
        WidgetbookFolder(
          name: 'Web',
          children: [
            applicationHeaderCategory(),
          ],
        ),
        sitesCategory(),
      ],
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: ThemeData(
                brightness: Brightness.light,
                fontFamily: 'packages/alter/Geist',
                scaffoldBackgroundColor: AlterSemanticTokens.baseWhite,
                // ignore: deprecated_member_use
                useMaterial3: true,
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
