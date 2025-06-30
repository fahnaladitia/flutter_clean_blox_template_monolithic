import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // ganti dengan path extension jika beda

void main() {
  group('DateTimeExtension.display()', () {
    test('should return default formatted string (dd MMM yyyy)', () {
      // ARRANGE
      final date = DateTime(2023, 12, 25);

      // ACT
      final result = date.display();

      // ASSERT
      expect(result, DateFormat('dd MMM yyyy').format(date));
    });

    test('should return formatted string with custom format (yyyy-MM-dd)', () {
      // ARRANGE
      final date = DateTime(2024, 1, 1);

      // ACT
      final result = date.display('yyyy-MM-dd');

      // ASSERT
      expect(result, '2024-01-01');
    });

    test('should return formatted string with time (dd/MM/yyyy HH:mm)', () {
      // ARRANGE
      final date = DateTime(2024, 6, 27, 14, 30);

      // ACT
      final result = date.display('dd/MM/yyyy HH:mm');

      // ASSERT
      expect(result, '27/06/2024 14:30');
    });
  });
}
