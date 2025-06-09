import 'package:flutter/material.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

/// Extension for [num] to provide convenient methods for creating
/// [BorderRadius] and [Radius] objects.
////// Example usage:
/// ```dart
/// num value = 10;
/// BorderRadius radius = value.radius; // BorderRadius.circular(10)
/// BorderRadius allRadius = value.radiusAll; // BorderRadius.all(Radius.circular(10))
/// Radius singleRadius = value.toRadius; // Radius.circular(10)
/// ```
extension BorderRadiusExtension on num {
  /// BorderRadius.circular(value)
  BorderRadius get radius => BorderRadius.circular(toDouble());

  /// BorderRadius.all(Radius.circular(value))
  BorderRadius get radiusAll => BorderRadius.all(Radius.circular(toDouble()));

  /// Radius.circular(value) – digunakan di tempat tertentu
  Radius get toRadius => Radius.circular(toDouble());
}
