// Copyright 2021 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
import 'package:flutter/src/widgets/binding.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fproject_layout/app/data/models/counter_mixin.dart';
import 'package:fproject_layout/app/modules/my_app.dart';
import 'package:fproject_layout/app/screens/myhomepage/managers/my_home_page.dart';

import 'package:fproject_layout/app/screens/myhomepage/statecontainers/my_home_page_state.dart';

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

  group('Counter', () {

    setUp( () async {
        // For example, each test could start at the FooHomePage
      
       
   });


    
    tearDownAll(() async {});

    tearDown(() async {});

    testWidgets('value should start at 0', (tester) async {
      await tester.pumpWidget(MyApp());
      expect(CounterMixin().myCounter, 0);
    });

    
  });
}
