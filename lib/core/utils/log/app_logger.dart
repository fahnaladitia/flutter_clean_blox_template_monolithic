part of '../utils.dart';

class AppLogger {
  AppLogger._();
  static final Logger logger = Logger("AppLogger");

  static Future<void> init() async {
    // only enable logging for debug mode
    if (kDebugMode) {
      Logger.root.level = Level.ALL;
    } else {
      Logger.root.level = Level.OFF;
    }
    hierarchicalLoggingEnabled = true;

    Logger.root.onRecord.listen((record) {
      if (!kDebugMode) {
        return;
      }

      var start = '\x1b[90m';
      const end = '\x1b[0m';
      // const white = '\x1b[37m';

      switch (record.level.name) {
        case 'INFO':
          start = '\x1b[92m';
          break;
        case 'WARNING':
          start = '\x1b[93m';
          break;
        case 'SEVERE':
          start = '\x1b[103m\x1b[31m';
          break;
        case 'SHOUT':
          start = '\x1b[41m\x1b[93m';
          break;
      }

      final message = '$end$start${record.message}$end';
      developer.log(
        message,
        // name: record.loggerName.padRight(25),
        level: record.level.value,
      );
    });

    AppLogger.info('AppLogger initialized successfully.');
  }

  // static void info(String msg) => logger.i(msg);
  // static void warn(String msg) => logger.w(msg);
  // static void error(String msg, [dynamic error, StackTrace? stack]) =>
  //     logger.e(msg, error: error, stackTrace: stack);
  // static void shout(String msg) => logger.f(msg);

  static void info(String msg) => logger.info(msg);
  static void warn(String msg) => logger.warning(msg);
  static void error(String msg, [dynamic error, StackTrace? stack]) =>
      logger.severe(msg, error, stack);
  static void shout(String msg) => logger.shout(msg);
}
