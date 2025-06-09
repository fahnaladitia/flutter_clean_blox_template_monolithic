import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/app/router/route.dart';
import 'package:flutter_clean_blox_template/presentation/theme/theme.dart';
import 'package:flutter_clean_blox_template/presentation/theme/util.dart';
import 'package:flutter_clean_blox_template/l10n/app_localizations.dart';
import 'package:flutter_clean_blox_template/l10n/l10n.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = createTextTheme(context, "Roboto", "Roboto");
    final MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: "My App",
      debugShowCheckedModeBanner: kDebugMode,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: Platform.isAndroid ? AppRoute.splash : AppRoute.main,
      supportedLocales: L10n.all,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Set the default locale, you can change it based on user preference
      locale: const Locale('en'),
      darkTheme: theme.dark(),

      theme: theme.light(),
      navigatorObservers: [
        // Add any navigator observers if needed
        SentryNavigatorObserver(), // Sentry observer for navigation
      ],
    );
  }
}
