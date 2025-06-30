part of 'extensions.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

/// Extension for [TextStyle] to provide additional styling methods
/// such as bold, italic, underline, strikethrough, size, and color.
/// Example usage:
/// ```dart
/// TextStyle style = TextStyle().bold.italic.size(16).color(Colors.red);
/// ```

extension TextStyleExtension on TextStyle {
  /// Apply bold to current TextStyle
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  /// Apply italic to current TextStyle
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);

  /// Apply underline
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);

  /// Apply strikethrough
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  /// Set custom font size
  TextStyle size(double size) => copyWith(fontSize: size);

  /// Set custom color
  TextStyle color(Color color) => copyWith(color: color);
}
