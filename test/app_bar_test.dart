// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fproject_layout/app/modules/my_app.dart';

void main() {
  setUpAll(() async {});

  setUp(() async {
    // ignore: unused_local_variable
    final WidgetsBinding binding =
        TestWidgetsFlutterBinding.ensureInitialized();
  });

  tearDownAll(() async {});

  tearDown(() async {
    // Code that clears caches can go here
  });

  group('appbar test', () {
    testWidgets("title should be FProject Layout", (tester) async {
      await tester.pumpWidget(MyApp());
      find.ancestor(of: find.byType(AppBar), matching: find.text("FProject Layout"));
    });
  });
}
