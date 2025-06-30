import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_clean_blox_template/features/auth/presentation/blocs/auth/auth_bloc.dart';
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

class MyAppAuth extends StatefulWidget {
  const MyAppAuth({super.key});

  @override
  State<MyAppAuth> createState() => _MyAppAuthState();
}

class _MyAppAuthState extends State<MyAppAuth> {
  late final AuthBloc _authBloc;
  @override
  void initState() {
    super.initState();
    FlutterNativeSplash.remove();

    _authBloc = sl.get<AuthBloc>();
    _authBloc.add(AuthCheckRequestedEvent());
  }

  @override
  Widget build(BuildContext context) {
    final themeLight = MaterialTheme.light();
    final themeDark = MaterialTheme.dark();
    return MaterialApp.router(
      debugShowCheckedModeBanner: kDebugMode,
      routerConfig: AppRoute.routerWithAuth,
      supportedLocales: L10n.all,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      // Set the default locale, you can change it based on user preference
      locale: const Locale('en'),
      theme: themeLight,
      darkTheme: themeDark,
    );
  }
}
