import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sport_store_app/screens/home_page.dart';

void main() {
  testWidgets('Widget Test Example', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: HomePage(),  // Ganti dengan widget yang ingin Anda uji
    ));

    // Expect to find a widget with text 'View Product' (example from previous code)
    expect(find.text('View Product'), findsOneWidget);

    // Tap the button with text 'View Product' and trigger a frame.
    await tester.tap(find.text('View Product'));
    await tester.pump();

    // Expect to find a widget with text 'Example Product' on the ProductPage
    expect(find.text('Example Product'), findsOneWidget);
  });
}
