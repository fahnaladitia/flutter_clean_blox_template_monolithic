import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // Ganti sesuai lokasi file extension

void main() {
  group('ToasterExt', () {
    testWidgets('showToastSuccess displays green SnackBar with check icon', (
      tester,
    ) async {
      const message = 'Success Message';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                // Solusi: panggil setelah frame selesai
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.showToastSuccess(message);
                });
                return const Scaffold();
              },
            ),
          ),
        ),
      );

      await tester.pump(); // Render SnackBar

      final snackBar = find.byType(SnackBar);
      expect(snackBar, findsOneWidget);
      expect(find.text(message), findsOneWidget);
      final snack = tester.widget<SnackBar>(snackBar);
      expect(snack.backgroundColor, Colors.green);
    });

    testWidgets('showToastError displays red SnackBar with error icon', (
      tester,
    ) async {
      const message = 'Error Message';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                // Solusi: panggil setelah frame selesai
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.showToastError(message);
                });
                return const Scaffold();
              },
            ),
          ),
        ),
      );

      await tester.pump();

      final snackBar = find.byType(SnackBar);
      expect(snackBar, findsOneWidget);
      expect(find.text(message), findsOneWidget);
      final snack = tester.widget<SnackBar>(snackBar);
      expect(snack.backgroundColor, Colors.red);
    });

    testWidgets('showToastInfo displays blue SnackBar with info icon', (
      tester,
    ) async {
      const message = 'Info Message';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                // Solusi: panggil setelah frame selesai
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.showToastInfo(message);
                });
                return const Scaffold();
              },
            ),
          ),
        ),
      );

      await tester.pump();

      final snackBar = find.byType(SnackBar);
      expect(snackBar, findsOneWidget);
      expect(find.text(message), findsOneWidget);
      final snack = tester.widget<SnackBar>(snackBar);
      expect(snack.backgroundColor, Colors.blue);
    });

    testWidgets('showToastWarning displays orange SnackBar with warning icon', (
      tester,
    ) async {
      const message = 'Warning Message';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                // Solusi: panggil setelah frame selesai
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.showToastWarning(message);
                });
                return const Scaffold();
              },
            ),
          ),
        ),
      );

      await tester.pump();

      final snackBar = find.byType(SnackBar);
      expect(snackBar, findsOneWidget);
      expect(find.text(message), findsOneWidget);
      final snack = tester.widget<SnackBar>(snackBar);
      expect(snack.backgroundColor, Colors.orange);
    });

    testWidgets('showToasterErrorValidator displays field and message', (
      tester,
    ) async {
      const field = 'Email';
      const message = 'is invalid';

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                // Solusi: panggil setelah frame selesai
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.showToasterErrorValidator(
                    field: field,
                    message: message,
                  );
                });
                return const Scaffold();
              },
            ),
          ),
        ),
      );

      await tester.pump();

      final snackBar = find.byType(SnackBar);
      expect(snackBar, findsOneWidget);
      expect(find.text('$field: $message'), findsOneWidget);
    });
  });
}
