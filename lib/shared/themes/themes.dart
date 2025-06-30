import 'dart:convert';

import 'package:flutter_clean_blox_template/core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';

class MaterialTheme {
  MaterialTheme._();

  static const String lightThemeInstance = 'light';
  static const String darkThemeInstance = 'dark';

  static ThemeData light() {
    return sl.get<ThemeData>(instanceName: lightThemeInstance);
  }

  static ThemeData dark() {
    return sl.get<ThemeData>(instanceName: darkThemeInstance);
  }

  static Future<ThemeData?> loadLightTheme() async {
    final themeStr = await rootBundle.loadString(
      'assets/themes/appainter_theme_light.json',
    );
    final themeJson = jsonDecode(themeStr);
    final theme = ThemeDecoder.decodeThemeData(themeJson);
    return theme;
  }

  static Future<ThemeData?> loadDarkTheme() async {
    final themeStr = await rootBundle.loadString(
      'assets/themes/appainter_theme_dark.json',
    );
    final themeJson = jsonDecode(themeStr);
    final theme = ThemeDecoder.decodeThemeData(themeJson);
    return theme;
  }
}
