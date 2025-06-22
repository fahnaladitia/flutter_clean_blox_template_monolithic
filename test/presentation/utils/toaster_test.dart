import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/presentation/utils/toaster.dart';

void main() {
  testWidgets('showToastSuccess shows success snackbar', (
    WidgetTester tester,
  ) async {
    // Widget dasar dengan Scaffold agar context bisa memanggil ScaffoldMessenger
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () => context.showToastSuccess('Success Message'),
                  child: const Text('Show Toast'),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Tekan tombol
    await tester.tap(find.text('Show Toast'));
    await tester.pump(); // render pertama
    await tester.pump(const Duration(seconds: 1)); // biar SnackBar muncul

    // Verifikasi isi SnackBar
    expect(find.text('Success Message'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  testWidgets('showToastError shows error snackbar', (
    WidgetTester tester,
  ) async {
    // Widget dasar dengan Scaffold agar context bisa memanggil ScaffoldMessenger
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () => context.showToastError('Error Message'),
                  child: const Text('Show Toast'),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Tekan tombol
    await tester.tap(find.text('Show Toast'));
    await tester.pump(); // render pertama
    await tester.pump(const Duration(seconds: 1)); // biar SnackBar muncul

    // Verifikasi isi SnackBar
    expect(find.text('Error Message'), findsOneWidget);
    expect(find.byIcon(Icons.error), findsOneWidget);
  });

  testWidgets('showToastInfo shows info snackbar', (WidgetTester tester) async {
    // Widget dasar dengan Scaffold agar context bisa memanggil ScaffoldMessenger
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () => context.showToastInfo('Info Message'),
                  child: const Text('Show Toast'),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Tekan tombol
    await tester.tap(find.text('Show Toast'));
    await tester.pump(); // render pertama
    await tester.pump(const Duration(seconds: 1)); // biar SnackBar muncul

    // Verifikasi isi SnackBar
    expect(find.text('Info Message'), findsOneWidget);
    expect(find.byIcon(Icons.info), findsOneWidget);
  });

  testWidgets('showToastWarning shows warning snackbar', (
    WidgetTester tester,
  ) async {
    // Widget dasar dengan Scaffold agar context bisa memanggil ScaffoldMessenger
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () => context.showToastWarning('Warning Message'),
                  child: const Text('Show Toast'),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Tekan tombol
    await tester.tap(find.text('Show Toast'));
    await tester.pump(); // render pertama
    await tester.pump(const Duration(seconds: 1)); // biar SnackBar muncul

    // Verifikasi isi SnackBar
    expect(find.text('Warning Message'), findsOneWidget);
    expect(find.byIcon(Icons.warning), findsOneWidget);
  });

  testWidgets('showToasterErrorValidator shows validator error snackbar', (
    WidgetTester tester,
  ) async {
    // Widget dasar dengan Scaffold agar context bisa memanggil ScaffoldMessenger
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            return Scaffold(
              body: Center(
                child: ElevatedButton(
                  onPressed: () => context.showToasterErrorValidator(
                    field: 'email',
                    message: 'Invalid email format',
                  ),
                  child: const Text('Show Validator Error'),
                ),
              ),
            );
          },
        ),
      ),
    );

    // Tekan tombol
    await tester.tap(find.text('Show Validator Error'));
    await tester.pump(); // render pertama
    await tester.pump(const Duration(seconds: 1)); // biar SnackBar muncul

    // Verifikasi isi SnackBar
    expect(find.text('email: Invalid email format'), findsOneWidget);
    expect(find.byIcon(Icons.error), findsOneWidget);
  });
}
