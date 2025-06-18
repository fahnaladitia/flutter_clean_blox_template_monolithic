import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BasicButton', () {
    testWidgets('displays primary button with text', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BasicButton.primary(text: 'Submit', onPressed: null),
          ),
        ),
      );

      expect(find.text('Submit'), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
    });

    testWidgets('invokes callback when pressed', (WidgetTester tester) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicButton.primary(
              text: 'Click Me',
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Click Me'));
      await tester.pump();

      expect(pressed, isTrue);
    });

    testWidgets('shows CircularProgressIndicator when loading', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BasicButton.primary(
              text: 'Loading',
              state: BasicButtonState.loading,
            ),
          ),
        ),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      expect(find.text('Loading'), findsNothing);
    });

    testWidgets('disables button when state is disabled', (
      WidgetTester tester,
    ) async {
      bool pressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicButton.primary(
              text: 'Disabled',
              state: BasicButtonState.disabled,
              onPressed: () {
                pressed = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.text('Disabled'));
      await tester.pump();

      expect(pressed, isFalse);
    });
  });
}
