import 'package:flutter/material.dart';
import 'package:flutter_clean_blox_template/presentation/utils/radius_ext.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BorderRadiusExtension', () {
    const value = 10.0;

    test('radius should return BorderRadius.circular(value)', () {
      expect(value.radius, BorderRadius.circular(value));
    });

    test(
      'radiusAll should return BorderRadius.all(Radius.circular(value))',
      () {
        expect(value.radiusAll, BorderRadius.all(Radius.circular(value)));
      },
    );

    test('toRadius should return Radius.circular(value)', () {
      expect(value.toRadius, Radius.circular(value));
    });

    test('should support int type too', () {
      expect(5.radius, BorderRadius.circular(5));
      expect(5.radiusAll, BorderRadius.all(Radius.circular(5)));
      expect(5.toRadius, Radius.circular(5));
    });
  });
}
