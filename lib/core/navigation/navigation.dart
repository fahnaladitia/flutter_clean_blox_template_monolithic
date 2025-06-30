import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'app_navigation.dart';
part 'app_page.dart';

CustomTransitionPage customTransitionPage({
  required GoRouterState state,
  required Widget child,
  Duration transitionDuration = const Duration(milliseconds: 300),
  required Widget Function(
    BuildContext,
    Animation<double>,
    Animation<double>,
    Widget,
  )
  transitionsBuilder,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: transitionsBuilder,
  );
}
