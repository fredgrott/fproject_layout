// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:fproject_layout/app/screens/myhomepage/managers/my_home_page.dart';
import 'package:golden_toolkit/golden_toolkit.dart';



// ignore: long-method
void main() {
   WidgetsFlutterBinding.ensureInitialized();
  testGoldens('DeviceBuilder - one scenario - default devices', (tester) async {
    final builder = DeviceBuilder()
      ..addScenario(
        widget: const MyHomePage(title:"FProject Layout",message: "You have pushed the button this many times:",),
        name: 'default page',
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(tester, 'my_home_page_single_scenario');
  });

  testGoldens('DeviceBuilder - one scenario - override devices',
          // ignore: prefer-trailing-comma
          (tester) async {
        final builder = DeviceBuilder()
          ..overrideDevicesForAllScenarios(devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape,
          ])
          ..addScenario(
            widget: const MyHomePage(title:"FProject Layout",message: "You have pushed the button this many times:",),
            name: 'default page',
          );

        await tester.pumpDeviceBuilder(builder);

        await screenMatchesGolden(
            // ignore: prefer-trailing-comma
            tester, "my_home_page_single_scenario_more_devices");
      });

  testGoldens('DeviceBuilder - multiple scenarios - with onCreate',
          // ignore: prefer-trailing-comma
          (tester) async {
        final builder = DeviceBuilder()
          // ignore: prefer-trailing-comma
          ..overrideDevicesForAllScenarios(devices: [
            Device.phone,
            Device.iphone11,
            Device.tabletPortrait,
            Device.tabletLandscape,
          ])
          ..addScenario(
            widget: const MyHomePage(title:"Fproject Layout",message: "You have pushed the button this many times:",),
            name: 'default page',
          )
          // ignore: prefer-trailing-comma
          ..addScenario(
            widget: const MyHomePage(title:"FProject Layout",message: "You have pushed the button this many times:",),
            name: 'tap once',
            onCreate: (scenarioWidgetKey) async {
              final finder = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byIcon(Icons.add),
              );
              expect(finder, findsOneWidget);
              await tester.tap(finder);
            },
          )
          ..addScenario(
            widget: const MyHomePage(title:"FProject Layout",message: "You have pushed the button this many times:",),
            name: 'tap five times',
            onCreate: (scenarioWidgetKey) async {
              final finder = find.descendant(
                of: find.byKey(scenarioWidgetKey),
                matching: find.byIcon(Icons.add),
              );
              expect(finder, findsOneWidget);

              await tester.tap(finder);
              await tester.tap(finder);
              await tester.tap(finder);
              await tester.tap(finder);
              await tester.tap(finder);
            },
          );

        await tester.pumpDeviceBuilder(builder);

        // ignore: prefer-trailing-comma
        await screenMatchesGolden(tester, 'my_home_page_multiple_scenarios');
      });
}

// our custom matcher
// ignore: unused_element
class _HasText extends CustomMatcher {
  _HasText(dynamic matcher) : super('Text data', 'data', matcher);

  @override
  String? featureValueOf(dynamic actual) {
    if (actual is Finder) {
      final element = actual.evaluate().single;
      final widget = element.widget;
      if (widget is Text) {
        return widget.data;
      } else {
        // ignore: avoid_escaping_inner_quotes
        throw Exception('_HasText matcher can\'t be applied to $element');
      }
    } else {
      throw Exception(
          '_HasText matcher can only be applied to a Finder object');
    }
  }
}