import 'package:flutter_clean_blox_template/app/presentation/pages/main/main_auth_page.dart';
import 'package:flutter_clean_blox_template/app/presentation/pages/splash/splash_auth_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/di/auth_module.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();

    await AuthModule().init();
    mockAuthBloc = MockAuthBloc();
    await sl.unregister<AuthBloc>();
    sl.registerSingleton<AuthBloc>(mockAuthBloc);

    // ✅ SET default state
    when(() => mockAuthBloc.state).thenReturn(AuthAuthenticatedState());

    // ✅ Optional: if your MainPage listens to Bloc stream
    whenListen(
      mockAuthBloc,
      Stream<AuthState>.fromIterable([AuthAuthenticatedState()]),
      initialState: AuthAuthenticatedState(),
    );
  });

  tearDownAll(() async {
    await sl.reset(dispose: true);
  });

  group('MainPage', () {
    testWidgets('SplashAuthPage shows splash image', (tester) async {
      final testRouter = AppNavigation.router(
        initialLocation: '/splash',
        observers: [
          SentryService.navigatorObserver,
          ChuckerFlutterUtils.navigatorObserver,
        ],
        pages: [
          AppPage(path: '/', builder: (context, state) => const MainAuthPage()),
          AppPage(
            path: '/splash',
            builder: (context, state) => const SplashAuthPage(),
          ),
          AppPage(
            path: '/sign-in',
            builder: (context, state) => const SignInPage(),
          ),

          AppPage(
            path: '/sign-up',
            builder: (context, state) => const SignUpPage(),
          ),
        ],
        errorBuilder: (context, state) => const MainAuthPage(),
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
