import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:frontend/main.dart'; // Adjust the import path if needed

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyFamilyConnectApp());

    // Verify that the initial text is not '0'.
    expect(find.text('0'), findsNothing);

    // Verify that our counter starts at '1'.
    expect(find.text('1'), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('1'), findsNothing);
    expect(find.text('2'), findsOneWidget);
  });
}
