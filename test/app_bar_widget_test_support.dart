// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fproject_layout/app/modules/my_app.dart';
import 'package:given_when_then/given_when_then.dart';

Future<void> Function(WidgetTester) harness(
    // ignore: prefer-trailing-comma
    WidgetTestHarnessCallback<_WidgetTestHarness> callback) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension AppBarGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> myAppExists() async {
    await tester.pumpWidget(MyApp());
  }
}

extension AppBarWhen on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> appBarFound() async {
    await tester.pump();
    expect(find.byType(AppBar), findsOneWidget);
  }
}

extension ExampleThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> appBarTitleIs() async {
    await tester.pump();
    expect(find.text('FProject Layout'), findsOneWidget);
  }
}
