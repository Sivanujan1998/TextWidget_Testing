import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing_app/main.dart';

void main() {
  testWidgets('Print correct widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.byType(TextField), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Sivanujan');
    expect(find.text('Sivanujan'), findsOneWidget);

    expect(find.byType(RaisedButton), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    await tester.tap(find.text("Submit"));
    await tester.pump();
    expect(find.text("Sivanujan"), findsOneWidget);
    expect(find.text(null), findsNothing);

    expect(find.byType(Text), findsWidgets);
    expect(find.text('\nYour Text is: '), findsOneWidget);
  });
}
