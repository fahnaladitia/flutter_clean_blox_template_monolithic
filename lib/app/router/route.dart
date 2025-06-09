import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/pages/main/main_page.dart';
import 'package:flutter_clean_blox_template/presentation/pages/sign_in/sign_in_page.dart';
import 'package:flutter_clean_blox_template/presentation/pages/splash/splash_page.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class AppRoute {
  AppRoute._();

  /// Define your app's routes here.
  static const String main = '/';
  static const String signIn = '/sign-in';
  static const String splash = '/splash';

  /// Generates the route based on the settings.
  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,

      builder: (context) {
        switch (settings.name) {
          case main:
            return MainPage();
          case signIn:
            return SignInPage();
          case splash:
            return SplashPage();
          default:
            return MainPage();
        }
      },
    );
  }
}
