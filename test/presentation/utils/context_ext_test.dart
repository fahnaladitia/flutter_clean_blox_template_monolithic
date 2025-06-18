import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/utils/context_ext.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('ContextExtension provides screen and theme utilities', (
    tester,
  ) async {
    late BuildContext capturedContext;

    // Widget untuk menangkap BuildContext
    final testWidget = Builder(
      builder: (context) {
        capturedContext = context;
        return const MaterialApp(
          home: Scaffold(body: Text('Testing ContextExtension')),
        );
      },
    );

    await tester.pumpWidget(testWidget);

    expect(capturedContext.screenWidth, isNonZero);
    expect(capturedContext.screenHeight, isNonZero);

    expect(capturedContext.theme, isA<ThemeData>());
    expect(capturedContext.textTheme, isA<TextTheme>());
    expect(capturedContext.colorScheme, isA<ColorScheme>());
  });

  testWidgets('l10n throws if localization not found', (tester) async {
    late BuildContext context;

    await tester.pumpWidget(
      Builder(
        builder: (ctx) {
          context = ctx;
          return const Directionality(
            textDirection: TextDirection.ltr,
            child: Text('No l10n injected'),
          );
        },
      ),
    );

    expect(() => context.l10n, throwsException);
  });
}
