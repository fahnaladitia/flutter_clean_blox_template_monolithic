import 'dart:io';

import 'package:go_router/go_router.dart';

import 'package:flutter_clean_blox_template/presentation/pages/main/main_page.dart';
import 'package:flutter_clean_blox_template/presentation/pages/sign_in/sign_in_page.dart';
import 'package:flutter_clean_blox_template/presentation/pages/splash/splash_page.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AppRoute {
  AppRoute._();

  /// Define your route paths
  static const String mainPath = '/main';
  static const String signInPath = '/sign-in';
  static const String splashPath = '/splash';

  /// Define your route names
  static const String main = 'main';
  static const String signIn = 'sign-in';
  static const String splash = 'splash';

  /// Create and expose your router instance
  static final GoRouter router = GoRouter(
    initialLocation: Platform.isAndroid ? splash : main,
    observers: [
      SentryNavigatorObserver(),
      // Add any other observers if needed
    ],
    routes: [
      GoRoute(
        path: mainPath,
        name: main,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
        path: signInPath,
        name: signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: splashPath,
        name: splash,
        builder: (context, state) => const SplashPage(),
      ),
    ],
    errorBuilder: (context, state) => const MainPage(),
  );
}
