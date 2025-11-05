import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:unit_testing/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end app tests', () {
    testWidgets('tap on button, verify name and email dissappear', (
      tester,
    ) async {
      // Load the app
      await tester.pumpWidget(MainApp());

      // Verify that the text is visble
      expect(find.text('Mark'), findsOneWidget);
      expect(find.text('email@email.com'), findsOneWidget);

      // Find the button
      final buttonFinder = find.byType(ElevatedButton);

      // Tap on the button
      await tester.tap(buttonFinder);

      // Wait for rerenders
      await tester.pumpAndSettle();

      // Verify the text has disappeared
      expect(find.text('Mark'), findsNothing);
      expect(find.text('email@email.com'), findsNothing);
    });
  });
}
