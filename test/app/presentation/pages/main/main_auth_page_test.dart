import 'package:flutter_clean_blox_template/app/presentation/pages/main/main_auth_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/di/auth_module.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/pages/account_page.dart';
import 'package:flutter_clean_blox_template/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_clean_blox_template/shared/l10n/app_localizations.dart';

class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUpAll(() async {
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

  group('MainAuthPage', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: const MainAuthPage(),
        ),
      );
      await tester.pumpAndSettle(); // biar semua UI selesai dirender

      expect(find.byType(MainAuthPage), findsOneWidget);

      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byType(HomePage), findsOneWidget);

      // Click on AccountPage
      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      expect(find.byType(AccountPage), findsOneWidget);

      expect(
        find.descendant(
          of: find.byType(BottomNavigationBar),
          matching: find.text('Home'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(BottomNavigationBar),
          matching: find.text('Account'),
        ),
        findsOneWidget,
      );
    });
  });
}
