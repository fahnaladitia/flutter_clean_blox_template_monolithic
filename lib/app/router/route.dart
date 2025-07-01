import 'package:flutter_clean_blox_template/app/presentation/pages/main/main_auth_page.dart';
import 'package:flutter_clean_blox_template/app/presentation/pages/splash/splash_page.dart';
import 'package:flutter_clean_blox_template/core/core.dart';

import 'package:flutter_clean_blox_template/app/presentation/pages/main/main_page.dart';
import 'package:flutter_clean_blox_template/app/presentation/pages/splash/splash_auth_page.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/pages/sign_in_page.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/pages/sign_up_page.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AppRoute {
  AppRoute._();

  /// Create and expose your router instance
  static final router = AppNavigation.router(
    initialLocation: '/splash',
    observers: [
      SentryService.navigatorObserver,
      ChuckerFlutterUtils.navigatorObserver,
    ],
    pages: [
      AppPage(
        path: "/",
        transitionType: AppPageTranstionType.none,
        builder: (context, state) => MainPage(),
      ),
      AppPage(path: "/splash", builder: (_, _) => const SplashPage()),
    ],
    errorBuilder: (context, state) => const MainPage(),
  );

  static final routerWithAuth = AppNavigation.router(
    initialLocation: '/splash',
    debugLogDiagnostics: true,
    observers: [
      SentryService.navigatorObserver,
      ChuckerFlutterUtils.navigatorObserver,
    ],
    pages: [
      AppPage(path: '/', builder: (context, state) => MainAuthPage()),
      AppPage(path: '/splash', builder: (_, __) => const SplashAuthPage()),
      AppPage(
        path: '/sign-in',
        transitionType: AppPageTranstionType.none,
        builder: (_, __) => SignInPage(),
      ),
      AppPage(path: '/sign-up', builder: (_, __) => const SignUpPage()),
    ],
    errorBuilder: (context, state) => const MainAuthPage(),
  );
}
