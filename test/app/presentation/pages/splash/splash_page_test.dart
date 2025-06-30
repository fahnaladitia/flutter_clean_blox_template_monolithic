import 'package:flutter_clean_blox_template/app/presentation/pages/main/main_page.dart';
import 'package:flutter_clean_blox_template/app/presentation/pages/splash/splash_page.dart';
import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

void main() {
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  tearDownAll(() async {
    await sl.reset(dispose: true);
  });

  group('MainPage', () {
    testWidgets('SplashPage shows splash image', (tester) async {
      final testRouter = AppNavigation.router(
        initialLocation: '/splash',
        observers: [
          SentryService.navigatorObserver,
          ChuckerFlutterUtils.navigatorObserver,
        ],
        pages: [
          AppPage(path: '/', builder: (context, state) => const MainPage()),
          AppPage(
            path: '/splash',
            builder: (context, state) => const SplashPage(),
          ),
        ],
        errorBuilder: (context, state) => const MainPage(),
      );

      await tester.pumpWidget(
        MaterialApp.router(
          routerConfig: testRouter,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );

      // Simulasi delay 1.5 detik dari Future.delayed()
      await tester.pump(const Duration(milliseconds: 1500));

      await tester.pump(); // Render widget

      expect(find.byKey(const Key('SplashImage')), findsOneWidget);
    });
  });
}
