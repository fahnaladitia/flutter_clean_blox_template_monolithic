import 'package:flutter_clean_blox_template/app/di/injection.dart';
import 'package:flutter_clean_blox_template/core/core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

import 'package:flutter/material.dart';

import 'my_app.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize AppConfig with the staging configuration
  AppConfig.load(AppFlavor.production);

  // Running Cote Network Logger
  await CoteNetworkServerUtils.startServer();

  // Chucker Flutter
  ChuckerFlutterUtils.init();

  // Initialize dependency injection
  await Injection.init();

  BlocUtils.runSimpleBlocObserver();

  // Sentry initialization can be added here if needed
  // await SentryService.init(app: () => runApp(const MyApp()));

  runApp(MyApp());
}
