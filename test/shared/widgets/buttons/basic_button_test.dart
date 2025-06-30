import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // Ganti sesuai path BasicButton

void main() {
  group('BasicButton Widget', () {
    testWidgets('renders ElevatedButton with active state', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: BasicButton.elevated(
            text: 'Elevated',
            onPressed: () => tapped = true,
          ),
        ),
      );

      expect(find.text('Elevated'), findsOneWidget);

      await tester.tap(find.byType(ElevatedButton));
      expect(tapped, isTrue);
    });

    testWidgets('renders FilledButton with icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: BasicButton.filled(
            text: 'Filled',
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      );

      expect(find.text('Filled'), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);
    });

    testWidgets(
      'renders OutlinedButton and is disabled when state is not active',
      (tester) async {
        await tester.pumpWidget(
          MaterialApp(
            home: BasicButton.outlined(
              text: 'Outlined',
              onPressed: () {},
              state: BasicButtonEventState.disabled,
            ),
          ),
        );

        final outlinedButton = tester.widget<OutlinedButton>(
          find.byType(OutlinedButton),
        );
        expect(outlinedButton.onPressed, isNull);
      },
    );

    testWidgets('renders TextButton and reacts to tap', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: BasicButton.text(
            text: 'TextButton',
            onPressed: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.byType(TextButton));
      expect(tapped, isTrue);
    });

    testWidgets('renders loading state disables all buttons', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Column(
            children: [
              BasicButton.elevated(
                text: 'Elevated Loading',
                state: BasicButtonEventState.loading,
                onPressed: () {},
              ),
              BasicButton.filled(
                text: 'Filled Loading',
                state: BasicButtonEventState.loading,
                onPressed: () {},
              ),
              BasicButton.outlined(
                text: 'Outlined Loading',
                state: BasicButtonEventState.loading,
                onPressed: () {},
              ),
              BasicButton.text(
                text: 'Text Loading',
                state: BasicButtonEventState.loading,
                onPressed: () {},
              ),
            ],
          ),
        ),
      );

      // const CircularProgressIndicator harus muncul
      expect(
        find.byType(CircularProgressIndicator),
        findsNWidgets(4), // Semua button harus menampilkan indikator loading
      ); // text tidak berubah
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.byType(FilledButton), findsOneWidget);
      expect(find.byType(OutlinedButton), findsOneWidget);
      expect(find.byType(TextButton), findsOneWidget);
    });

    testWidgets('renders full width properly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BasicButton.elevated(
              text: 'Full Width',
              onPressed: () {},
              isFullWidth: true,
            ),
          ),
        ),
      );

      final elevatedButton = tester.widget<ElevatedButton>(
        find.byType(ElevatedButton),
      );
      final constraints = elevatedButton.style?.minimumSize?.resolve({});

      expect(constraints?.width, double.infinity);
    });
  });
}
