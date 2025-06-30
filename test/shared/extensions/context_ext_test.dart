import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

void main() {
  group('ContextExtension', () {
    testWidgets('should access l10n (AppLocalizations) correctly', (
      tester,
    ) async {
      late BuildContext testContext;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Builder(
            builder: (context) {
              testContext = context;
              return const Scaffold(body: Text('Test'));
            },
          ),
        ),
      );

      final localizations = testContext.l10n;

      expect(localizations, isA<AppLocalizations>());
      expect(localizations.home, isNotEmpty); // or another existing key
    });

    testWidgets('should throw when AppLocalizations not found', (tester) async {
      late BuildContext testContext;

      await tester.pumpWidget(
        Builder(
          builder: (context) {
            testContext = context;
            return const Directionality(
              textDirection: TextDirection.ltr,
              child: Text('Test'),
            );
          },
        ),
      );

      expect(() => testContext.l10n, throwsA(isA<Exception>()));
    });

    testWidgets('showError displays MessageUIError via showToastError', (
      tester,
    ) async {
      const testErrorMessage = 'Test error';

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: Scaffold(
            body: Builder(
              builder: (context) {
                // ACT
                Future.microtask(() {
                  context.showError(
                    MessageUIError(
                      code: 'test_error',
                      message: testErrorMessage,
                    ),
                  );
                });
                return const SizedBox();
              },
            ),
          ),
        ),
      );

      await tester.pump(); // allow Snackbar to be shown

      // ASSERT
      expect(find.text(testErrorMessage), findsOneWidget);
    });
  });
}
