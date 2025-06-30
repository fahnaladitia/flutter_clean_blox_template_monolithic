import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_blox_template/shared/shared.dart'; // Ganti sesuai path extension kamu

void main() {
  group('BorderRadiusExtension', () {
    test('radius returns BorderRadius.circular with correct value', () {
      const value = 10.0;
      final result = value.radius;
      expect(result, BorderRadius.circular(10.0));
    });

    test('radiusAll returns BorderRadius.all with correct Radius.circular', () {
      const value = 8.0;
      final result = value.radiusAll;
      expect(result, BorderRadius.all(const Radius.circular(8.0)));
    });

    test('toRadius returns Radius.circular with correct value', () {
      const value = 12.5;
      final result = value.toRadius;
      expect(result, const Radius.circular(12.5));
    });
  });
}
