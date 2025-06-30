part of '../utils.dart';

final class ChuckerFlutterUtils {
  ChuckerFlutterUtils._();

  static void init() {
    // This method is intentionally left empty.
    // The actual implementation would depend on the specific requirements
    // and the context in which this utility is used.

    final AppFlavor appFlavor = AppConfig.flavor;
    if (appFlavor == AppFlavor.production) {
      // In production, we might not want to show the Chucker Flutter UI
      // or notifications, depending on the configuration.
      ChuckerFlutter.showOnRelease = false;
    } else {
      // In non-production environments, we can enable Chucker Flutter features.
      ChuckerFlutter.showOnRelease = true; // Show Chucker in debug mode
    }
  }

  static NavigatorObserver get navigatorObserver {
    return ChuckerFlutter.navigatorObserver;
  }

  static Interceptor get interceptor {
    return ChuckerDioInterceptor();
  }
}
