import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

void main() {
  group('BasicTextField Widget Test', () {
    testWidgets('renders outlined text field with label and hint', (
      tester,
    ) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextField.outlined(
              field: 'username',
              controller: controller,
              labelText: 'Username',
              hintText: 'Enter your username',
            ),
          ),
        ),
      );

      expect(find.text('Username'), findsOneWidget);
      expect(find.text('Enter your username'), findsOneWidget);
    });

    testWidgets('renders underline text field', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextField.underline(
              field: 'email',
              controller: controller,
              labelText: 'Email',
              hintText: 'Enter email',
            ),
          ),
        ),
      );

      expect(find.text('Email'), findsOneWidget);
      expect(find.text('Enter email'), findsOneWidget);
    });

    testWidgets('obscureText toggle works (password field)', (tester) async {
      final controller = TextEditingController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicTextField.outlined(
              field: 'password',
              controller: controller,
              labelText: 'Password',
              obscureText: true,
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.visibility_off), findsOneWidget);

      // Tap visibility icon
      await tester.tap(find.byIcon(Icons.visibility_off));
      await tester.pump();

      // Now it should show the opposite icon
      expect(find.byIcon(Icons.visibility), findsOneWidget);
    });

    testWidgets('shows validation error message when provided', (tester) async {
      final controller = TextEditingController();

      ValidationUIError? error = ValidationUIError(
        code: 'VALIDATION_ERROR',
        message: 'Bad Request',
        errors: [ValidatorField(fieldName: 'email', message: 'Invalid email')],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    BasicTextField.outlined(
                      field: 'email',
                      controller: controller,
                      labelText: 'Email',
                      validationUIError: error,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Trigger update
                        setState(() {
                          error = ValidationUIError(
                            code: 'VALIDATION_ERROR',
                            message: 'Bad Request',
                            errors: [
                              ValidatorField(
                                fieldName: 'email',
                                message: 'Invalid email',
                              ),
                            ],
                          );
                        });
                      },
                      child: const Text('Trigger Error'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      // Trigger error state
      await tester.tap(find.text('Trigger Error'));
      await tester.pumpAndSettle();

      expect(find.text('Invalid email'), findsOneWidget);
    });

    testWidgets('clears validation error after typing', (tester) async {
      final controller = TextEditingController();
      ValidationUIError? error;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  children: [
                    BasicTextField.outlined(
                      field: 'email',
                      controller: controller,
                      labelText: 'Email',
                      validationUIError: error,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          error = ValidationUIError(
                            code: 'VALIDATION_ERROR',
                            message: 'Required',
                            errors: [
                              ValidatorField(
                                fieldName: 'email',
                                message: 'Required',
                              ),
                            ],
                          );
                        });
                      },
                      child: const Text('Trigger Error'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );

      // Trigger munculnya error
      await tester.tap(find.text('Trigger Error'));
      await tester.pumpAndSettle();

      // Pastikan error "Required" muncul
      expect(find.text('Required'), findsOneWidget);

      // Simulasikan user mengetik sesuatu
      await tester.enterText(find.byType(TextFormField), 'test');
      await tester.pumpAndSettle();

      // Error harus hilang
      expect(find.text('Required'), findsNothing);
    });
  });
}
