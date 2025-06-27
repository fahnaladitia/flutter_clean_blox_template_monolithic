import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/presentation/widgets/basic_text_input.dart';

void main() {
  group('BasicTextInput Widget Test', () {
    testWidgets('renders label and hint text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BasicTextInput(
              labelText: 'Username',
              hintText: 'Enter your username',
            ),
          ),
        ),
      );

      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Enter your username'), findsOneWidget);
    });

    testWidgets('controller updates when user types', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextInput(
              labelText: 'Email',
              hintText: 'Enter email',
              controller: controller,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'pahnal@mail.com');
      expect(controller.text, 'pahnal@mail.com');
    });

    testWidgets('toggle password visibility icon', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: BasicTextInput(labelText: 'Password', obscureText: true),
          ),
        ),
      );

      // Default icon should be visibility
      expect(find.byIcon(Icons.visibility), findsOneWidget);

      // Tap to toggle visibility
      await tester.tap(find.byIcon(Icons.visibility));
      await tester.pump();

      // Icon should change to visibility_off
      expect(find.byIcon(Icons.visibility_off), findsOneWidget);
    });

    testWidgets('text field is read-only when readOnly is true', (
      tester,
    ) async {
      final controller = TextEditingController(text: 'cannot edit');

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextInput(readOnly: true, controller: controller),
          ),
        ),
      );

      await tester.enterText(find.byType(TextFormField), 'new text');
      // Text should remain unchanged
      expect(controller.text, 'cannot edit');
    });

    testWidgets(
      'can be created with keyboardType and textInputAction without error',
      (tester) async {
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: BasicTextInput(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
          ),
        );

        // Hanya pastikan widget tampil tanpa error
        expect(find.byType(BasicTextInput), findsOneWidget);
      },
    );
  });
}
