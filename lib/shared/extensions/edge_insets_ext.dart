part of 'extensions.dart';

/// =========================================================
/// Created by Pahnal Aditia
/// GitHub  : https://github.com/pahnaladitia
/// LinkedIn: https://www.linkedin.com/in/pahnaladitia
/// =========================================================

/// Extension on `num` to simplify creation of [EdgeInsets].
///
/// Example usage:
/// ```dart
/// Padding(
///   padding: 16.edgeAll,
///   child: Text('Hello'),
/// )
/// ```
extension EdgeInsetsExtension on num {
  /// Creates `EdgeInsets.all(value)`
  EdgeInsets get edgeAll => EdgeInsets.all(toDouble());

  /// Creates `EdgeInsets.symmetric(vertical: value)`
  EdgeInsets get edgeVertical => EdgeInsets.symmetric(vertical: toDouble());

  /// Creates `EdgeInsets.symmetric(horizontal: value)`
  EdgeInsets get edgeHorizontal => EdgeInsets.symmetric(horizontal: toDouble());

  /// Creates `EdgeInsets.only(left: value)`
  EdgeInsets get edgeLeft => EdgeInsets.only(left: toDouble());

  /// Creates `EdgeInsets.only(right: value)`
  EdgeInsets get edgeRight => EdgeInsets.only(right: toDouble());

  /// Creates `EdgeInsets.only(top: value)`
  EdgeInsets get edgeTop => EdgeInsets.only(top: toDouble());

  /// Creates `EdgeInsets.only(bottom: value)`
  EdgeInsets get edgeBottom => EdgeInsets.only(bottom: toDouble());

  /// Creates `EdgeInsets.fromLTRB(value, value, value, value)`
  EdgeInsets get edgeLTRB =>
      EdgeInsets.fromLTRB(toDouble(), toDouble(), toDouble(), toDouble());
}
