// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fproject_layout/app/modules/my_app.dart';
import 'package:fproject_layout/app/screens/myhomepage/managers/my_home_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

String myTitle = "FProject Layout";
String myMessage = "You have pushed the button this many times:";
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Basic Golden Tests ', () {
    testWidgets('Golden test', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await expectLater(find.byType(MyApp), matchesGoldenFile('main.png'));
    });
    testGoldens('DeviceBuilder ', (tester) async {
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(devices: [
          Device.phone,
          Device.iphone11,
          Device.tabletPortrait,
          Device.tabletLandscape,
        ])
        ..addScenario(
          widget:  MyHomePage(
            title: myTitle,
            message: myMessage,
          ),
          name: 'default page',
        );
      await tester.pumpDeviceBuilder(builder);
      await screenMatchesGolden(tester, "demo page multiple screens");
    });
  });
}
