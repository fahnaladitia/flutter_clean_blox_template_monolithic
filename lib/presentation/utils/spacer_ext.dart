import 'package:flutter/material.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

/// Adds shorthand extensions on `num` for creating spacing widgets (SizedBox).
///
/// Example usage:
/// ```dart
/// Column(
///   children: [
///     Text('Hello'),
///     16.paddingY,
///     Text('World'),
///   ],
/// );
/// ```
extension SpacerExtension on num {
  /// Creates a vertical spacer with the given height.
  /// This is useful for adding space between widgets in a column.
  /// Example usage: `10.paddingY` will create a vertical spacer of 10 pixels.
  /// Returns a [SizedBox] with the specified height.
  /// ```dart
  /// SizedBox height = 10.paddingY;
  /// ```
  ///
  SizedBox get paddingY => SizedBox(height: toDouble());

  /// Creates a horizontal spacer with the given width.
  /// This is useful for adding space between widgets in a row.
  /// Example usage: `10.paddingX` will create a horizontal spacer of 10 pixels.
  /// Returns a [SizedBox] with the specified width.
  /// ```dart
  /// SizedBox width = 10.paddingX;
  /// ```
  ///
  SizedBox get paddingX => SizedBox(width: toDouble());

  /// Creates a square spacer with the given size for both height and width.
  /// This is useful for creating equal spacing in both dimensions.
  /// Example usage: `10.paddingXY` will create a square spacer of 10 pixels.
  /// Returns a [SizedBox] with both height and width set to the specified size.
  /// ```dart
  /// SizedBox square = 1.paddingXY;
  /// ```
  ///
  SizedBox get paddingXY => SizedBox(height: toDouble(), width: toDouble());
}
