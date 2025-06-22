import 'package:flutter_clean_blox_template/presentation/utils/date_time.ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateTimeExtension.display', () {
    test('should return default format "dd MMM yyyy"', () {
      final date = DateTime(2023, 6, 9);
      final result = date.display();
      expect(result, '09 Jun 2023');
    });

    test('should return custom format when provided', () {
      final date = DateTime(2025, 1, 1, 14, 30);
      final result = date.display('yyyy-MM-dd HH:mm');
      expect(result, '2025-01-01 14:30');
    });
  });
}
