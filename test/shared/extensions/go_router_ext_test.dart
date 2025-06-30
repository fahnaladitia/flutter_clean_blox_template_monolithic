import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart' as shared;

void main() {
  testWidgets('goTo navigates to named route with parameters', (tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => const Scaffold(body: Text('Home')),
        ),
        GoRoute(
          name: 'profile',
          path: '/profile/:id',
          builder: (context, state) {
            final id = state.pathParameters['id'];
            return Scaffold(body: Text('Profile ID: $id'));
          },
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    // Ensure we're on home first
    expect(find.text('Home'), findsOneWidget);

    // Trigger navigation using the extension
    shared.GoRouterExtension(
      router.routerDelegate.navigatorKey.currentContext!,
    ).go(to: Uri(path: '/profile/123').toString());

    await tester.pumpAndSettle();

    // Verify the navigation result
    expect(find.text('Profile ID: 123'), findsOneWidget);
  });

  testWidgets('pushTo pushes named route with parameters', (tester) async {
    final router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          name: 'home',
          path: '/',
          builder: (context, state) => const Scaffold(body: Text('Home')),
        ),
        GoRoute(
          name: 'details',
          path: '/details/:item',
          builder: (context, state) {
            final item = state.pathParameters['item'];
            return Scaffold(body: Text('Detail: $item'));
          },
        ),
      ],
    );

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));

    expect(find.text('Home'), findsOneWidget);

    // Trigger pushTo
    shared.GoRouterExtension(
      router.routerDelegate.navigatorKey.currentContext!,
    ).push(to: Uri(path: '/details/flutter').toString());

    await tester.pumpAndSettle();

    expect(find.text('Detail: flutter'), findsOneWidget);
  });
}
