// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fproject_layout/app/screens/myhomepage/managers/my_home_page.dart';
import 'package:given_when_then/given_when_then.dart';

String myTitle = "FProject Layout";

Future<void> Function(WidgetTester) harness(
    WidgetTestHarnessCallback<_WidgetTestHarness> callback) {
  return (tester) =>
      givenWhenThenWidgetTest(_WidgetTestHarness(tester), callback);
}

class _WidgetTestHarness extends WidgetTestHarness {
  _WidgetTestHarness(WidgetTester tester) : super(tester);
}

extension AddButtonGiven on WidgetTestGiven<_WidgetTestHarness> {
  Future<void> haveMyHomePage() async {
    await tester.pumpWidget(MyHomePage(title: myTitle,));
  }
}

extension AddButtonWhen on WidgetTestWhen<_WidgetTestHarness> {
  Future<void> userPerformsTapAdd() async {
    await tester.tap(find.byIcon(Icons.add));
  }
}

extension AddButtonThen on WidgetTestThen<_WidgetTestHarness> {
  Future<void> makeSureCounterReadsOne() async {
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  }
}