import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/app/router/route.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    final themeLight = MaterialTheme.light();
    final themeDark = MaterialTheme.dark();
    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      routerConfig: AppRoute.router,
      supportedLocales: L10n.all,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Set the default locale, you can change it based on user preference
      locale: const Locale('en'),
      theme: themeLight,
      darkTheme: themeDark,
    );
  }
}
