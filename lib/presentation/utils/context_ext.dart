import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/l10n/app_localizations.dart';
import 'package:flutter_clean_blox_template/presentation/utils/toaster.dart';
import 'package:flutter_clean_blox_template/presentation/utils/ui_error.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

/// Extension for BuildContext to provide easy access to common properties
/// such as screen size, theme, and navigation methods.
/// This extension simplifies the usage of MediaQuery, Theme, and Navigator
/// within the widget tree, allowing for cleaner and more readable code.
/// Example usage:
/// ```dart
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     final size = context.screenSize;
///     final theme = context.theme;
///     return Container(
///       width: size.width,
///       height: size.height,
///       color: theme.colorScheme.primary,
///       child: Text('Hello, World!',
///         style: theme.textTheme.headline4,
///       ),
///     );
///   }
/// }
/// ```

extension ContextExtension on BuildContext {
  // MediaQuery size
  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  // Navigator
  void pop<T extends Object?>([T? result]) => Navigator.of(this).pop(result);
  void push(Widget page) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
  void pushReplacement(Widget page) => Navigator.of(
    this,
  ).pushReplacement(MaterialPageRoute(builder: (_) => page));
  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    bool Function(Route<dynamic>)? predicate,
  }) {
    Navigator.of(this).pushNamedAndRemoveUntil(
      routeName,
      predicate ?? (route) => false,
      arguments: arguments,
    );
  }

  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }

  // Localization
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw Exception('AppLocalizations not found in context');
    }
    return localizations;
  }

  void showError(UIError error) {
    switch (error.runtimeType) {
      case const (ToasterUIError):
      case const (DialogUIError):
      case const (CustomUIError):
        showToastError(error.message);
      case const (ValidatorUIError):
        showToastError(error.message);
      default:
        showToastError('An unexpected error occurred: ${error.message}');
    }
  }
}
