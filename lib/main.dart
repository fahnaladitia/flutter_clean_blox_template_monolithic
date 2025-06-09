import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:cote_network_logger/cote_network_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_blox_template/core/di/injection.dart';
import 'package:flutter_clean_blox_template/presentation/utils/simple_observer.dart';
// import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/my_app.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/fahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Running Cote Network Logger
  await startNetworkLogServer();

  // Chucker Flutter
  ChuckerFlutter.showOnRelease =
      kDebugMode; // Show Chucker only in debug mode, if you want to see it in release mode, set to true

  // Initialize dependency injection
  await Injection.init();

  Bloc.observer = SimpleBlocObserver(); // Set up a simple Bloc observer

  // Sentry initialization can be added here if needed
  // TODO : Uncomment and configure Sentry if you want to use it for error tracking
  // await SentryFlutter.init((options) {
  //   options.dsn = 'YOUR_DSN_HERE'; // Replace with your actual DSN

  //   options.tracesSampleRate = 1.0; // Adjust the sample rate as needed

  //   options.sendDefaultPii =
  //       true; // Send personally identifiable information (PII) if needed

  //   options.profilesSampleRate =
  //       1.0; // Adjust the profiles sample rate as needed
  // }, appRunner: () => runApp(const MyApp()));

  runApp(const MyApp());
}
