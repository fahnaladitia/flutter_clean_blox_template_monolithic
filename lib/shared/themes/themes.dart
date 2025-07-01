import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart';

class MaterialTheme {
  MaterialTheme._();

  static ThemeData light() {
    final primary = AppColor.primaryLight;
    final onPrimary = AppColor.onPrimaryLight;
    final surface = AppColor.surfaceLight;
    final onSurface = AppColor.onSurfaceLight;
    final onSurfaceVariant = AppColor.onSurfaceVariantLight;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primary,
      scaffoldBackgroundColor: surface,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: onPrimary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: onSurface,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: onPrimary,
        unselectedLabelColor: onSurface,
        indicatorColor: primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: onPrimary,
          backgroundColor: primary,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: onPrimary,
          backgroundColor: primary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? onSurface.withValues(alpha: 0.38)
                : primary,
          ),
          overlayColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? onSurface.withValues(alpha: 0.12)
                : primary.withValues(alpha: 0.12),
          ),

          splashFactory: InkSplash.splashFactory,
          side: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? BorderSide(color: onSurface.withValues(alpha: 0.38))
                : BorderSide(color: primary),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primary),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: onSurfaceVariant,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface.withValues(alpha: 0.38);
          }
          return primary;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface.withValues(alpha: 0.12);
          }
          return primary.withValues(alpha: 0.12);
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface;
          }
          return onPrimary;
        }),
        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return null;
          }
          if (states.contains(WidgetState.selected)) {
            return primary;
          }
          return null;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface.withValues(alpha: 0.12);
          }
          return primary.withValues(alpha: 0.12);
        }),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primary,
        primary: primary,
        onPrimary: onPrimary,
        surface: surface,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: primary,
        brightness: Brightness.light,
        scaffoldBackgroundColor: surface,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: onSurface),
        ),
        barBackgroundColor: primary,
        primaryContrastingColor: onPrimary,
      ),
    );
  }

  static ThemeData dark() {
    final primary = AppColor.primaryDark;
    final onPrimary = AppColor.onPrimaryDark;
    final surface = AppColor.surfaceDark;
    final onSurface = AppColor.onSurfaceDark;
    final onSurfaceVariant = AppColor.onSurfaceVariantDark;
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primary,
      scaffoldBackgroundColor: surface,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        foregroundColor: onPrimary,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: onSurface,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: onPrimary,
        unselectedLabelColor: onSurface,
        indicatorColor: primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: onPrimary,
          backgroundColor: primary,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          foregroundColor: onPrimary,
          backgroundColor: primary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? onSurface.withValues(alpha: 0.38)
                : primary,
          ),
          overlayColor: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? onSurface.withValues(alpha: 0.12)
                : primary.withValues(alpha: 0.38),
          ),
          splashFactory: InkSplash.splashFactory,
          side: WidgetStateProperty.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? BorderSide(color: onSurface.withValues(alpha: 0.38))
                : BorderSide(color: primary),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primary),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: onSurfaceVariant,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface.withValues(alpha: 0.38);
          }
          return primary;
        }),
        trackColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface.withValues(alpha: 0.12);
          }
          return primary.withValues(alpha: 0.38);
        }),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface.withValues(alpha: 0.38);
          }
          return onPrimary;
        }),

        fillColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface.withValues(alpha: 0.12);
          }
          if (states.contains(WidgetState.selected)) {
            return primary;
          }
          return null;
        }),
        overlayColor: WidgetStateProperty.resolveWith<Color>((
          Set<WidgetState> states,
        ) {
          if (states.contains(WidgetState.disabled)) {
            return onSurface.withValues(alpha: 0.12);
          }
          return primary.withValues(alpha: 0.38);
        }),
      ),
      colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: primary,
        primary: primary,
        onPrimary: onPrimary,
        surface: surface,
        onSurface: onSurface,
        onSurfaceVariant: onSurfaceVariant,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: primary,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: surface,
        textTheme: CupertinoTextThemeData(
          textStyle: TextStyle(color: onSurface),
        ),
        barBackgroundColor: primary,
        primaryContrastingColor: onPrimary,
      ),
    );
  }
}
