part of '../utils.dart';

class SentryService {
  SentryService._();

  /// Init Sentry, panggil ini di main
  static Future<void> init({required FutureOr<void> Function()? app}) async {
    await SentryFlutter.init((options) {
      options.dsn = AppConfig.config.sentryDSN;

      options.tracesSampleRate = 1.0;
      options.sendDefaultPii = true;
      options.profilesSampleRate = 1.0;
    }, appRunner: app);
  }

  /// Capture error ke Sentry
  static Future<void> captureException(
    dynamic exception, {
    StackTrace? stackTrace,
    Hint? hint,
  }) async {
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
      hint: hint,
    );
  }

  /// Capture message (log) ke Sentry
  static Future<void> captureMessage(
    String message, {
    SentryLevel level = SentryLevel.info,
  }) async {
    await Sentry.captureMessage(message, level: level);
  }

  static SentryNavigatorObserver get navigatorObserver {
    return SentryNavigatorObserver();
  }
}
