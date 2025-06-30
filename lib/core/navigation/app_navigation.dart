part of 'navigation.dart';

class AppNavigation {
  AppNavigation._();

  static RouterConfig<RouteMatchList> router({
    required List<AppPage> pages,
    Codec<Object?, Object?>? extraCodec,
    void Function(BuildContext, GoRouterState, GoRouter)? onException,
    Page<dynamic> Function(BuildContext, GoRouterState)? errorPageBuilder,
    Widget Function(BuildContext, GoRouterState)? errorBuilder,
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
    Listenable? refreshListenable,
    int redirectLimit = 5,
    bool routerNeglect = false,
    String? initialLocation,
    bool overridePlatformDefaultLocation = false,
    Object? initialExtra,
    List<NavigatorObserver>? observers,
    bool debugLogDiagnostics = false,
    GlobalKey<NavigatorState>? navigatorKey,
    String? restorationScopeId,
    bool requestFocus = true,
  }) {
    return GoRouter(
      initialLocation: initialLocation,
      routes: pages,
      observers: observers ?? [],
      extraCodec: extraCodec,
      onException: onException,
      errorPageBuilder: errorPageBuilder,
      errorBuilder: errorBuilder,
      redirect: redirect,
      refreshListenable: refreshListenable,
      redirectLimit: redirectLimit,
      routerNeglect: routerNeglect,
      overridePlatformDefaultLocation: overridePlatformDefaultLocation,
      initialExtra: initialExtra,
      debugLogDiagnostics: debugLogDiagnostics,
      navigatorKey: navigatorKey,
      restorationScopeId: restorationScopeId,
      requestFocus: requestFocus,
    );
  }
}
